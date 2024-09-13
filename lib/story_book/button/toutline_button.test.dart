import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:texpense/common/buttons/toutline_button/toutline_button.dart';
import 'package:texpense/gen/colors.gen.dart';

ValueNotifier<TOutlineButtonConfigs> _configs =
    ValueNotifier<TOutlineButtonConfigs>(
  TOutlineButtonConfigs(
    label: const Text("Label"),
    onPressed: () {
      toast("Your are pressed me!");
    },
  ),
);

@RoutePage(name: "TOutlineButtonScreen")
class TOutlineButtonView extends StatelessWidget {
  const TOutlineButtonView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TOutline Button"),
      ),
      body: ValueListenableBuilder(
        valueListenable: _configs,
        builder: (context, value, child) {
          return Column(
            children: [
              const Gap(16),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TOutlineButton(
                  configs: value,
                ),
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
                          value: value.type == TOutlineButtonType.expand,
                          onChanged: (value) {
                            _configs.value = _configs.value.copyWith(
                              type: value
                                  ? TOutlineButtonType.expand
                                  : TOutlineButtonType.loose,
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
                          value: value.state == TOutlineButtonState.enabled,
                          onChanged: (value) {
                            _configs.value = _configs.value.copyWith(
                              state: value
                                  ? TOutlineButtonState.enabled
                                  : TOutlineButtonState.disabled,
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
