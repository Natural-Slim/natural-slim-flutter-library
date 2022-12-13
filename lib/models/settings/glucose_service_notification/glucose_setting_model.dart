import '../water_service_notification/recurrence_notification_model.dart';

class GlucoseNotificationSettings {
    GlucoseNotificationSettings({
      required this.recurrence,
      required this.objectUpdated,
    });

    RecurrenceNotification recurrence;
    DateTime objectUpdated;

    factory GlucoseNotificationSettings.fromJson(Map<String, dynamic> json) => GlucoseNotificationSettings(
        recurrence: RecurrenceNotification.fromJson(json["recurrence"]),
        objectUpdated: DateTime.parse(json["object_updated"]),
    );

    Map<String, dynamic> toJson() => {
        "recurrence": recurrence.toJson(),
        "object_updated": objectUpdated.toIso8601String(),
    };
}