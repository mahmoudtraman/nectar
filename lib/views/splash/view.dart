import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nectar_app/core/extensions/num.dart';
import 'package:nectar_app/core/extensions/string.dart';

import '../../core/route_utils/route_utils.dart';
import '../../core/utils/colors.dart';
import '../onboarding/view.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      RouteUtils.pushAndRemoveAll(context, OnboardingView());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Image.asset(
          'full_logo'.assetPNG,
          height: 68.height,
          width: 268.width,
        ),
      ),
    );
  }
}
