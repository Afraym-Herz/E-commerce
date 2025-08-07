
import 'package:e_commerce/features/home/presentation/views/widgets/active_bottom_navigation_bar_item.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({
    super.key,
  });

  @override
  State<CustomBottomNavigationBar> createState() => _CustomBottomNavigationBarState();
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
      items: const [
      BottomNavigationBarItem(
        activeIcon: ActiveBottomNavigationBarItem(icon: Icons.home, label: 'الرئيسية'),
        icon: Icon(Icons.home),
        label: '',
      ),

      BottomNavigationBarItem(
       activeIcon: ActiveBottomNavigationBarItem(icon: Icons.widgets, label: 'المنتجات'),
        icon: Icon(Icons.widgets),
        label: '',
      ),BottomNavigationBarItem(
       activeIcon: ActiveBottomNavigationBarItem(icon: Icons.shopping_cart, label: 'العربة'),
        icon: Icon(Icons.shopping_cart),
        label: '',
      ),
      BottomNavigationBarItem(
       activeIcon: ActiveBottomNavigationBarItem(icon: Icons.person, label: 'الحساب'),
        icon: Icon(Icons.person ),
        label: '',
      ),
    ],
    
    );
  }
}