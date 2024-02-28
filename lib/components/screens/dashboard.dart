import 'package:another_movie_app/components/atoms/carousel.dart';
import 'package:another_movie_app/components/atoms/search_bar.dart';
import 'package:another_movie_app/components/molecules/bottom_navbar.dart';
import 'package:another_movie_app/components/molecules/categories.dart';
import 'package:another_movie_app/controllers/movie_controller.dart';
import 'package:another_movie_app/models/movies/movie_basic_info.dart';
import 'package:another_movie_app/styles/colours.dart';
import 'package:another_movie_app/styles/dimensions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final MovieController movieController = Get.put(MovieController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colours.superDark,
      bottomNavigationBar: const BottomNavBar(),
      body: Container(
        padding: AppDimensions.screenScaffoldPadding,
        child: SingleChildScrollView(
          child: Column(children: [
            MovieSearchBar(
                placeHolder: 'Search Movies,Series and Others',
                controller: TextEditingController()),
            const Gap(20),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Latest Movies',
                style: GoogleFonts.plusJakartaSans(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
            ),
            const Gap(20),
            FutureBuilder(
              future: movieController.fetchLatestMovies(),
              builder: (context, snapshot) {
                var movies = snapshot.data?.result?.items
                    ?.map((e) => MovieBasicInfo(
                        embedUrlImdb: e.embedUrlImdb,
                        embedUrlTmdb: e.embedUrlTmdb,
                        imdbID: e.imdbId,
                        title: e.title,
                        tmdbId: e.tmdbId))
                    .toList();

                return Carousel(
                  movies: movies ?? [],
                );
              },
            ),
            const Gap(50),
            const Categories(),
            const Gap(20),
            FutureBuilder(
              future: movieController.fetchLatestMovies(),
              builder: (context, snapshot2) {
                return SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 500,
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 40,
                    ),
                    itemCount: snapshot2.data?.result?.items?.length ?? 0,
                    itemBuilder: (BuildContext context, int index) {
                      return FutureBuilder(
                        future: movieController.fetchMovieInfo(
                            snapshot2.data?.result?.items?[index].imdbId ?? ''),
                        builder: (context, snapshot) {
                          if (snapshot.data?.poster == null) {
                            return Center(
                              child: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: CircularProgressIndicator(
                                      color: Colours.redScheme)),
                            );
                          }
                          return SizedBox(
                            height: 600,
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: CachedNetworkImage(
                                    width:
                                        MediaQuery.of(context).size.width * .25,
                                    height: 90,
                                    fadeInCurve: Easing.linear,
                                    fadeOutCurve: Easing.linear,
                                    fit: BoxFit.cover,
                                    imageUrl: snapshot.data?.poster ?? '',
                                  ),
                                ),
                                const Gap(12),
                                SizedBox(
                                  width: 120,
                                  child: Text(
                                    snapshot2.data?.result?.items![index]
                                            .title ??
                                        '',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.inter(
                                        fontSize: 14,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                );
              },
            )
          ]),
        ),
      ),
    );
  }
}
