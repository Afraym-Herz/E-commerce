import 'package:e_commerce/features/home/presentation/views/widgets/active_bottom_navigation_bar_item.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _index = 0;
  void _onItemTapped(int index) {
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: false,
      onTap: _onItemTapped,
      currentIndex: _index,
      selectedItemColor: Colors.green,
      items: [
        BottomNavigationBarItem(
          icon: _index == 0
              ? const ActiveBottomNavigationBarItem(
                  icon: Icons.home,
                  label: 'الرئيسية',
                )
              : const Icon(Icons.home),
          label: '',
        ),

        BottomNavigationBarItem(
          icon: _index == 1
              ? const ActiveBottomNavigationBarItem(
                  icon: Icons.widgets,
                  label: 'المنتجات',
                )
              : const Icon(Icons.widgets),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: _index == 2
              ? const ActiveBottomNavigationBarItem(
                  icon: Icons.shopping_cart,
                  label: 'العربة',
                )
              : const Icon(Icons.shopping_cart),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: _index == 3
              ? const ActiveBottomNavigationBarItem(
                  icon: Icons.person,
                  label: 'الحساب',
                )
              : const Icon(Icons.person),
          label: '',
        ),
      ],
    );
  }
}
