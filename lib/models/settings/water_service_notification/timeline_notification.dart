class TimelineNotification {
    TimelineNotification({
        required this.id,
        this.day,
        required this.time,
        required this.title,
        required this.message,
    });

    int id;
    int? day;
    String time;
    String title;
    String message;

    factory TimelineNotification.fromJson(Map<String, dynamic> json) => TimelineNotification(
        id: json["id"],
        day: json["day"],
        time: json["time"],
        title: json["title"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "day": day,
        "time": time,
        "title": title,
        "message": message,
    };
}