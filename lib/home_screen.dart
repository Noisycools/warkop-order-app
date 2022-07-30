import 'package:flutter/material.dart';
import 'package:warkop_order_app/tab/home_tab.dart';
import 'package:warkop_order_app/tab/menu_tab.dart';
import 'package:warkop_order_app/tab/profile_tab.dart';

class HomeScreen extends StatefulWidget {
  final int selectedTab;
  final int menuIndex;
  final int categoryIndex;
  final String nama;

  const HomeScreen({
    Key? key,
    this.nama = '[Anda belum mengisi nama]',
    required this.selectedTab,
    required this.menuIndex,
    required this.categoryIndex,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Widget> _pages;

  int menuIndex = 0;
  int categoryIndex = -1;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.selectedTab;
    menuIndex = widget.menuIndex;
    categoryIndex = widget.categoryIndex;
    _pages = <Widget>[
      HomeTab(nama: widget.nama),
      MenuTab(menuIndex: menuIndex, categoryIndex: categoryIndex),
      const ProfileTab(),
    ];
  }

  void _changeSelectedNavBar(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_menu),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
        ],
        onTap: _changeSelectedNavBar,
      ),
    );
  }
}
