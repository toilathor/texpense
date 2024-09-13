import 'package:json_annotation/json_annotation.dart';

part 'pubspec.g.dart';

@JsonSerializable(anyMap: true)
class Pubspec {
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "flutter_code_gen")
  final FlutterCodeGen? flutterCodeGen;
  @JsonKey(name: "flutter")
  final Flutter? flutter;

  Pubspec({
    this.name,
    this.flutterCodeGen,
    this.flutter,
  });

  Pubspec copyWith({
    String? name,
    FlutterCodeGen? flutterCodeGen,
    Flutter? flutter,
  }) =>
      Pubspec(
        name: name ?? this.name,
        flutterCodeGen: flutterCodeGen ?? this.flutterCodeGen,
        flutter: flutter ?? this.flutter,
      );

  factory Pubspec.fromJson(Map<dynamic, dynamic> json) =>
      _$PubspecFromJson(json);

  Map<String, dynamic> toJson() => _$PubspecToJson(this);
}

@JsonSerializable(anyMap: true)
class Flutter {
  @JsonKey(name: "assets")
  final List<String>? assets;

  Flutter({
    this.assets,
  });

  Flutter copyWith({
    List<String>? assets,
  }) =>
      Flutter(
        assets: assets ?? this.assets,
      );

  factory Flutter.fromJson(Map<dynamic, dynamic> json) =>
      _$FlutterFromJson(json);

  Map<String, dynamic> toJson() => _$FlutterToJson(this);
}

@JsonSerializable(anyMap: true)
class FlutterCodeGen {
  @JsonKey(name: "output")
  final String? output;
  @JsonKey(name: "line_length")
  final int? lineLength;
  @JsonKey(name: "parse_metadata")
  final bool? parseMetadata;
  @JsonKey(name: "icon_ico_moon")
  final IconIcoMoon? iconIcoMoon;

  FlutterCodeGen({
    this.output,
    this.lineLength,
    this.parseMetadata,
    this.iconIcoMoon,
  });

  FlutterCodeGen copyWith({
    String? output,
    int? lineLength,
    bool? parseMetadata,
    IconIcoMoon? iconIcoMoon,
  }) =>
      FlutterCodeGen(
        output: output ?? this.output,
        lineLength: lineLength ?? this.lineLength,
        parseMetadata: parseMetadata ?? this.parseMetadata,
        iconIcoMoon: iconIcoMoon ?? this.iconIcoMoon,
      );

  factory FlutterCodeGen.fromJson(Map<dynamic, dynamic> json) =>
      _$FlutterCodeGenFromJson(json);

  Map<String, dynamic> toJson() => _$FlutterCodeGenToJson(this);
}

@JsonSerializable(anyMap: true)
class IconIcoMoon {
  @JsonKey(name: "enabled")
  final bool? enabled;
  @JsonKey(name: "inputs")
  final List<String>? inputs;
  @JsonKey(name: "outputs")
  final Outputs? outputs;

  IconIcoMoon({
    this.enabled,
    this.inputs,
    this.outputs,
  });

  IconIcoMoon copyWith({
    bool? enabled,
    List<String>? inputs,
    Outputs? outputs,
  }) =>
      IconIcoMoon(
        enabled: enabled ?? this.enabled,
        inputs: inputs ?? this.inputs,
        outputs: outputs ?? this.outputs,
      );

  factory IconIcoMoon.fromJson(Map<dynamic, dynamic> json) =>
      _$IconIcoMoonFromJson(json);

  Map<String, dynamic> toJson() => _$IconIcoMoonToJson(this);
}

@JsonSerializable(anyMap: true)
class Outputs {
  @JsonKey(name: "class_name")
  final String? className;
  @JsonKey(name: "font_family")
  final String? fontFamily;

  Outputs({
    this.className,
    this.fontFamily,
  });

  Outputs copyWith({
    String? className,
    String? fontFamily,
  }) =>
      Outputs(
        className: className ?? this.className,
        fontFamily: fontFamily ?? this.fontFamily,
      );

  factory Outputs.fromJson(Map<dynamic, dynamic> json) =>
      _$OutputsFromJson(json);

  Map<String, dynamic> toJson() => _$OutputsToJson(this);
}
