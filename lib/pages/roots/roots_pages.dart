import 'package:flutter/material.dart';
import 'package:movie_app/apps/configs/color_app.dart';
import 'package:movie_app/pages/home/home_pages.dart';
import 'package:movie_app/pages/mylist/mylist_pages.dart';
import 'package:movie_app/pages/profile/profile_pages.dart';

class RootsPages extends StatefulWidget {
  const RootsPages({super.key});

  @override
  State<RootsPages> createState() => _RootsPagesState();
}

class _RootsPagesState extends State<RootsPages> {
  final List<Widget> listPages = [
    const HomePages(),
    const Center(
      child: Text(
        'Explore Page',
        style: TextStyle(
          fontSize: 24,
        ),
      ),
    ),
    const MylistPages(),
    const Center(
      child: Text(
        'Download Page',
        style: TextStyle(
          fontSize: 24,
        ),
      ),
    ),
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: listPages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: ColorApp.backgroundColor,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'My List',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.download),
            label: 'Download',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        type: BottomNavigationBarType.fixed,
        selectedItemColor: ColorApp.platformColor,
        unselectedItemColor: ColorApp.borderColor,
      ),
    );
  }
}
