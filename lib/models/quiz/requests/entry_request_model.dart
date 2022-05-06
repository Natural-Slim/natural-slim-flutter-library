// To parse this JSON data, do
//
//     final entryRequestModel = entryRequestModelFromJson(jsonString);

import 'dart:convert';



class EntryRequestModel {
  EntryRequestModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    this.callDecline,
    required this.ipcountryname,
    required this.iplocation,
    required this.type,
    required this.adSource,
    required this.apptDate,
    required this.apptLocation,
    required this.apptNote,
    required this.edate,
  });

  String firstName;
  String lastName;
  String email;
  String phone;
  String? callDecline;
  String ipcountryname;
  String iplocation;
  String type;
  int adSource;
  String apptDate;
  String apptLocation;
  String apptNote;
  DateTime edate;

  static EntryRequestModel entryRequestModelFromJson(String str) => EntryRequestModel.fromJson(json.decode(str));

  static String entryRequestModelToJson(EntryRequestModel data) => json.encode(data.toJson());

  factory EntryRequestModel.fromJson(Map<String, dynamic> json) => EntryRequestModel(
    firstName: json["firstName"],
    lastName: json["lastName"],
    email: json["email"],
    phone: json["phone"],
    callDecline: json["callDecline"],
    ipcountryname: json["ipcountryname"],
    iplocation: json["iplocation"],
    type: json["type"],
    adSource: json["adSource"],
    apptDate: json["apptDate"],
    apptLocation: json["apptLocation"],
    apptNote: json["apptNote"],
    edate: DateTime.parse(json["edate"]),
  );

  Map<String, dynamic> toJson() => {
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "phone": phone,
    "callDecline": callDecline,
    "ipcountryname": ipcountryname,
    "iplocation": iplocation,
    "type": type,
    "adSource": adSource,
    "apptDate": apptDate,
    "apptLocation": apptLocation,
    "apptNote": apptNote,
    "edate": edate.toIso8601String(),
  };
}
