import 'package:flutter/material.dart';
import 'package:movie_app/apps/configs/color_app.dart';

class AppbarWidgets extends StatelessWidget implements PreferredSizeWidget {
  final String title; // Tham số tiêu đề
  final bool showSearchIcon; // Hiển thị hoặc không hiển thị hình ảnh search

  const AppbarWidgets({
    super.key,
    required this.title, // Bắt buộc phải truyền tiêu đề
    this.showSearchIcon = true, // Mặc định hiển thị search icon
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorApp.backgroundColor,
      leading: Image.asset(
        'assets/images/logo.png',
        height: 32,
      ),
      title: Text(
        title, // Hiển thị tiêu đề được truyền vào
        style: const TextStyle(fontSize: 24, color: ColorApp.textColor),
      ),
      actions: [
        if (showSearchIcon) // Kiểm tra có hiển thị search icon không
          Image.asset(
            'assets/images/search.png',
            height: 24,
            width: 24,
          ),
        if (showSearchIcon) // Nếu có icon search, thêm khoảng cách
          const SizedBox(
            width: 24,
          ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
