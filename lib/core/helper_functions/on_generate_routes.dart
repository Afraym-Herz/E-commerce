import 'package:e_commerce/features/auth/presentation/views/forget_password_view.dart';
import 'package:e_commerce/features/auth/presentation/views/login_view.dart';
import 'package:e_commerce/features/auth/presentation/views/sign_up_view.dart';
import 'package:e_commerce/features/home/presentation/views/best_seller_view.dart';
import 'package:e_commerce/features/home/presentation/views/main_view.dart';
import 'package:e_commerce/features/home/presentation/views/widgets/home_view.dart';
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

    case SignUpView.routeName:
      return MaterialPageRoute(builder: (context) => const SignUpView());

    case ForgetPasswordView.routeName:
      return MaterialPageRoute(builder: (context) => const ForgetPasswordView());

    case MainView.routeName:
      return MaterialPageRoute(builder: (context) => const MainView()); 

    case BestSellerView.routeName:
      return MaterialPageRoute(builder: (context) => const BestSellerView()); 

    case HomeView.routeName:
      return MaterialPageRoute(builder: (context) => const HomeView());        

    default:
      return MaterialPageRoute(builder: (context) => const Placeholder());
  }
}