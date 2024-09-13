part of 't_divider.dart';

@freezed
class TDividerConfigs with _$TDividerConfigs {
  const factory TDividerConfigs({
    TDividerType? type,
    @Default(1.0) double width,
    @Default(1.0) double strokeWidth,
    @Default(Colors.black) Color color,
    @Default(EdgeInsets.zero) EdgeInsetsGeometry padding,
  }) = _TDividerConfigs;
}
