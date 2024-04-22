// To parse this JSON data, do
//
//     final collectionModel = collectionModelFromJson(jsonString);

import 'dart:convert';

RolexModel collectionModelFromJson(String str) => RolexModel.fromJson(json.decode(str));

String collectionModelToJson(RolexModel data) => json.encode(data.toJson());

class RolexModel {
  List<Datum>? data;

  RolexModel({
    this.data,
  });

  factory RolexModel.fromJson(Map<String, dynamic> json) => RolexModel(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  int? id;
  int? collectionId;
  String? collectionName;
  String? name;
  String? slug;
  int? price;
  String? stock;
  String? image;
  String? location;
  String? features;
  String? link;
  String? benefits;
  String? store;
  String? createdAt;
  String? updatedAt;

  Datum({
    this.id,
    this.collectionId,
    this.collectionName,
    this.name,
    this.slug,
    this.price,
    this.stock,
    this.image,
    this.location,
    this.features,
    this.link,
    this.benefits,
    this.store,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    collectionId: json["collection_id"],
    collectionName: json["collection_name"],
    name: json["name"],
    slug: json["slug"],
    price: json["price"],
    stock: json["stock"],
    image: json["image"],
    location: json["location"],
    features: json["features"],
    link: json["link"],
    benefits: json["benefits"],
    store: json["store"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "collection_id": collectionId,
    "collection_name": collectionName,
    "name": name,
    "slug": slug,
    "price": price,
    "stock": stock,
    "image": image,
    "location": location,
    "features": features,
    "link": link,
    "benefits": benefits,
    "store": store,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}
