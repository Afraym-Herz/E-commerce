import 'package:e_commerce/features/home/presentation/views/widgets/active_bottom_navigation_bar_item.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key, required this.onItemTapped, required this.index});
  final  Function(int)? onItemTapped;
  final int index ;

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        shadows :  [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 25,
            offset: Offset(0, -2),
            spreadRadius: 0,
          )
        ],
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
        onTap: widget.onItemTapped,
        currentIndex: widget.index,
        selectedItemColor: Colors.green,
        items: [
          BottomNavigationBarItem(
            icon: widget.index == 0
                ? const Padding(
                  padding: EdgeInsets.only( right: 5),
                  child: ActiveBottomNavigationBarItem(
                      icon: Icons.home,
                      label: 'الرئيسية',
                    ),
                )
                : const Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: widget.index == 1
                ? const ActiveBottomNavigationBarItem(
                    icon: Icons.widgets,
                    label: 'المنتجات',
                  )
                : const Icon(Icons.widgets),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: widget.index == 2
                ? const ActiveBottomNavigationBarItem(
                    icon: Icons.shopping_cart,
                    label: 'العربة',
                  )
                : const Icon(Icons.shopping_cart),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: widget.index == 3
                ? const Padding(
                  padding: EdgeInsets.only( left: 8.0),
                  child: ActiveBottomNavigationBarItem(
                      icon: Icons.person,
                      label: 'الحساب',
                    ),
                )
                : const Icon(Icons.person),
            label: '',
          ),
        ],
      ),
    );
  }
}
