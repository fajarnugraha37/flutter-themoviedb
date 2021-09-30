class Person {
  int id;
  int gender; // 1 female
  String name;
  String knownForDepartement;
  String profilePath;
  double popularity;

  // get path => "https://image.tmdb.org/t/p/original$profilePath";
  get path => "https://image.tmdb.org/t/p/w500$profilePath";

  Person({
    required this.id,
    required this.gender,
    required this.name,
    required this.knownForDepartement,
    required this.profilePath,
    required this.popularity,
  });

  factory Person.jsonParser(object) {
    return Person(
      id: object["id"],
      gender: object["gender"],
      name: object["name"],
      knownForDepartement: object["known_for_department"],
      profilePath: object["profile_path"],
      popularity: object["popularity"],
    );
  }
}
