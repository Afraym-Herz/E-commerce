import 'package:e_commerce/features/login/login_view.dart';
import 'package:e_commerce/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:e_commerce/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';

Route<dynamic> onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());

    case OnBoardingView.routeName: 
      return MaterialPageRoute(builder: (context) => const OnBoardingView());

    case LoginView.routeName :
      return MaterialPageRoute(builder: (context) => const LoginView());

    default:
      return MaterialPageRoute(builder: (context) => const Placeholder());
  }
}