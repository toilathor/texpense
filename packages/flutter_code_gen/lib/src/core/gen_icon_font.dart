import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:build/build.dart';
import 'package:flutter_code_gen/src/model/pubspec.dart';
import 'package:flutter_code_gen/src/utils/code_builder_helper.dart';
import 'package:flutter_code_gen/src/utils/constants.dart';
import 'package:flutter_code_gen/src/utils/file_utils.dart';
import 'package:flutter_code_gen/src/utils/logger.dart';
import 'package:glob/glob.dart';

class GenIconFont implements Builder {
  final BuilderOptions options;

  GenIconFont(this.options) {
    _pubspec = FileUtils.loadPubspecConfig(File("pubspec.yaml"));
    _inputPaths =
        _flutterCodeGen?.iconIcoMoon?.inputs?.toSet().where((element) {
              if (File(element).existsSync()) {
                return true;
              }
              printC(
                "[ERROR] - FlutterCodeGent - $element is not existed",
                color: PrintColor.red,
              );
              return false;
            }).toList() ??
            [];

    final outputPathTmp = _flutterCodeGen?.output ?? "";

    _outputPath = File(outputPathTmp).existsSync()
        ? outputPathTmp
        : Constants.pathOutputDefault;
  }

  late final Pubspec _pubspec;
  late final List<String> _inputPaths;
  late final String _outputPath;

  FlutterCodeGen? get _flutterCodeGen => _pubspec.flutterCodeGen;

  /// Đây là hàm sẽ được gọi khi chạy build runner
  @override
  Future<void> build(BuildStep buildStep) async {
    printC(
      "\n_________START_GEN_FONT_ICON__________",
      color: PrintColor.green,
    );
    printC(
      "- pathInput: ${buildStep.inputId}"
      "\n- allowedOutputs: ${buildStep.allowedOutputs}",
      color: PrintColor.magenta,
    );

    if (!CodeBuilderHelper.instance.validateInput(_pubspec)) return;

    for (var element in _inputPaths) {
      try {
        final allowedOutputs = await buildStep.findAssets(Glob(element)).single;
        await buildStep.digest(allowedOutputs);
      } on Exception catch (e) {
        printC(e, color: PrintColor.red);
      } finally {
        // GET CONTENT FILE -> PARSE DATA
        final contents = await FileUtils.readFile(element);
        final contentFile = jsonDecode(contents) as Map<String, dynamic>;

        if (!contentFile.keys.contains("IcoMoonType")) return;

        await buildStep.writeAsString(
          buildStep.allowedOutputs.elementAt(_inputPaths.indexOf(element)),
          CodeBuilderHelper.instance.createValue(
            contentFile,
            _flutterCodeGen?.iconIcoMoon?.outputs?.fontFamily ?? "",
            className: _flutterCodeGen?.iconIcoMoon?.outputs?.className ?? "",
          ),
        );
      }
    }

    printC(
      "_________GEN_FONT_ICON_FINISHED__________",
      color: PrintColor.green,
    );
  }

  @override
  Map<String, List<String>> get buildExtensions {
    return {
      r'lib/$lib$': _inputPaths.length == 1
          ? ["${_outputPath}/icon_font.gen.dart"]
          : _inputPaths
              .asMap()
              .map<int, String>((index, value) => MapEntry(
                    index,
                    "${_outputPath}/icon_font_${index}.gen.dart",
                  ))
              .values
              .toList()
    };
  }
}
