//Muhammad Nazrin Bin Hazrul Nizam
//S63683
//16 Dec 2023
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'movie.dart';

class HttpHelper {
  final String urlKey = 'api_key=854e23bfd47ea8c274979c998bad1b85';
  final String urlBase = 'https://api.themoviedb.org/3/movie';
  final String urlUpcoming = '/upcoming?';
  final String urlLanguage = '&language=en-US';
  final String urlSearchBase = 
  'https://api.themoviedb.org/3/search/movie?api_key=854e23bfd47ea8c274979c998bad1b85&query=';

  Future<List?> getUpcoming() async {
    final String upcoming = urlBase + urlUpcoming + urlKey + urlLanguage;
    var url = Uri.parse(upcoming);
    http.Response result = await http.get(url);

    if (result.statusCode == HttpStatus.ok) {
      print('Debug http_helper.dart => statusCode OK!');
      final jsonResponse = json.decode(result.body);
      print('debug http_helper.dart => jsonResponse = $jsonResponse');
      final moviesMap = jsonResponse['results'];
      List movies = moviesMap.map((i) => Movie.fromJson(i)).toList();
      return movies;
    } else {
      return null;
    }
  }

  Future<List?> findMovies(String title) async {
    final String query = urlSearchBase + title;
    print('Test: ' + title);
    var urlQuery = Uri.parse(query);
    http.Response result = await http.get(urlQuery);
    if (result.statusCode == HttpStatus.ok) {
      print('Debug http_helper in find movie ok');
      final jsonResponse = json.decode(result.body);
      final moviesMap = jsonResponse['result'];
      List movies = moviesMap.map((i) => Movie.fromJson(i)).toList();
      return movies;
    } else {
      return null;
    }
  }
}