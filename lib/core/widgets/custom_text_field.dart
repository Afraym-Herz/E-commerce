import 'package:e_commerce/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({super.key, required this.title});
  final String title;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {

  late TextEditingController _controller ;

  @override
  void initState() {

    _controller = TextEditingController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Container(
      color: const Color(0xffF9FAFA) ,
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
          focusColor: const Color(0xff949D9E),
          fillColor: const Color(0xff949D9E),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all( Radius.circular(4) ),
          ),
          labelText: widget.title ,
          labelStyle: AppTextStyles.bold13.copyWith(color: const Color(0xff949D9E)),
        ),
        
      ),
    );
  }
}