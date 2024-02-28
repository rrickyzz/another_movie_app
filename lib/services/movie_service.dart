import 'package:get/get.dart';

class MovieService extends GetConnect {
  Future<Response> getLatesMovies() async {
    final response = await get('https://vidsrc.to/vapi/movie/new');
    return response;
  }

  Future<Response> getMoviesInfo(String imdbId) async {
    final response =
        await get('http://www.omdbapi.com/?i=$imdbId&apikey=11294d9e');
    return response;
  }
}
