import 'package:code_builder/code_builder.dart';
import 'package:flutter_code_gen/src/model/icomoon_model.dart';
import 'package:flutter_code_gen/src/model/pubspec.dart';
import 'package:flutter_code_gen/src/utils/constants.dart';
import 'package:flutter_code_gen/src/utils/logger.dart';
import 'package:recase/recase.dart';

class CodeBuilderHelper {
  static CodeBuilderHelper? _instance;

  CodeBuilderHelper._internal();

  static CodeBuilderHelper get instance {
    if (_instance == null) {
      _instance = CodeBuilderHelper._internal();
    }
    return _instance!;
  }

  Class createClass(Map<String, dynamic> data, String fontFamily,
      {String? className, String? fontPackage}) {
    final List<IcoMoonModel> icoMoons = data["icons"]
        ?.map<IcoMoonModel>((e) => IcoMoonModel.fromMap(e?["properties"] ?? {}))
        .toList();

    final List<Method> iconData = icoMoons
        .map<Method>(
          (e) => Method(
            (p0) => p0
              ..static = true
              ..returns = refer('IconData', 'package:flutter/widgets.dart')
              ..type = MethodType.getter
              ..name = ReCase(e.name ?? '').camelCase
              ..lambda = true
              ..body = Code(e.toIconDataString()),
          ),
        )
        .toList();

    Method values = Method(
      (p0) => p0
        ..static = true
        ..returns = refer('List<IconData>', 'package:flutter/widgets.dart')
        ..type = MethodType.getter
        ..name = "values"
        ..lambda = true
        ..body = Code(
          icoMoons
              .map((e) => ReCase(e.name ?? '').camelCase)
              .toList()
              .toString(),
        ),
    );

    Method mFontFamily = Method(
      (p0) => p0
        ..static = true
        ..returns = refer('String')
        ..type = MethodType.getter
        ..name = "_fontFamily"
        ..lambda = true
        ..body = Code("'$fontFamily'"),
    );

    return Class(
      (b) => b
        ..name =
            ReCase(className ?? Constants.iconFontNameClassDefault).pascalCase
        ..constructors.add(Constructor((p0) => p0..name = "_"))
        ..methods.addAll([
          mFontFamily,
          ...iconData,
          values,
        ]),
    );
  }

  String createValue(Map<String, dynamic> data, String fontFamily,
      {String? className, String? fontPackage}) {
    final library = Library(
      (b) => b.body
        ..add(
          createClass(
            data,
            fontFamily,
            fontPackage: fontPackage,
            className: className,
          ),
        ),
    ).accept(DartEmitter(allocator: Allocator()));

    final rawCode = '${Constants.warningNotModify}\n'
        '${library..toString()}';

    final formattedCode = Constants.formatter.format(rawCode);
    return formattedCode;
  }

  bool validateInput(Pubspec pubspec) {
    if (pubspec.flutterCodeGen?.iconIcoMoon?.outputs?.fontFamily?.isNotEmpty !=
        true) {
      printC('ICON_ICO_MOON font family is required', color: PrintColor.red);
      return false;
    } else if (pubspec.flutterCodeGen?.iconIcoMoon?.inputs?.isNotEmpty !=
        true) {
      printC(
        'ICON_ICO_MOON assets input IcoMoon is empty',
        color: PrintColor.yellow,
      );
      printC(
        'Refer to the default config file: https://github.com/toilathor/texpense/tree/master/packages/flutter_code_gen/lib/utils/config_default.dart',
        color: PrintColor.yellow,
      );
      return false;
    }

    return true;
  }
}
