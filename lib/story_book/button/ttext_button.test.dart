import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:texpense/common/buttons/ttext_button/ttext_button.dart';
import 'package:texpense/gen/colors.gen.dart';

ValueNotifier<TTextButtonConfigs> _configs = ValueNotifier<TTextButtonConfigs>(
  TTextButtonConfigs(
    label: const Text("Label"),
    onPressed: () {
      toast("Your are pressed me!");
    },
  ),
);

@RoutePage(name: "TTextButtonScreen")
class TTextButtonView extends StatelessWidget {
  const TTextButtonView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TText Button"),
      ),
      body: ValueListenableBuilder(
        valueListenable: _configs,
        builder: (context, value, child) {
          return Column(
            children: [
              const Gap(16),
              TTextButton(
                configs: value,
              ),
              const Gap(16),
              Expanded(
                child: Container(
                  color: AppColors.color2b2b2b,
                  child: ListView(
                    children: [
                      ListTile(
                        title: const Text(
                          "Icon",
                          style: TextStyle(color: Colors.white),
                        ),
                        trailing: Switch(
                          value: value.icon != null,
                          onChanged: (value) {
                            _configs.value = _configs.value.copyWith(
                              icon: value ? const Icon(Icons.add) : null,
                            );
                          },
                        ),
                      ),
                      ListTile(
                        title: const Text(
                          "Type Loose/Expand",
                          style: TextStyle(color: Colors.white),
                        ),
                        trailing: Switch(
                          value: value.type == TTextButtonType.expand,
                          onChanged: (value) {
                            _configs.value = _configs.value.copyWith(
                              type: value
                                  ? TTextButtonType.expand
                                  : TTextButtonType.loose,
                            );
                          },
                        ),
                      ),
                      ListTile(
                        title: const Text(
                          "State Disabled/Enabled",
                          style: TextStyle(color: Colors.white),
                        ),
                        trailing: Switch(
                          value: value.state == TTextButtonState.enabled,
                          onChanged: (value) {
                            _configs.value = _configs.value.copyWith(
                              state: value
                                  ? TTextButtonState.enabled
                                  : TTextButtonState.disabled,
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
