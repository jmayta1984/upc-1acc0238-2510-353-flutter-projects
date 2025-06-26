import 'package:flutter/material.dart';
import 'package:mynasainsights/presentation/photos_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int _currentIndex = 0;
  final List<Widget> _pages = [
    const PhotosPage(), // Photos Page
    const Placeholder(), // Favorites Page

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(child: _pages[_currentIndex]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.photo),
            icon: Icon(Icons.photo_outlined),
            label: 'Photos',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.favorite),
            icon: Icon(Icons.favorite_border),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}