import 'package:flutter/material.dart';
import 'package:newsly/presentation/favorites_page.dart';
import 'package:newsly/presentation/find_news_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    FindNewsPage(),
    FavoritesPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _pages[_selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Find news',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.favorite),
            icon: Icon(Icons.favorite_border),
            label: 'Favorites',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
