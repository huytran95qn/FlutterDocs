import 'dart:async';

import 'package:clone_kia_project/models/module.dart';
import 'package:clone_kia_project/networking/module.dart';
import 'package:clone_kia_project/services/module.dart';

class MovieBloc {
  MovieRepository _movieRepository;

  StreamController _movieListController;

  StreamSink<ApiResponse<List<Movie>>> get movieListSink => _movieListController.sink;

  Stream<ApiResponse<List<Movie>>> get movieListStream => _movieListController.stream;

  MovieBloc() {
    _movieListController = StreamController<ApiResponse<List<Movie>>>();
    _movieRepository = MovieRepository();
    fetchMovieList();
  }

  fetchMovieList() async {
    movieListSink.add(ApiResponse.loading('Fetching Popular Movies'));
    try {
      List<Movie> movies = await _movieRepository.fetchMovieList();
      movieListSink.add(ApiResponse.completed(movies));
    } catch (e) {
      movieListSink.add(ApiResponse.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _movieListController?.close();
  }
}
