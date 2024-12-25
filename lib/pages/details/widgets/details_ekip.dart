import 'package:flutter/material.dart';
import 'package:movie_app/apps/configs/color_app.dart';

class DetailsEkip extends StatelessWidget {
  const DetailsEkip({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            width: 20,
          );
        },
        itemBuilder: (BuildContext context, int index) {
          return const Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/avatar.png'),
              ),
              SizedBox(
                width: 12,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'James Cameron',
                    style: TextStyle(fontSize: 10, color: ColorApp.textColor),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    'Director',
                    style: TextStyle(fontSize: 10, color: ColorApp.textColor),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
