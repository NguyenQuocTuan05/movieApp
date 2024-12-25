import 'package:flutter/material.dart';
import 'package:movie_app/apps/configs/color_app.dart';
import 'package:movie_app/pages/details/widgets/details_ekip.dart';
import 'package:movie_app/pages/details/widgets/details_film.dart';
import 'package:movie_app/pages/details/widgets/details_genre.dart';
import 'package:movie_app/pages/details/widgets/details_synopsis.dart';
import 'package:movie_app/pages/details/widgets/details_tab.dart';
import 'package:movie_app/pages/details/widgets/details_title.dart';
import 'package:movie_app/widgets/play_widgets.dart';
import 'package:movie_app/widgets/title_widgets.dart';

class DetailsPages extends StatelessWidget {
  const DetailsPages({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorApp.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            DetailsSynopsis(),
            SizedBox(
              height: 24,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  DetailsFilm(),
                  SizedBox(
                    height: 22,
                  ),
                  DetailsTitle(),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(child: PlayWidgets()),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: TitleWidgets(
                            borderColor: ColorApp.platformColor,
                            imagePath: 'assets/images/download.png',
                            text: 'Download',
                            textColor: ColorApp.platformColor),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  DetailsGenre(),
                  SizedBox(
                    height: 20,
                  ),
                  DetailsEkip(),
                  SizedBox(
                    height: 24,
                  ),
                  SizedBox(height: 500, child: DetailsTab()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
