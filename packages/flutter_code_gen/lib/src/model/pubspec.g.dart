// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pubspec.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pubspec _$PubspecFromJson(Map json) => Pubspec(
      name: json['name'] as String?,
      flutterCodeGen: json['flutter_code_gen'] == null
          ? null
          : FlutterCodeGen.fromJson(json['flutter_code_gen'] as Map),
      flutter: json['flutter'] == null
          ? null
          : Flutter.fromJson(json['flutter'] as Map),
    );

Map<String, dynamic> _$PubspecToJson(Pubspec instance) => <String, dynamic>{
      'name': instance.name,
      'flutter_code_gen': instance.flutterCodeGen,
      'flutter': instance.flutter,
    };

Flutter _$FlutterFromJson(Map json) => Flutter(
      assets:
          (json['assets'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$FlutterToJson(Flutter instance) => <String, dynamic>{
      'assets': instance.assets,
    };

FlutterCodeGen _$FlutterCodeGenFromJson(Map json) => FlutterCodeGen(
      output: json['output'] as String?,
      lineLength: (json['line_length'] as num?)?.toInt(),
      parseMetadata: json['parse_metadata'] as bool?,
      iconIcoMoon: json['icon_ico_moon'] == null
          ? null
          : IconIcoMoon.fromJson(json['icon_ico_moon'] as Map),
    );

Map<String, dynamic> _$FlutterCodeGenToJson(FlutterCodeGen instance) =>
    <String, dynamic>{
      'output': instance.output,
      'line_length': instance.lineLength,
      'parse_metadata': instance.parseMetadata,
      'icon_ico_moon': instance.iconIcoMoon,
    };

IconIcoMoon _$IconIcoMoonFromJson(Map json) => IconIcoMoon(
      enabled: json['enabled'] as bool?,
      inputs:
          (json['inputs'] as List<dynamic>?)?.map((e) => e as String).toList(),
      outputs: json['outputs'] == null
          ? null
          : Outputs.fromJson(json['outputs'] as Map),
    );

Map<String, dynamic> _$IconIcoMoonToJson(IconIcoMoon instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
      'inputs': instance.inputs,
      'outputs': instance.outputs,
    };

Outputs _$OutputsFromJson(Map json) => Outputs(
      className: json['class_name'] as String?,
      fontFamily: json['font_family'] as String?,
    );

Map<String, dynamic> _$OutputsToJson(Outputs instance) => <String, dynamic>{
      'class_name': instance.className,
      'font_family': instance.fontFamily,
    };
