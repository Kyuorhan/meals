import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../../shared/models/settings_model.dart';
import '../../../shared/themes/app_colors.dart';
import '../../../shared/themes/app_scalable_text.dart';
import '../../../shared/widgets/custom/custom_statusbars_widget.dart';
import '../../../shared/widgets/sidebar_drawer_widget.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({
    super.key,
    required this.settings,
    required this.onSettingsChanged,
  });

  final SettingsModel settings;
  final Function(SettingsModel) onSettingsChanged;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
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
    return LayoutBuilder(builder: (context, constraints) {
      // TextScaler createSwitchScaler = MediaQuery.textScalerOf(context);

      //  final scaledCreateSwitch = createSwitchScaler.scale(fontSize)

      return SwitchListTile.adaptive(
        contentPadding: EdgeInsets.symmetric(
          vertical: constraints.maxWidth * 0.02,
          horizontal: 25 / 0.55,
        ),
        // contentPadding: const EdgeInsets.symmetric(
        //   vertical: 5 / 0.55,
        //   horizontal: 25 / 0.55,
        // ),
        activeColor: AppColors.secundary,
        activeTrackColor: AppColors.primary,
        inactiveTrackColor: AppColors.shape,
        inactiveThumbColor: AppColors.secundary,
        title: ScalableText.titleFilter(context: context, title: title),
        subtitle:
            ScalableText.subTitleFilter(context: context, title: subTitle),
        // title: Text(
        //   title,
        //   // style: TextStyles.titleSettings,
        // ),
        // subtitle: Text(
        //   subTitle,
        //   // style: TextStyles.subTitleSettings,
        // ),
        value: value,
        onChanged: (value) {
          onChanged(value);
          widget.onSettingsChanged(settingsModel);
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isDrawerEnabled =
        ModalRoute.of(context)?.settings.arguments as bool? ?? false;

    return Scaffold(
      backgroundColor: AppColors.shape,
      appBar: CustomStatusBars(
        context: context,
        title: 'Filtros',
        // actions: [
        //   CustomAction(
        //     icon: const Icon(
        //       Icons.restaurant,
        //     ),
        //     onPressed: () =>
        //         Navigator.of(context).pushReplacementNamed(AppRoutes.home),
        //     tooltip: 'Filter',
        //   )
        // ],
      ),
      drawer: isDrawerEnabled
          ? SideBarDrawer(context: context, isDrawerEnabled: true)
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
