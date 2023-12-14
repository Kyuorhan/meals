import 'package:flutter/material.dart';

import '../../../shared/models/settings_model.dart';
import '../../../shared/themes/app_colors.dart';
import '../../../shared/themes/app_text_style.dart';
import '../../../shared/widgets/main_drawer_widget.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({
    super.key,
    required this.settings,
    required this.onSettingsChanged,
  });

  final SettingsModel settings;
  final Function(SettingsModel) onSettingsChanged;

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late SettingsModel settingsModel;

  @override
  void initState() {
    super.initState();
    settingsModel = widget.settings;
  }

  Widget _createSwitch(
    String title,
    String subTitle,
    bool value,
    Function(bool) onChanged,
  ) {
    return SwitchListTile.adaptive(
      contentPadding:
          const EdgeInsets.symmetric(vertical: 5 / 0.75, horizontal: 25 / 0.75),
      activeColor: AppColors.primary,
      title: Text(title, style: TextStyles.titleSettings),
      subtitle: Text(
        subTitle,
        style: TextStyles.subTitleSettings,
      ),
      value: value,
      onChanged: (value) {
        onChanged(value);
        widget.onSettingsChanged(settingsModel);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isDrawerEnabled =
        ModalRoute.of(context)?.settings.arguments as bool? ?? false;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: AppColors.background,
          size: 26,
        ),
        leadingWidth: 72,
        toolbarHeight: 72,
        title: Text(
          'Configuraçôes',
          style: TextStyles.titleHome,
        ),
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.symmetric(horizontal: 12),
        //     child: IconButton(
        //       icon: const Icon(
        //         Icons.keyboard_control,
        //       ),
        //       onPressed: () =>
        //           Navigator.of(context).pushReplacementNamed(AppRoutes.home),
        //       tooltip: 'Filter',
        //     ),
        //   ),
        // ],
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(32),
          ),
        ),
      ),
      drawer: isDrawerEnabled
          ? const MainDrawerWidget(isDrawerEnabled: true)
          : null,
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 10),
              children: [
                _createSwitch(
                  'Sem Glutén',
                  'Só exibe refeições sem glúten!',
                  settingsModel.isGlutenFree,
                  (value) => setState(() => settingsModel.isGlutenFree = value),
                ),
                _createSwitch(
                  'Sem Lactose',
                  'Só exibe refeições sem lactose!',
                  settingsModel.isLactoseFree,
                  (value) =>
                      setState(() => settingsModel.isLactoseFree = value),
                ),
                _createSwitch(
                  'Vegana',
                  'Só exibe refeições veganas!',
                  settingsModel.isVegan,
                  (value) => setState(() => settingsModel.isVegan = value),
                ),
                _createSwitch(
                  'Vegetariana',
                  'Só exibe refeições vegetarianas!',
                  settingsModel.isVegetarian,
                  (value) => setState(() => settingsModel.isVegetarian = value),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
