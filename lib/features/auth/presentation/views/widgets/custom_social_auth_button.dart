import 'package:e_commerce/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomSocialAuthButton extends StatelessWidget {
  const CustomSocialAuthButton({super.key, required this.title, this.onTap, required this.imageIcon});
  final String title ;
  final void Function()? onTap;
  final String imageIcon ;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16) , 
        side: const BorderSide(color: Color(0xffDDDFDF) , width: 1) ,
        ),
      leading: Image.asset(imageIcon) ,
      title:  Center(child: Text("تسجيل بواسطة $title" , style: AppTextStyles.semiBold16,)),
      
    );
  }
}