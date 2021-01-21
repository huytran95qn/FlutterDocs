import 'package:clone_kia_project/models/module.dart';
import 'package:clone_kia_project/networking/base_service.dart';

class MovieRepository extends BaseService {
  Future<List<Movie>> fetchMovieList() async {
    final response = await super.get("https://demo1038416.mockable.io/movie");
    return MovieResponse.fromJson(response).results;
  }
}