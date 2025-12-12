import 'package:flutter/material.dart';
import 'package:peliculas20253/provider/movies_provider.dart';
import 'package:peliculas20253/screens/details_screen.dart';
import 'package:peliculas20253/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(const AppState());


class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MoviesProvider(),
          lazy: false,
        )
      ],
      child: MyApp()
    );
  }
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Películas',
      
      initialRoute: 'home',
      routes: {
        'home' : (_) => HomeScreen(),
        'details' : (_) => DetailsScreen(),
      }
    );
  }
}