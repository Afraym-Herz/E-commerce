import 'package:e_commerce/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class AddAddressBody extends StatefulWidget {
  const AddAddressBody({super.key});
  
  @override
  State<AddAddressBody> createState() => _AddAddressBodyState();
}

class _AddAddressBodyState extends State<AddAddressBody> {
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return  Form(
      key: globalKey,
      autovalidateMode: autovalidateMode,
      child: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              CustomTextFormField(title: 'الاسم كامل' ,),
              SizedBox(height: 8,),
              CustomTextFormField(title: 'البريد الإلكتروني' ,),
              SizedBox(height: 8,),
              CustomTextFormField(title: 'العنوان' ,),
              SizedBox(height: 8,),
              CustomTextFormField(title: 'المدينه' ,),
              SizedBox(height: 8,),
              CustomTextFormField(title: 'رقم الطابق , رقم الشقه ..' ,),
              SizedBox(height: 8,),
            ],
          ),
        ),
      ),
    );
  }
}