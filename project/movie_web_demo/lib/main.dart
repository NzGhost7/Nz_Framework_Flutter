import 'package:flutter/material.dart';
import 'movie_list.dart';

void main() => runApp(MyMovies());

class MyMovies extends StatelessWidget {
  //const MyMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Movies',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  //const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MovieList();
  }
}