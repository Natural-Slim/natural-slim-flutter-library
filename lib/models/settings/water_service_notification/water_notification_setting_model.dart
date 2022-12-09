import 'dart:convert';

import 'water_recurrence_notification_model.dart';

class WaterNotificationSettings {
    WaterNotificationSettings({
        required this.recurrence,
        required this.objectUpdated,
    });

    Recurrence recurrence;
    DateTime objectUpdated;

    static WaterNotificationSettings waterNotificationSettingModelFromJson(String str) => WaterNotificationSettings.fromJson(json.decode(str));

    static String waterNotificationSettingModelToJson(WaterNotificationSettings data) => json.encode(data.toJson());

    factory WaterNotificationSettings.fromJson(Map<String, dynamic> json) => WaterNotificationSettings(
        recurrence: Recurrence.fromJson(json["recurrence"]),
        objectUpdated: DateTime.parse(json["object_updated"]),
    );

    Map<String, dynamic> toJson() => {
        "recurrence": recurrence.toJson(),
        "object_updated": objectUpdated.toIso8601String(),
    };
}
