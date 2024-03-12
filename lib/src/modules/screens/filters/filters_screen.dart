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

  Widget _createSwitch({
    required String title,
    required String subTitle,
    Widget? secondary,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return LayoutBuilder(builder: (context, constraints) {
      TextScaler switchScaler = MediaQuery.textScalerOf(context);

      final scaledSwitchPadding =
          switchScaler.scale(constraints.maxWidth * 0.052).roundToDouble();

      return SwitchListTile.adaptive(
        value: value,
        onChanged: (value) {
          onChanged(value);
          widget.onSettingsChanged(settingsModel);
        },
        activeColor: AppColors.secundary,
        activeTrackColor: AppColors.primary,
        inactiveTrackColor: AppColors.transparent,
        inactiveThumbColor: AppColors.secundary,
        // tileColor: AppColors.secundary,
        selectedTileColor: AppColors.secundary,
        title: ScalableText.titleFilter(
          context: context,
          title: title,
        ),
        subtitle: ScalableText.subTitleFilter(
          context: context,
          title: subTitle,
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: scaledSwitchPadding * 0.7,
          horizontal: scaledSwitchPadding,
        ),
        // title: Text(
        secondary: secondary,
        // secondary: Icon(
        //   Icons.local_dining,
        //   size: 38,
        //   color: AppColors.secundary.withOpacity(0.45),
        // ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    TextScaler filterScaler = MediaQuery.textScalerOf(context);

    final double scaledSwitchPadding =
        filterScaler.scale(size.width * 0.042).roundToDouble();
    // final double scaledIconSize = filterScaler.scale(32.0).roundToDouble();

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
              padding: EdgeInsets.all(scaledSwitchPadding),
              children: [
                _createSwitch(
                  title: 'Sem Glutén',
                  subTitle: 'Só exibe refeições sem glúten!',
                  value: settingsModel.isGlutenFree,
                  onChanged: (value) =>
                      setState(() => settingsModel.isGlutenFree = value),
                ),
                _createSwitch(
                  title: 'Sem Lactose',
                  subTitle: 'Só exibe refeições sem lactose!',
                  value: settingsModel.isLactoseFree,
                  onChanged: (value) =>
                      setState(() => settingsModel.isLactoseFree = value),
                ),
                _createSwitch(
                  title: 'Vegana',
                  subTitle: 'Só exibe refeições veganas!',
                  value: settingsModel.isVegan,
                  onChanged: (value) =>
                      setState(() => settingsModel.isVegan = value),
                ),
                _createSwitch(
                  title: 'Vegetariana',
                  subTitle: 'Só exibe refeições vegetarianas!',
                  value: settingsModel.isVegetarian,
                  onChanged: (value) =>
                      setState(() => settingsModel.isVegetarian = value),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
