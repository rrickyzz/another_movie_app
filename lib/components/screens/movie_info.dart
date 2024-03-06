import 'package:another_movie_app/components/atoms/appbar_back_btn.dart';
import 'package:another_movie_app/components/player/player.dart';
import 'package:another_movie_app/components/atoms/tag.dart';
import 'package:another_movie_app/models/movies/movie_basic_info.dart';
import 'package:another_movie_app/models/movies/movie_info.dart';
import 'package:another_movie_app/styles/colours.dart';
import 'package:another_movie_app/styles/dimensions.dart';
import 'package:another_movie_app/styles/textstyles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class MovieInfoScreen extends StatelessWidget {
  final MovieBasicInfo info;
  const MovieInfoScreen({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    final movieInfo = Get.arguments as MovieInfo;

    return Stack(
      children: [
        Scaffold(
          body: Container(
            width: AppDimensions.width(context),
            height: AppDimensions.height(context),
            color: Colours.superDark,
            child: Stack(
              children: [
                Hero(
                  tag: 'movie-info',
                  child: Stack(
                    children: [
                      SizedBox(
                        width: AppDimensions.width(context),
                        height: 350.h,
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: movieInfo.poster ?? '',
                          errorWidget: (context, url, error) {
                            return Center(
                                child: Icon(
                              Icons.image,
                              color: Colours.lightGrey,
                              size: 50.h,
                            ));
                          },
                        ),
                      ),
                      Positioned(
                        top: 20,
                        child: AnimatedContainer(
                          width: AppDimensions.width(context),
                          height: 350.h,
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.transparent, Colors.black],
                          )),
                          duration: const Duration(milliseconds: 200),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 150.h),
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colours.redScheme,
                                shape: BoxShape.circle),
                            width: 80,
                            height: 80,
                            child: IconButton(
                                onPressed: () {
                                  if (info.embedUrlImdb == null) {
                                    return;
                                  }
                                  Get.to(const VidPlayerScreen(
                                      url:
                                          'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'));
                                },
                                icon: const Icon(
                                  Icons.play_arrow_rounded,
                                  color: Colors.white,
                                  size: 64,
                                )),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: AppDimensions.screenScaffoldPadding,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppbarBackButton(),
                      Gap(250.h),
                      const MovieTag(title: 'New Release'), const Gap(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: AppDimensions.width(context) * .65,
                            child: Text(
                              movieInfo.title ?? '',
                              style: GoogleFonts.inter(
                                  fontSize: 32,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              if (movieInfo.imdbVotes != null ||
                                  movieInfo.imdbVotes == 'N/A')
                                MovieAnotherTag(
                                  title: movieInfo.imdbVotes ?? '',
                                ),
                              const Gap(20),
                              if (movieInfo.imdbRating != null ||
                                  movieInfo.imdbRating == 'N/A')
                                MovieAnotherTag(
                                  title: movieInfo.imdbRating ?? '',
                                ),
                            ],
                          )
                        ],
                      ),
                      const Gap(20),
                      Row(
                        children: [
                          Text(
                            movieInfo.released ?? '',
                            style: AppTextStyles.h4w600,
                          ),
                          const Gap(20),
                          Text(
                            '•   ${movieInfo.genre ?? ''}',
                            style: AppTextStyles.h4w600,
                          ),
                        ],
                      ),
                      const Gap(20),
                      Text(
                        movieInfo.plot ?? '',
                        style: AppTextStyles.pw400,
                      )

                      //  CachedNetworkImage(imageUrl: imageUrl)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
