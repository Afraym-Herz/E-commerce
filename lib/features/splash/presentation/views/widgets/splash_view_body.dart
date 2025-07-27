import 'package:e_commerce/core/utils/assets.dart';
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
      crossAxisAlignment: isArabic() ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Image.asset(Assets.imagesPlanet),
        Image.asset(Assets.imagesAppIcon),
        Image.asset(Assets.imagesSplashBottom),
        
      ],
    );
  }
  
  void executeNavigation() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
    });
  }
}