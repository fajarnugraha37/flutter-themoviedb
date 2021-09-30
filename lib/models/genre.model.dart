class Genre {
  int id;
  String name;

  Genre({required this.id, required this.name});

  factory Genre.jsonParser(object) {
    return Genre(
      id: object["id"],
      name: object["name"],
    );
  }
}
