import 'package:flutter/material.dart';
import 'package:peliculas20253/provider/movies_provider.dart';
import 'package:peliculas20253/widgets/card_swiper.dart';
import 'package:peliculas20253/widgets/movies_slider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(
            onPressed: (){},
            icon: const Icon(Icons.search_outlined)
          )
        ],
        title: const Text('Películas en cines'),

      ),
      body: Column(
        children: [
          CardSwiper(movies: moviesProvider.onDisplayMovies),
          MovieSlider(movies: moviesProvider.popularMovies)
        ],
      )
    );
  }
}