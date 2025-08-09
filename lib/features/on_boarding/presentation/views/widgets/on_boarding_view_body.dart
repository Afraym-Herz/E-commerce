import 'package:e_commerce/constants.dart';
import 'package:e_commerce/core/services/shared_preferences_singelton.dart';
import 'package:e_commerce/core/widgets/custom_button.dart';
import 'package:e_commerce/features/auth/presentation/views/login_view.dart';
import 'package:e_commerce/features/on_boarding/presentation/views/widgets/dots_indicator_row.dart';
import 'package:e_commerce/features/on_boarding/presentation/views/widgets/on_boarding_page_view.dart';
import 'package:flutter/material.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  int _currentPage = 0;

  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.toInt();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OnBoardingPageView(pageController: _pageController),

        DotIndicatorsRow(currentPage: _currentPage),
        Visibility(
          visible: _currentPage == 1 ? true : false,
          maintainAnimation: true ,
          maintainSize: true,
          maintainState: true,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: CustomButton(
              onPressed: (){
              Prefs.setBool(kIsOnBoardingViewSeen, true);
              Navigator.pushReplacementNamed(context, LoginView.routeName);
            },
             title: "ابدأ الأن"),
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.05),
        
      ],
    );
  }
}

