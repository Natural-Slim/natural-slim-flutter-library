// To parse this JSON data, do
//
//     final hoursLocationAvailableResponse = hoursLocationAvailableResponseFromJson(jsonString);

import 'dart:convert';


class HoursLocationAvailableResponse {
  HoursLocationAvailableResponse({
    required this.date,
    required this.hours,
  });

  DateTime date;
  List<String> hours;

  static List<HoursLocationAvailableResponse> hoursLocationAvailableResponseFromJson(String str) => List<HoursLocationAvailableResponse>.from(json.decode(str).map((x) => HoursLocationAvailableResponse.fromJson(x)));

  static String hoursLocationAvailableResponseToJson(List<HoursLocationAvailableResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

  factory HoursLocationAvailableResponse.fromJson(Map<String, dynamic> json) => HoursLocationAvailableResponse(
    date: DateTime.parse(json["date"]),
    hours: List<String>.from(json["hours"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "date": date.toIso8601String(),
    "hours": List<dynamic>.from(hours.map((x) => x)),
  };
}
