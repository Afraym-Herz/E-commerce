import 'package:e_commerce/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomPasswordField extends StatefulWidget {
  const CustomPasswordField({super.key, required this.title});

  final String title ;

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {

  late TextEditingController _controller ;
  bool isVisible = false ;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffF9FAFA) ,
      child: TextField(
        controller: _controller,
        obscureText: !isVisible ,
        decoration: InputDecoration(
          focusColor: const Color(0xff949D9E),
          fillColor: const Color(0xff949D9E),
          suffixIcon:  IconButton(
            onPressed: (){
            setState(() {
              isVisible = !isVisible ;
            });
          },
           icon: const Icon(Icons.remove_red_eye) , color: const Color(0xffC9CECF),) ,
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