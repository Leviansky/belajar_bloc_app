// To parse this JSON data, do
//
//     final weatherModel = weatherModelFromJson(jsonString);

import 'dart:convert';

List<WeatherModel> weatherModelFromJson(String str) => List<WeatherModel>.from(
    json.decode(str).map((x) => WeatherModel.fromJson(x)));

String weatherModelToJson(List<WeatherModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

WeatherModel weatherFromJson(String str) =>
    WeatherModel.fromJson(json.decode(str));

String weatherToJson(WeatherModel data) => json.encode(data.toJson());

class WeatherModel {
  WeatherModel({
    this.id,
    this.name,
    this.description,
    this.price,
    this.stars,
    this.people,
    this.selectedPeople,
    this.img,
    this.location,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  String? description;
  int? price;
  int? stars;
  int? people;
  int? selectedPeople;
  String? img;
  String? location;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        stars: json["stars"],
        people: json["people"],
        selectedPeople: json["selected_people"],
        img: json["img"],
        location: json["location"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "price": price,
        "stars": stars,
        "people": people,
        "selected_people": selectedPeople,
        "img": img,
        "location": location,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}

List<WeatherModel> parseWeather(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed
      .map<WeatherModel>((json) => WeatherModel.fromJson(json))
      .toList();
}
