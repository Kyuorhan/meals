import 'package:flutter/material.dart';

import '../../../shared/models/settings.dart';
import '../../../shared/themes/app_colors.dart';
import '../../../shared/themes/app_text_style.dart';
import '../../../shared/widgets/main_drawer_widget.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  var settingsModel = SettingsModel();

  Widget _createSwitch(
    String title,
    String subTitle,
    bool value,
    Function(bool) onChanged,
  ) {
    return SwitchListTile.adaptive(
      contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
      activeColor: AppColors.delete,
      title: Text(title, style: TextStyles.titleSettings),
      subtitle: Text(subTitle, style: TextStyles.subTitleSettings),
      value: value,
      onChanged: onChanged,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: AppColors.background,
          size: 26,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(32),
          ),
        ),
        leadingWidth: 72,
        toolbarHeight: 72,
        title: Text(
          'Configuraçôes',
          style: TextStyles.titleHome,
        ),
      ),
      drawer: const MainDrawerWidget(),
      body: Column(
        children: [
          Container(
              // child: Text(
              //   'Configurações',
              //   style: TextStyles.titleSettings,
              // ),
              ),
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
