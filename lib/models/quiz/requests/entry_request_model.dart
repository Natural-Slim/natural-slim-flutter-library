// To parse this JSON data, do
//
//     final entryRequestModel = entryRequestModelFromJson(jsonString);

import 'dart:convert';

class EntryRequestModel {
  EntryRequestModel({
    required this.entryId,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.callDecline,
    required this.apptDate,
    required this.apptLocation,
    required this.apptNote,
    required this.ipcountryname,
    required this.iplocation,
    required this.ipclient,
    required this.region,
  });

  String entryId;
  String firstName;
  String lastName;
  String email;
  String phone;
  String callDecline;
  String apptDate;
  String apptLocation;
  String apptNote;
  String ipcountryname;
  String iplocation;
  String ipclient;
  String region;

  static EntryRequestModel entryRequestModelFromJson(String str) => EntryRequestModel.fromJson(json.decode(str));

  static String entryRequestModelToJson(EntryRequestModel data) => json.encode(data.toJson());

  factory EntryRequestModel.fromJson(Map<String, dynamic> json) => EntryRequestModel(
    entryId: json["entryId"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    email: json["email"],
    phone: json["phone"],
    callDecline: json["callDecline"],
    apptDate: json["apptDate"],
    apptLocation: json["apptLocation"],
    apptNote: json["apptNote"],
    ipcountryname: json["ipcountryname"],
    iplocation: json["iplocation"],
    ipclient: json["ipclient"],
    region: json["region"],
  );

  Map<String, dynamic> toJson() => {
    "entryId": entryId,
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "phone": phone,
    "callDecline": callDecline,
    "apptDate": apptDate,
    "apptLocation": apptLocation,
    "apptNote": apptNote,
    "ipcountryname": ipcountryname,
    "iplocation": iplocation,
    "ipclient": ipclient,
    "region": region,
  };
}
