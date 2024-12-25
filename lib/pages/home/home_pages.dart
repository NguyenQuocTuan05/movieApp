import 'package:flutter/material.dart';
import 'package:movie_app/apps/configs/color_app.dart';
import 'package:movie_app/pages/home/widgets/home_list.dart';
import 'package:movie_app/pages/home/widgets/home_synopsis.dart';
import 'package:movie_app/pages/home/widgets/home_title.dart';
import 'package:movie_app/provider/home_provider.dart';
import 'package:provider/provider.dart';

class HomePages extends StatelessWidget {
  const HomePages({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorApp.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            HomeSynopsis(),
            SizedBox(
              height: 24,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  HomeTitle(title: 'Top 10 Movies This Week'),
                  SizedBox(
                    height: 24,
                  ),
                  HomeList(
                      // future: Provider.of<HomeProvider>(context, listen: false)
                      //     .getRateMovies(),
                      ),
                  SizedBox(
                    height: 24,
                  ),
                  HomeTitle(title: 'New Releases'),
                  SizedBox(
                    height: 24,
                  ),
                  HomeList(
                      // future: Provider.of<HomeProvider>(context, listen: false)
                      //     .getNewReleases(),
                      ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
