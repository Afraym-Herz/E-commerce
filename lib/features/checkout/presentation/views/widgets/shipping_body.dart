import 'package:e_commerce/features/checkout/presentation/views/widgets/shipping_way_item.dart';
import 'package:flutter/material.dart';

class ShippingBody extends StatefulWidget {
  const ShippingBody({super.key});

  @override
  State<ShippingBody> createState() => _ShippingBodyState();
}

class _ShippingBodyState extends State<ShippingBody> {
  final List<Map<String, String>> shippingWayItems = [
    {
      'title': 'الدفع عند الاستلام',
      'subtitle': 'التسليم من المكان',
      'price': '40 جنيه',
    },
    {
      'title': 'اشتري الان وادفع لاحقا',
      'subtitle': 'يرجي تحديد طريقه الدفع',
      'price': 'مجاني',
    },
  ];
  int selectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        separatorBuilder: (context, index) => const SizedBox(height: 8),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: ShippingWayItem(
              title: shippingWayItems[index]['title']!,
              subtitle: shippingWayItems[index]['subtitle']!,
              price: shippingWayItems[index]['price']!,
              isSelected: selectedIndex == index,
            ),
          );
        },
        itemCount: shippingWayItems.length,
      ),
    );
  }
}
