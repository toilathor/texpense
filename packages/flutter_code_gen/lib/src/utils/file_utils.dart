import 'dart:io';

import 'package:flutter_code_gen/src/model/pubspec.dart';
import 'package:flutter_code_gen/src/utils/config_default.dart';
import 'package:flutter_code_gen/src/utils/constants.dart';
import 'package:flutter_code_gen/src/utils/map.dart';
import 'package:yaml/yaml.dart';

class FileUtils {
  static Future<String> readFile(String path) async {
    final File file = File(path);
    return await file.readAsString();
  }

  static Future removeFile(String path) async {
    final File file = File(path);
    if (!file.existsSync()) return;
    await file.delete();
  }

  static Future removeFolder(String path) async {
    final Directory dir = Directory(path);
    if (!dir.existsSync()) return;
    await dir.delete(recursive: true);
  }

  static Future<void> writeAndFormat(String data, String path) async {
    try {
      writeAsStringPath(Constants.formatter.format(data), path);
    } catch (e) {
      writeAsStringPath(data, path);
    }
  }

  static Future<void> writeAsStringPath(String text, String path) async {
    final file = File(path);
    if (!file.existsSync()) {
      file.createSync(recursive: true);
    }
    file.writeAsStringSync(text);

    stdout.writeln("Generated: ${path}");
  }

  static Pubspec loadPubspecConfig(File pubspecFile) {
    final content = pubspecFile.readAsStringSync();
    final userMap = loadYaml(content) as Map?;
    final defaultMap = loadYaml(configDefaultYamlContent) as Map?;
    final mergedMap = mergeMap([defaultMap, userMap]);
    return Pubspec.fromJson(mergedMap);
  }
}
