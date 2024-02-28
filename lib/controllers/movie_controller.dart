import 'dart:developer';
import 'package:another_movie_app/models/movies/latest_movie.dart';
import 'package:another_movie_app/models/movies/movie_info.dart';
import 'package:another_movie_app/services/movie_service.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class MovieController extends GetxController {
  LatestMovies? latestMovies;
  MovieService movieService = MovieService();

  Future<LatestMovies?> fetchLatestMovies() async {
    var res = await movieService.getLatesMovies();
    latestMovies = LatestMovies.fromJson(res.body);
    inspect(latestMovies);
    return latestMovies;
  }

  Future<MovieInfo?> fetchMovieInfo(String imdbId) async {
    var res = await movieService.getMoviesInfo(imdbId);
    return MovieInfo.fromJson(res.body);
  }
}
