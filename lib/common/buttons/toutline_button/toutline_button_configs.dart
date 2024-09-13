part of 'toutline_button.dart';

@freezed
class TOutlineButtonConfigs with _$TOutlineButtonConfigs {
  const factory TOutlineButtonConfigs({
    Widget? icon,
    required Widget label,
    @Default(TOutlineButtonType.loose) TOutlineButtonType type,
    @Default(TOutlineButtonState.$default) TOutlineButtonState state,
    void Function()? onPressed,
  }) = _TOutlineButtonConfigs;
}
