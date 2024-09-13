part of 'ttext_button.dart';

@freezed
class TTextButtonConfigs with _$TTextButtonConfigs {
  const factory TTextButtonConfigs({
    Widget? icon,
    required Widget label,
    @Default(TTextButtonType.loose) TTextButtonType type,
    @Default(TTextButtonState.$default) TTextButtonState state,
    void Function()? onPressed,
  }) = _TTextButtonConfigs;
}
