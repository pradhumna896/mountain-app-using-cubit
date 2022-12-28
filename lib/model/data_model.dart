class DataModel {
  String name;
  String img;
  int price;
  int people;
  int strar;
  String description;
  String location;
  DataModel(
      {required this.name,
      required this.img,
      required this.price,
      required this.description,
      required this.location,
      required this.people,
      required this.strar});

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
        name: json["name"],
        img: json['img'],
        price: json["price"],
        description: json["description"],
        location: json["location"],
        people: json["people"],
        strar: json["stars"]);
  }
}
