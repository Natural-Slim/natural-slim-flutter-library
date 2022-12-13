// To parse this JSON data, do
//
//     final glucoseNotificationSettingModel = glucoseNotificationSettingModelFromJson(jsonString);

import 'dart:convert';

import 'glucose_setting_model.dart';

class GlucoseNotificationSettingModel {
    GlucoseNotificationSettingModel({
      required this.glucoseNotificationSettings,
    });

    GlucoseNotificationSettings glucoseNotificationSettings;

    static GlucoseNotificationSettingModel glucoseNotificationSettingModelFromJson(String str) => GlucoseNotificationSettingModel.fromJson(json.decode(str));

    static String glucoseNotificationSettingModelToJson(GlucoseNotificationSettingModel data) => json.encode(data.toJson());

    factory GlucoseNotificationSettingModel.fromJson(Map<String, dynamic> json) => GlucoseNotificationSettingModel(
        glucoseNotificationSettings: GlucoseNotificationSettings.fromJson(json["glucose_notification_settings"]),
    );

    Map<String, dynamic> toJson() => {
        "glucose_notification_settings": glucoseNotificationSettings.toJson(),
    };
}
