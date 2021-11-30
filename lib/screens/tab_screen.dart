import 'package:flutter/material.dart';
import 'package:la_plaza_app/screens/products_screen.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final List<Widget> _pages = [
    ProductScreen(),
  ];

  int _selectedPageIndex = 0;
  void _selectPage(int index){
    setState(() {
      _selectedPageIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.black26,
        onTap: _selectPage,
        backgroundColor: Colors.white70,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.house_rounded),
              label: 'Inicio'),
          BottomNavigationBarItem(
              icon: Icon(Icons.grid_view_outlined),
              label: 'Grilla'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_basket_outlined),
              label: 'Compras'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Perfil'),
        ],
      ),
    );
  }
}
