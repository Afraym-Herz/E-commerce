import 'package:e_commerce/core/utils/app_text_styles.dart';
import 'package:e_commerce/features/auth/login_view.dart';
import 'package:flutter/material.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.backgroundImage,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.isVisiable,
  });

  final String backgroundImage, image, subtitle;

  final Widget title;
  final bool isVisiable ;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Stack(
            children: [
              Visibility(
                visible: isVisiable,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, LoginView.routeName );
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric( horizontal:16 , vertical: 60 ),
                    child: Text(style: AppTextStyles.regular13, 'تخط'),
                  ),
                ),
              ),

              Positioned.fill(
                child: Image(
                  fit: BoxFit.fill,
                  image: AssetImage(backgroundImage),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.1,
                right: 0,
                left: 0,
                child: Image(image: AssetImage(image)),
              ),
            ],
          ),
        ),
        const SizedBox(height: 64,) ,
        title,
        const SizedBox(height: 24,), 
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(style: AppTextStyles.semiBold16, subtitle , textAlign: TextAlign.center, ),
        ),
      ],
    );
  }
}
