import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:texpense/common/t_dropdown/t_dropdown.dart';
import 'package:texpense/gen/colors.gen.dart';

@RoutePage(name: "TDropDownScreen")
class TDropDownView extends StatefulWidget {
  const TDropDownView({super.key});

  @override
  State<TDropDownView> createState() => _TDropDownViewState();
}

class _TDropDownViewState extends State<TDropDownView> {
  late ValueNotifier<TDropDownConfigs> _configs;

  @override
  void initState() {
    _configs = ValueNotifier<TDropDownConfigs>(
      const TDropDownConfigs(
        items: [
          "Option1",
          "Option2",
          "Option3",
          "Option4",
          "Option5",
          "Option6",
          "Option7",
          "Option8",
          "Option9",
          "Option10",
        ],
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("T Dropdown")),
      body: ValueListenableBuilder(
        valueListenable: _configs,
        builder: (context, value, child) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TDropDown(configs: value),
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
                          value: value.enabled,
                          onChanged: (value) {
                            _configs.value = _configs.value.copyWith(
                              enabled: value,
                            );
                          },
                        ),
                      ),
                      ListTile(
                        title: const Text(
                          "Label",
                          style: TextStyle(color: Colors.white),
                        ),
                        trailing: Switch(
                          value: value.label != null,
                          onChanged: (value) {
                            _configs.value = _configs.value.copyWith(
                              label: value ? const Text("Label") : null,
                            );
                          },
                        ),
                      ),
                      ListTile(
                        title: const Text(
                          "requestFocusOnTap",
                          style: TextStyle(color: Colors.white),
                        ),
                        trailing: Switch(
                          value: value.requestFocusOnTap == true,
                          onChanged: (value) {
                            _configs.value = _configs.value.copyWith(
                              requestFocusOnTap: value,
                            );
                          },
                        ),
                      ),
                      ListTile(
                        title: const Text(
                          "enableFilter",
                          style: TextStyle(color: Colors.white),
                        ),
                        trailing: Switch(
                          value: value.enableFilter,
                          onChanged: (value) {
                            _configs.value = _configs.value.copyWith(
                              enableFilter: value,
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
