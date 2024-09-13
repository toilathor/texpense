import 'package:dart_style/dart_style.dart';

class Constants {
  static String pathOutputDefault = "lib/gen/";
  static String fileExtension = ".gen.dart";
  static String iconFontNameFile = "icon_font";
  static String iconFontNameClassDefault = "AppIcoMoon";
  static DartFormatter formatter = DartFormatter();

  static String warningNotModify = """
/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterCodeGen - By toilathor
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use
  """;
}
