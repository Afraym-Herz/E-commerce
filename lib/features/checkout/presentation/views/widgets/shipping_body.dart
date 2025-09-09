import 'package:e_commerce/features/checkout/domain/entities/order_entity.dart';
import 'package:e_commerce/features/checkout/presentation/views/widgets/shipping_way_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShippingBody extends StatefulWidget {
  const ShippingBody({super.key});

  @override
  State<ShippingBody> createState() => _ShippingBodyState();
}

class _ShippingBodyState extends State<ShippingBody>
    with AutomaticKeepAliveClientMixin {
  final List<Map<String, String>> shippingWayItems = [
    {'title': 'الدفع عند الاستلام', 'subtitle': 'التسليم من المكان'},
    {'title': 'اشتري الان وادفع لاحقا', 'subtitle': 'يرجي تحديد طريقه الدفع'},
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Expanded(
        child: ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) => const SizedBox(height: 8),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                  context.read<OrderEntity>().payWithCash = (selectedIndex == 0)
                      ? true
                      : false;
                });
              },
              child: ShippingWayItem(
                title: shippingWayItems[index]['title']!,
                subtitle: shippingWayItems[index]['subtitle']!,
                price: index == 0
                    ? context
                          .read<OrderEntity>()
                          .cartEntity
                          .calcTotalPrice()
                          .toString()
                    : 'مجاني',
                isSelected: selectedIndex == index,
              ),
            );
          },
          itemCount: shippingWayItems.length,
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
