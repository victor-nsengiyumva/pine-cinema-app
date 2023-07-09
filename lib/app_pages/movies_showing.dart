import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pine/app_pages/details_pages/inCinema_details_showing.dart';

import '../custom_widgets/movie_card1.dart';

class MoviesShowing extends StatefulWidget {
  final String location;
  const MoviesShowing({super.key, required this.location});

  @override
  State<MoviesShowing> createState() => _MoviesShowingState();
}

class _MoviesShowingState extends State<MoviesShowing> {
  List<String> images = [
    'korea.jpg',
    'metroplex.jpg',
    'nope_clip.jpg',
    'acacia.jpg',
    'arena_place.jpg',
    'thanos.jpg',
    'groot.jpg',
    'ham.jpg',
    'john_wick.jpg',
    'the_woman_king.jpg',
    'transformers.jpg',
    'avatar_clip.jpg',
    'beast_clip.jpg',
    'nsenji.png',
    'black_adam.jpg',
    'bullet_train_clip.jpg',
    'cyber.jpg',
    'travis.jpg',
    'wakanda.png'
  ];
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Text('Showing at ${widget.location}',style: theme.textTheme.bodyLarge!.copyWith(fontSize: 20),),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 7,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 0, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Now Showing',
                  style: theme.textTheme.bodyLarge,
                ),
                FloatingActionButton(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    clipBehavior: Clip.none,
                    mini: true,
                    child: const Icon(
                      Icons.search_rounded,
                      size: 20,
                    ),
                    onPressed: () {})
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 4,
                    mainAxisSpacing: 14,
                    childAspectRatio: (150 / 220)),
                children: [
                  ...images.map((image) {
                    return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => InCinemaDetailsShowing()));
                        },
                        child: MovieCard1(image: 'assets/images/$image'));
                  }).toList()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}