import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_text_styles.dart';
import 'package:e_commerce/core/utils/assets.dart';
import 'package:e_commerce/features/on_boarding/presentation/views/widgets/page_view_item.dart';
import 'package:flutter/material.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key, required this.pageController});
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
          child: PageView(
            physics: const BouncingScrollPhysics(),
            controller: pageController,  
            children:  [
              PageViewItem(
                isVisiable: true ,
                backgroundImage: Assets.imagesOnboarding1ImgaeBackground,
                image: Assets.imagesFruitsBasket,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     const Text(' مرحبًا بك في', style: AppTextStyles.bold23),
                    Text(
                      'HUB',
                      style: AppTextStyles.bold23.copyWith(
                        color: AppColors.lightSecondaryColor,
                      ),
                    ),
                    Text(
                      'Fruit',
                      style: AppTextStyles.bold23.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
                subtitle:
                    'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.',
              ),
               const PageViewItem(
                isVisiable : false,
                backgroundImage: Assets.imagesOnboarding2ImageBackground,
                image: Assets.imagesPineapple,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text('ابحث وتسوق', style: AppTextStyles.bold23)],
                ),
                subtitle:
                    'نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية',
              ),
            ],
          ),
        );
  }
}