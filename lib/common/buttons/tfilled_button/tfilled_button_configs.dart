part of 'tfilled_button.dart';

@freezed
class TFilledButtonConfigs with _$TFilledButtonConfigs {
  const factory TFilledButtonConfigs({
    Widget? icon,
    required Widget label,
    @Default(TFilledButtonType.loose) TFilledButtonType type,
    @Default(TFilledButtonState.$default) TFilledButtonState state,
    void Function()? onPressed,
  }) = _TFilledButtonConfigs;
}
