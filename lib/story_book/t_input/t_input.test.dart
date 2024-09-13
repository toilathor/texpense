import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:texpense/common/t_input/t_input.dart';
import 'package:texpense/gen/colors.gen.dart';

@RoutePage(name: "TInputScreen")
class TInputView extends StatefulWidget {
  const TInputView({super.key});

  @override
  State<TInputView> createState() => _TInputViewState();
}

class _TInputViewState extends State<TInputView> {
  final FocusNode _focusNode = FocusNode();

  late ValueNotifier<TInputConfigs> _configs;

  @override
  void initState() {
    _configs = ValueNotifier<TInputConfigs>(
      TInputConfigs(
        labelText: "Label",
        hintText: "Hint",
        focusNode: _focusNode,
        onTapOutside: (event) {
          _focusNode.unfocus();
        },
        autovalidateMode: AutovalidateMode.always,
        textInputAction: TextInputAction.next,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("T Input")),
      body: ValueListenableBuilder(
        valueListenable: _configs,
        builder: (context, value, child) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TInput(configs: value),
              ),
              Expanded(
                child: Container(
                  color: AppColors.color2b2b2b,
                  child: ListView(
                    children: [
                      ListTile(
                        title: const Text(
                          "Disabled/Enabled",
                          style: TextStyle(color: Colors.white),
                        ),
                        trailing: Switch(
                          value: value.enabled != false,
                          onChanged: (value) {
                            _configs.value = _configs.value.copyWith(
                              enabled: value ? null : false,
                            );
                          },
                        ),
                      ),
                      ListTile(
                        title: DropdownMenu(
                          initialSelection: TextInputAction.none,
                          dropdownMenuEntries: TextInputAction.values
                              .map(
                                (e) => DropdownMenuEntry(
                                  label: "$e",
                                  value: e,
                                  style: ButtonStyle(
                                    foregroundColor: OutlinedButton.styleFrom(
                                      foregroundColor: Colors.red,
                                    ).foregroundColor,
                                  ),
                                ),
                              )
                              .toList(),
                          expandedInsets: EdgeInsets.zero,
                          textStyle: const TextStyle(color: Colors.red),
                          enableFilter: true,
                          label: const Text("Type Input Action"),
                          requestFocusOnTap: true,
                          controller: TextEditingController(),
                          menuStyle: MenuStyle(
                            backgroundColor: OutlinedButton.styleFrom(
                              backgroundColor: AppColors.color2b2b2b,
                            ).backgroundColor,
                          ),
                          menuHeight: MediaQuery.of(context).size.height * 0.5,
                          onSelected: (value) {
                            _configs.value = _configs.value.copyWith(
                              textInputAction: value,
                            );
                          },
                        ),
                      ),
                      ListTile(
                        title: DropdownMenu(
                          dropdownMenuEntries: AutovalidateMode.values
                              .map(
                                (e) => DropdownMenuEntry(
                                  label: "$e",
                                  value: e,
                                  style: ButtonStyle(
                                    foregroundColor: OutlinedButton.styleFrom(
                                      foregroundColor: Colors.red,
                                    ).foregroundColor,
                                  ),
                                ),
                              )
                              .toList(),
                          expandedInsets: EdgeInsets.zero,
                          textStyle: const TextStyle(color: Colors.red),
                          enableFilter: true,
                          label: const Text("Auto Validation Mode"),
                          requestFocusOnTap: true,
                          controller: TextEditingController(),
                          menuStyle: MenuStyle(
                            backgroundColor: OutlinedButton.styleFrom(
                              backgroundColor: AppColors.color2b2b2b,
                            ).backgroundColor,
                          ),
                          menuHeight: MediaQuery.of(context).size.height * 0.5,
                          onSelected: (value) {
                            _configs.value = _configs.value.copyWith(
                              autovalidateMode: value,
                            );
                          },
                        ),
                      ),
                      ListTile(
                        title: const Text(
                          "Has Validation",
                          style: TextStyle(color: Colors.white),
                        ),
                        trailing: Switch(
                          value: value.validator != null,
                          onChanged: (value) {
                            _configs.value = _configs.value.copyWith(
                              validator: value
                                  ? (p0) {
                                      return "Input invalid";
                                    }
                                  : null,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
