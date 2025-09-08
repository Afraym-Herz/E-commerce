import 'package:e_commerce/core/widgets/custom_text_form_field.dart';
import 'package:e_commerce/features/checkout/domain/entities/order_entity.dart';
import 'package:e_commerce/features/checkout/domain/entities/shipping_address_entity.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddAddressBody extends StatelessWidget {
   AddAddressBody({super.key,});
  
  final ShippingAddressEntity shippingAddressEntity = ShippingAddressEntity();

 

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CustomTextFormField(title: 'الاسم كامل' ,
            onSaved: (value) {
              context.read<OrderEntity>().shippingAddressEntity.name = value;
            },
            ),
            const SizedBox(height: 8,),
            CustomTextFormField(title: 'البريد الإلكتروني' ,
            onSaved: (value) {
              context.read<OrderEntity>().shippingAddressEntity.email= value;
            },
            ),
            const SizedBox(height: 8,),
            CustomTextFormField(
              title: 'العنوان' ,
            onSaved: (value) {
              context.read<OrderEntity>().shippingAddressEntity.addressDetails= value;
            },
            
            ),
            const SizedBox(height: 8,),
            CustomTextFormField(title: 'المدينه' ,
            onSaved: (value) {
              context.read<OrderEntity>().shippingAddressEntity.city= value;
            },
            ),
            const SizedBox(height: 8,),
            CustomTextFormField(title: 'رقم الطابق , رقم الشقه ..' ,
            onSaved: (value) {
              context.read<OrderEntity>().shippingAddressEntity.floor= value;
            },
            ),
            const SizedBox(height: 8,),
            CustomTextFormField(title: 'رقم الهاتف' ,
            isPhoneNum: true,
            onSaved: (value) {
              context.read<OrderEntity>().shippingAddressEntity.phone= value;
             },
            ),
          ],
        ),
      ),
    );
  }
}