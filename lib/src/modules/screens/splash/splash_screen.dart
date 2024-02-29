import 'package:flutter/material.dart';

import '../../../shared/themes/app_colors.dart';
import '../../../shared/themes/app_images.dart';
import '../../../utils/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacementNamed(AppRoutes.home);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size mySize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Stack(
        children: [
          Center(
            child: Opacity(
              opacity: 0.35,
              child: Image.asset(
                AppImages.union,
                width: mySize.width,
                height: mySize.height,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Image.asset(
              AppImages.logoFull,
              width: mySize.width,
              height: mySize.height * 0.5,
            ),
          ),
        ],
      ),
    );
  }
}
