part of 't_input.dart';

@freezed
class TInputConfigs with _$TInputConfigs {
  const factory TInputConfigs({
    String? labelText,
    String? hintText,
    String? initialValue,
    FocusNode? focusNode,
    TextEditingController? controller,
    TextInputType? keyboardType,
    @Default(TextCapitalization.none) TextCapitalization textCapitalization,
    TextInputAction? textInputAction,
    AutovalidateMode? autovalidateMode,
    TextStyle? style,
    @Default(false) bool autofocus,
    @Default(false) bool readOnly,
    @Default('•') String obscuringCharacter,
    @Default(false) bool obscureText,
    @Default(true) bool autocorrect,
    @Default(true) bool enableSuggestions,
    @Default(1) int? maxLines,
    int? minLines,
    @Default(false) bool expands,
    int? maxLength,
    void Function(String)? onChanged,
    GestureTapCallback? onTap,
    TapRegionCallback? onTapOutside,
    VoidCallback? onEditingComplete,
    ValueChanged<String>? onFieldSubmitted,
    void Function(String?)? onSaved,
    String? Function(String?)? validator,
    List<TextInputFormatter>? inputFormatters,
    bool? enabled,
  }) = _TInputConfigs;
}
