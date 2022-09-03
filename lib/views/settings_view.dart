import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:settings_ui/settings_ui.dart';

import '../cubits/settings_cubit.dart';
import '../models/settings_model.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsModel>(
        builder: (context, state) => SettingsList(
              sections: [
                SettingsSection(
                  title: const Text("Theme"),
                  tiles: [
                    SettingsTile(
                      title: const Text("Select theme color"),
                      onPressed: (context) {
                        showDialog(
                          context: context,
                          builder: (dialogContext) {
                            return AlertDialog(
                              title: const Text('Select theme color'),
                              content: SingleChildScrollView(
                                child: BlockPicker(
                                  useInShowDialog: true,
                                  pickerColor: Color(state.color),
                                  onColorChanged: (value) async {
                                    var navigator = Navigator.of(dialogContext);
                                    await context.read<SettingsCubit>().edit(state.copyWith(color: value.value));
                                    navigator.pop();
                                  },
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
                SettingsSection(
                  title: const Text("Pacings"),
                  tiles: [
                    SettingsTile.switchTile(
                      initialValue: state.enablePaddingDuration,
                      onToggle: (value) async => await context.read<SettingsCubit>().edit(state.copyWith(enablePaddingDuration: value)),
                      title: const Text("Enable padding duration"),
                    ),
                    SettingsTile(
                      title: const Text("Padding duration"),
                      value: Text("${state.paddingDuration.inSeconds / 60.0} min"),
                      onPressed: (context) {
                        Picker(
                          adapter: NumberPickerAdapter(data: <NumberPickerColumn>[
                            NumberPickerColumn(
                              begin: 0,
                              end: 20,
                              suffix: const Text(' minutes'),
                              initValue: state.paddingDuration.inMinutes,
                            ),
                            NumberPickerColumn(
                              begin: 0,
                              end: 60,
                              suffix: const Text(' seconds'),
                              initValue: (state.paddingDuration.inSeconds % 60),
                              jump: 15,
                            ),
                          ]),
                          delimiter: <PickerDelimiter>[
                            PickerDelimiter(
                              child: Container(
                                width: 10.0,
                                alignment: Alignment.center,
                              ),
                            )
                          ],
                          hideHeader: true,
                          confirmText: 'OK',
                          title: const Text('Select duration'),
                          onConfirm: (Picker picker, List<int> value) async {
                            var duration = Duration(
                              minutes: picker.getSelectedValues()[0],
                              seconds: picker.getSelectedValues()[1],
                            );
                            await context.read<SettingsCubit>().edit(state.copyWith(paddingDuration: duration));
                          },
                        ).showDialog(context);
                      },
                    )
                  ],
                )
              ],
            ));
  }
}
