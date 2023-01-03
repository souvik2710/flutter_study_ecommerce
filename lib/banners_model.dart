// To parse this JSON data, do
//
//     final photosModel = photosModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<BannersModel> photosModelFromJson(String str) => List<BannersModel>.from(json.decode(str).map((x) => BannersModel.fromJson(x)));

String photosModelToJson(List<BannersModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BannersModel {
  BannersModel({
    required this.id,
    required this.url,

  });
  
  int id;
  String url;

  factory BannersModel.fromJson(Map<String, dynamic> json) => BannersModel(
    id: json["id"] == null ? null : json["id"],
    url: json["url"] == null ? null : json["url"],
   );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "url": url == null ? null : url,
   };
}

