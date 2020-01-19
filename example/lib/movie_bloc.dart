import 'dart:async';

import 'package:bloc_for_all/api/base_api_bloc.dart';
import 'package:flutter/material.dart';

import 'package:example/movie_repository.dart';

import 'movie_response.dart';

class MovieBloc extends BaseApiBloc<List<Movie>> {
  MovieRepository _movieRepository;

  MovieBloc() {
    _movieRepository = MovieRepository();
    fetchMovieList();
  }

  fetchMovieList() async {
    startLoading('Fetching Popular Movies');
    try {
      List<Movie> movies = await _movieRepository.fetchMovieList();
      addData(movies);
    } catch (e) {
      addError(e.toString());
      print(e);
    }
  }
}

