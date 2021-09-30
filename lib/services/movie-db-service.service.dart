import 'package:flutter_application/models/genre.model.dart';
import 'package:flutter_application/models/movie.model.dart';
import 'package:flutter_application/models/person.model.dart';
import 'package:flutter_application/services/http.service.dart';

class MovieDbService {
  static const String POPULAR = "popular";
  static const String NOW_PLAYING = "now_playing";
  static const String UP_COMING = "upcoming";
  static const String TOP_RATED = "top_rated";
  static const String LATEST = "latest";

  final String token = ""; //change with your moviedb token
  HttpService httpService =
      HttpService(baseUrl: "https://api.themoviedb.org/3/", headers: {});

  Future<List<Movie>> getMovie(String category, int page) async {
    HttpResult httpResult = await httpService.get(
      slug:
          "movie/$category?api_key=$token&language=en-US&page=${page.toString()}",
    );

    List<Movie> movies = List.empty(growable: true);
    if (!httpResult.isError) {
      for (Map<String, dynamic> element in httpResult.response["results"]) {
        if (element["id"] is int &&
            element["title"] is String &&
            element["overview"] is String &&
            element["popularity"] is double &&
            element["poster_path"] is String &&
            element["vote_count"] is int) {
          movies.add(Movie.jsonParser(element));
        }
      }
    }
    print("size" + movies.length.toString());
    return movies;
  }

  Future<List<Genre>> getGenre() async {
    HttpResult httpResult = await httpService.get(
      slug: "genre/movie/list?api_key=$token&language=en-US",
    );

    List<Genre> genres = List.empty(growable: true);
    if (!httpResult.isError) {
      for (var element in httpResult.response["genres"]) {
        genres.add(Genre.jsonParser(element));
      }
    }
    return genres;
  }

  Future<List<Person>> getPerson(int page) async {
    HttpResult httpResult = await httpService.get(
      slug:
          "person/popular?api_key=$token&language=en-US&page=${page.toString()}",
    );

    List<Person> persons = List.empty(growable: true);
    if (!httpResult.isError) {
      for (var element in httpResult.response["results"]) {
        persons.add(Person.jsonParser(element));
      }
    }
    return persons;
  }

  Future<List<Movie>> searchMovie(String search, int page) async {
    HttpResult httpResult = await httpService.get(
      slug:
          "search/movie?api_key=$token&language=en-US&query=$search&page=$page&include_adult=false",
    );

    List<Movie> movies = List.empty(growable: true);
    if (!httpResult.isError) {
      for (Map<String, dynamic> element in httpResult.response["results"]) {
        if (element["id"] is int &&
            element["title"] is String &&
            element["overview"] is String &&
            element["popularity"] is double &&
            element["poster_path"] is String &&
            element["vote_count"] is int) {
          movies.add(Movie.jsonParser(element));
        }
      }
    }
    print("size" + movies.length.toString());
    return movies;
  }

  Future<List<Movie>> getMovieByPerson(int idPerson) async {
    HttpResult httpResult = await httpService.get(
      slug:
          "person/${idPerson.toString()}/movie_credits?api_key=$token&language=en-US",
    );

    List<Movie> movies = List.empty(growable: true);
    if (!httpResult.isError) {
      for (Map<String, dynamic> element in httpResult.response["cast"]) {
        if (element.containsKey("id") &&
            element.containsKey("title") &&
            element.containsKey("overview") &&
            element.containsKey("popularity") &&
            element["poster_path"] is String &&
            element.containsKey("vote_count")) {
          movies.add(Movie.jsonParser(element));
        }
      }
    }
    print("size" + movies.length.toString());
    return movies;
  }

  Future<Map<String, dynamic>> getDetailMovie(int idMovie) async {
    HttpResult httpResult = await httpService.get(
      slug: "movie/${idMovie.toString()}?api_key=$token&language=en-US",
    );

    return httpResult.response;
  }
}
