class IcoMoonModel {
  final String? name;
  final int? prevSize;
  final int? code;

  IcoMoonModel({
    this.name,
    this.prevSize,
    this.code,
  });

  IcoMoonModel copyWith({
    String? name,
    int? prevSize,
    int? code,
  }) =>
      IcoMoonModel(
        name: name ?? this.name,
        prevSize: prevSize ?? this.prevSize,
        code: code ?? this.code,
      );

  factory IcoMoonModel.fromMap(Map<String, dynamic> json) => IcoMoonModel(
        name: json["name"],
        prevSize: json["prevSize"],
        code: json["code"],
      );

  String toIconDataString() {
    final String? codePoint = code?.toRadixString(16);
    if (codePoint == null) return "";

    return "IconData(0x$codePoint, fontFamily: _fontFamily)";
  }
}
