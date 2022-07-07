// To parse this JSON data, do
//
//     final imageRequestModel = imageRequestModelFromJson(jsonString);

import 'dart:convert';


class ImageRequestModel {
    ImageRequestModel({
      required this.images,
    });

    Map<String, String> images;

    static ImageRequestModel imageRequestModelFromJson(String str) => ImageRequestModel.fromJson(json.decode(str));

    static String imageRequestModelToJson(ImageRequestModel data) => json.encode(data.toJson());

    factory ImageRequestModel.fromJson(Map<String, dynamic> json) => ImageRequestModel(
        images: Map<String, String>.from(json['widget_data'] as Map),
    );

    Map<String, dynamic> toJson() => {
        "images": images,
    };
}