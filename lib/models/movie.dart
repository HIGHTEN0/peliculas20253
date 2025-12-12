class Movie {
  bool adult;
  String? backdropPath;
  List<int> genreIds;
  int id;
  String originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  String posterPath;
  String releaseDate;
  String title;
  bool video;
  double voteAverage;
  int voteCount;

  Movie({
    required this.adult,
    this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  // Imagen completa del póster
  get fullPosterImg {
    if (posterPath.isNotEmpty) {
      return 'https://image.tmdb.org/t/p/w500$posterPath';
    }
    return 'https://i.stack.imgur.com/GNhxO.png';
  }

  // Imagen completa del backdrop
  get fullBackdropPath {
    if (backdropPath != null && backdropPath!.isNotEmpty) {
      return 'https://image.tmdb.org/t/p/w500$backdropPath';
    }
    return 'https://i.stack.imgur.com/GNhxO.png';
  }

  // Factory para parsear desde JSON
  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        adult: json['adult'] ?? false,
        backdropPath: json['backdrop_path'] ?? "",
        genreIds: List<int>.from(json['genre_ids'].map((x) => x)),
        id: json['id'],
        originalLanguage: json['original_language'] ?? "",
        originalTitle: json['original_title'] ?? "",
        overview: json['overview'] ?? "",
        popularity: (json['popularity'] ?? 0).toDouble(),
        posterPath: json['poster_path'] ?? "",
        releaseDate: json['release_date'] ?? "",
        title: json['title'] ?? "",
        video: json['video'] ?? false,
        voteAverage: (json['vote_average'] ?? 0).toDouble(),
        voteCount: json['vote_count'] ?? 0,
      );
}