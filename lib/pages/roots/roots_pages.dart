import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:movie_app/apps/configs/color_app.dart';
import 'package:movie_app/pages/download/download_pages.dart';
import 'package:movie_app/pages/explore/explore_pages.dart';
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
    const ExplorePages(),
    const MylistPages(),
    DownloadPages(),
    const ProfilePages(),
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: listPages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              IconlyBold.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              IconlyBold.discovery,
            ),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              IconlyBold.document,
            ),
            label: 'My List',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              IconlyBold.download,
            ),
            label: 'Download',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              IconlyBold.profile,
            ),
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
