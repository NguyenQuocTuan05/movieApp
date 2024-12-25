import 'package:flutter/material.dart';
import 'package:movie_app/apps/configs/color_app.dart';
import 'package:movie_app/pages/top/widgets/top_list.dart';
import 'package:movie_app/provider/home_provider.dart';
import 'package:provider/provider.dart';

class TopPages extends StatelessWidget {
  const TopPages({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.backgroundColor,
      appBar: AppBar(
        backgroundColor: ColorApp.backgroundColor,
        leading: const Icon(
          Icons.arrow_back,
          color: ColorApp.textColor,
          size: 28,
        ),
        title: const Text(
          'Top 10 Movies This Week',
          style: TextStyle(fontSize: 24, color: ColorApp.textColor),
        ),
        actions: [
          Image.asset(
            'assets/images/search.png',
          ),
          const SizedBox(
            width: 24,
          ),
        ],
      ),
      body: Expanded(
        child: TopList(
          future: Provider.of(context),
        ),
      ),
    );
  }
}
