import 'package:natural_slim_flutter_library/models/settings/water_service_notification/recurrence_notification_model.dart';

class SizeSettingsModel {
    SizeSettingsModel({
      required this.recurrence,
      required this.objectUpdated,
    });

    RecurrenceNotification recurrence;
    DateTime objectUpdated;

    factory SizeSettingsModel.fromJson(Map<String, dynamic> json) => SizeSettingsModel(
        recurrence: RecurrenceNotification.fromJson(json["recurrence"]),
        objectUpdated: DateTime.parse(json["object_updated"]),
    );

    Map<String, dynamic> toJson() => {
        "recurrence": recurrence.toJson(),
        "object_updated": objectUpdated.toIso8601String(),
    };
}