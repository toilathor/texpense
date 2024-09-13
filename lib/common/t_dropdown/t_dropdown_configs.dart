part of 't_dropdown.dart';

@freezed
class TDropDownConfigs<T> with _$TDropDownConfigs<T> {
  const factory TDropDownConfigs({
    required List<T> items,
    @Default(true) bool enabled,
    Widget? label,
    TextEditingController? controller,
    void Function(T?)? onSelected,
    bool? requestFocusOnTap,
    @Default(false) bool enableFilter,
    T? initialSelection,
  }) = _TDropDownConfigs;
}
