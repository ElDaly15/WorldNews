import 'package:daily_news/core/utils/app_colors.dart';
import 'package:daily_news/featuers/splash/presentation/views/widgets/splash_view_body.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.mainColorTheme,
      body: SplashViewBody(),
    );
  }
}
