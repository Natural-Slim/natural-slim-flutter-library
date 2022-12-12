import 'water_timeline_notification.dart';

class Recurrence {
    Recurrence({
        required this.frequency,
        required this.count,
        required this.timeline,
    });

    String frequency;
    int count;
    List<Timeline> timeline;

    factory Recurrence.fromJson(Map<String, dynamic> json) => Recurrence(
        frequency: json["frequency"],
        count: json["count"],
        timeline: List<Timeline>.from(json["timeline"].map((x) => Timeline.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "frequency": frequency,
        "count": count,
        "timeline": List<dynamic>.from(timeline.map((x) => x.toJson())),
    };
}