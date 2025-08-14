
import 'package:e_commerce/constants.dart';
import 'package:e_commerce/core/services/firebase_auth_services.dart';
import 'package:e_commerce/core/services/shared_preferences_singelton.dart';
import 'package:e_commerce/core/utils/assets.dart';
import 'package:e_commerce/features/auth/presentation/views/login_view.dart';
import 'package:e_commerce/features/home/presentation/views/home_view.dart';
import 'package:e_commerce/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:e_commerce/main.dart';
import 'package:flutter/material.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    executeNavigation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: isArabic()
          ? CrossAxisAlignment.end
          : CrossAxisAlignment.start,
      children: [
        Image.asset(Assets.imagesPlanet),
        Image.asset(Assets.imagesAppIcon),
        Image.asset(Assets.imagesSplashBottom),
      ],
    );
  }

  void executeNavigation() {
    bool isOnBoardingView = Prefs.getBool(kIsOnBoardingViewSeen);
    Future.delayed(const Duration(seconds: 3), () {
      if (isOnBoardingView) {
       bool isUserLoggedIn = FirebaseAuthServices().isUserLoggedIn() ;
        if (isUserLoggedIn) {
          Navigator.pushReplacementNamed(context, HomeView.routeName);
        } else {
          Navigator.pushReplacementNamed(context, LoginView.routeName);
        }
      } else {
        Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
      }
    });
  }
}
