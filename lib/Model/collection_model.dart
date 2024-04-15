// To parse this JSON data, do
//
//     final collectionModel = collectionModelFromJson(jsonString);

import 'dart:convert';

CollectionModel collectionModelFromJson(String str) => CollectionModel.fromJson(json.decode(str));

String collectionModelToJson(CollectionModel data) => json.encode(data.toJson());

class CollectionModel {
  List<Datum>? data;

  CollectionModel({
    this.data,
  });

  factory CollectionModel.fromJson(Map<String, dynamic> json) => CollectionModel(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  int? id;
  String? name;
  String? slug;
  String? createdAt;
  String? updatedAt;

  Datum({
    this.id,
    this.name,
    this.slug,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    slug: json["slug"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "slug": slug,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}
