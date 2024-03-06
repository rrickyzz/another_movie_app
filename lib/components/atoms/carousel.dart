import 'dart:developer';

import 'package:another_movie_app/components/screens/movie_info.dart';
import 'package:another_movie_app/controllers/movie_controller.dart';
import 'package:another_movie_app/models/movies/movie_basic_info.dart';
import 'package:another_movie_app/models/movies/movie_info.dart';
import 'package:another_movie_app/styles/colours.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Carousel extends StatelessWidget {
  final List<MovieBasicInfo> movies;
  const Carousel({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    final MovieController movieController = Get.put(MovieController());
    return CarouselSlider(
      options: CarouselOptions(
          viewportFraction: 1.0,
          height: 300.0,
          autoPlay: true,
          autoPlayCurve: Curves.easeInOut),
      items: movies.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return FutureBuilder(
              future: movieController.fetchMovieInfo(i.imdbID ?? ''),
              builder: (context, snapshot) {
                inspect(i);
                if (snapshot.data?.poster == null) {
                  return Center(
                    child: SizedBox(
                        width: 50,
                        height: 50,
                        child: CircularProgressIndicator(
                            color: Colours.redScheme)),
                  );
                }
                return Hero(
                  tag: 'movie-info',
                  child: GestureDetector(
                    onTap: () {
                      Get.to(
                          MovieInfoScreen(
                            info: i,
                          ),
                          arguments: snapshot.data);
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: CachedNetworkImage(
                        width: MediaQuery.of(context).size.width * .9,
                        height: 300,
                        fadeInCurve: Easing.linear,
                        fadeOutCurve: Easing.linear,
                        fit: BoxFit.scaleDown,
                        imageUrl: snapshot.data?.poster ?? '',
                      ),
                    ),
                  ),
                );
              },
            );
          },
        );
      }).toList(),
    );
  }
}
