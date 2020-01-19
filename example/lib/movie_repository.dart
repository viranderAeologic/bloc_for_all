
import 'package:bloc_for_all/api/api_base_helper.dart';
import 'package:example/movie_response.dart';
import 'movie_bloc.dart';
class MovieRepository {
  final String _apiKey = "78b9f63937763a206bff26c070b94158";

  ApiBaseHelper _helper = ApiBaseHelper("http://api.themoviedb.org/3/");

  Future<List<Movie>> fetchMovieList() async {
    final response = await _helper.get("movie/popular?api_key=$_apiKey");
    return MovieResponse.fromJson(response).results;
  }
}
