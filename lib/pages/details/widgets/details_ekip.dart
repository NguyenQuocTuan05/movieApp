import 'package:flutter/material.dart';
import 'package:movie_app/apps/helper/image_film.dart';
import 'package:movie_app/model/acting.dart';

class DetailsEkip extends StatelessWidget {
  final int lenght;
  final List<Acting> actingList;
  const DetailsEkip({
    super.key,
    required this.lenght,
    required this.actingList,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: lenght,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            width: 20,
          );
        },
        itemBuilder: (BuildContext context, int index) {
          final acting = actingList[index];
          final imageUrl = acting.profile_path != null
              ? ImageFilm(poster_path: acting.profile_path!).getProfileUrl()
              : '';
          return Row(
            children: [
              CircleAvatar(
                backgroundImage:
                    imageUrl.isNotEmpty ? NetworkImage(imageUrl) : null,
                child: imageUrl.isEmpty ? const Icon(Icons.person) : null,
              ),
              const SizedBox(
                width: 12,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    acting.name!,
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).textTheme.bodyLarge!.color),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    acting.known_for_department!,
                    style: TextStyle(
                        fontSize: 10,
                        color: Theme.of(context).textTheme.bodyLarge!.color),
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
