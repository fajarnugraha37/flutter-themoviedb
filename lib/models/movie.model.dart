class Movie {
  int id;
  String title;
  String overview;
  double popularity;
  // String backdropPath;
  String posterPath;

  // DateTime releaseDate;
  // int voteAverage;
  int voteCount;

  // get poster => "https://image.tmdb.org/t/p/original" + posterPath;
  get poster => "https://image.tmdb.org/t/p/w500" + posterPath;

  Movie({
    required this.id,
    required this.title,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.voteCount,
  });

  factory Movie.jsonParser(object) {
    return Movie(
      id: object["id"],
      title: object["title"],
      overview: object["overview"],
      popularity: object["popularity"],
      posterPath: object["poster_path"],
      voteCount: object["vote_count"],
    );
  }
}
