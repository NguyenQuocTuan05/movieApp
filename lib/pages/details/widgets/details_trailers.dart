import 'package:flutter/material.dart';
import 'package:movie_app/apps/configs/color_app.dart';

class DetailsTrailers extends StatelessWidget {
  const DetailsTrailers({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 10,
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          height: 10,
        );
      },
      itemBuilder: (BuildContext context, int index) {
        return AspectRatio(
          aspectRatio: 3 / 1,
          child: Row(
            children: [
              Image.asset(
                'assets/images/trailers.png',
                fit: BoxFit.fill,
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'Trailer 3: Final',
                    style: TextStyle(
                      fontSize: 18,
                      color: ColorApp.textColor,
                    ),
                  ),
                  const Text(
                    '1m 45s',
                    style: TextStyle(
                      fontSize: 14,
                      color: ColorApp.textColor,
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xffe2122114),
                    ),
                    child: const Text(
                      'update',
                      style: TextStyle(
                        fontSize: 14,
                        color: ColorApp.platformColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
