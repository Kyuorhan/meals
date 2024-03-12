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
  double _opacityLevel = 0.0;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        _opacityLevel = 1.0;
      });
    });

    Future.delayed(const Duration(seconds: 4), () {
      Navigator.of(context).pushReplacementNamed(AppRoutes.home);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size mySize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: AnimatedOpacity(
        opacity: _opacityLevel,
        duration: const Duration(seconds: 1), // Duração da animação (1 segundo)
        child: Stack(
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
      ),
    );
  }
}
