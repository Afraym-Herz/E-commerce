import 'package:e_commerce/core/utils/assets.dart';
import 'package:flutter/material.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.5,
          child:  Stack(
            children: [
              const Positioned.fill(
                child: Image(
                  fit: BoxFit.fill,
                  image: AssetImage(Assets.imagesOnboarding1ImgaeBackground),
                ),

              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.1,
                 right: 0,
                 left: 0,
                child: const Image(
                  image: AssetImage(Assets.imagesFruitsBasket),
                ),
              ),

              const Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'تخط',
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}