import "dart:convert";
import "package:flutter/material.dart";
import "package:http/http.dart" as http;
import "package:peliculas20253/models/credit_response.dart";
import "package:peliculas20253/models/movie.dart";
import "package:peliculas20253/models/now_playing_response.dart";
import "package:peliculas20253/models/popular_response.dart";

class MoviesProvider extends ChangeNotifier {
  String _baseUrl = 'api.themoviedb.org';
  String _apiKey = '9dc27117b000e7e5acfb365fa957971a';
  String _language = 'es-MX';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];
  Map<int, List<Cast>> movieCast = {};
  
  MoviesProvider() {
    print("MoviesProvider inicializado");
    this.getOnDisplayMovies();
    this.getPopularMovies();
  }

  getOnDisplayMovies() async {
    var url = Uri.https(_baseUrl, '/3/movie/now_playing',
        {'api_key': _apiKey, 'language': _language, 'page': '1'});

    final response = await http.get(url);
    final Map<String, dynamic> decodedData = json.decode(response.body);
    final nowPlayingResponse =
        NowPlayingResponse.fromRawJson(response.body);

    onDisplayMovies = nowPlayingResponse.results;
    notifyListeners();
  }

  getPopularMovies() async {
    var url = Uri.https(_baseUrl, '/3/movie/popular',
        {'api_key': _apiKey, 'language': _language, 'page': '1'});

    final response = await http.get(url);
    final popularResponse = PopularResponse.fromRawJson(response.body);

    popularMovies = [...popularMovies, ...popularResponse.results];
    notifyListeners();
  }

  Future<List<Cast>> getMovieCast(int movieId) async {
    if (movieCast.containsKey(movieId)) return movieCast[movieId]!;

    var url = Uri.https(_baseUrl, '/3/movie/$movieId/credits',
        {'api_key': _apiKey, 'language': _language});

    final response = await http.get(url);
    final creditsResponse = CreditsResponse.fromRawJson(response.body);

    movieCast[movieId] = creditsResponse.cast;
    return creditsResponse.cast;
  }

}