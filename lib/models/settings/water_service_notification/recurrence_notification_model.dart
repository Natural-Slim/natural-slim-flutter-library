import 'timeline_notification.dart';

class RecurrenceNotification {
    RecurrenceNotification({
        required this.frequency,
        required this.count,
        required this.timeline,
    });

    String frequency;
    int count;
    List<TimelineNotification> timeline;

    factory RecurrenceNotification.fromJson(Map<String, dynamic> json) => RecurrenceNotification(
        frequency: json["frequency"],
        count: json["count"],
        timeline: List<TimelineNotification>.from(json["timeline"].map((x) => TimelineNotification.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "frequency": frequency,
        "count": count,
        "timeline": List<dynamic>.from(timeline.map((x) => x.toJson())),
    };
}