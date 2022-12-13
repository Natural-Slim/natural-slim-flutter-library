import 'water_notification_setting_model.dart';

class WaterNotificationSettingModel {
    WaterNotificationSettingModel({
        required this.waterNotificationSettings,
    });

    WaterNotificationSettings waterNotificationSettings;

    factory WaterNotificationSettingModel.fromJson(Map<String, dynamic> json) => WaterNotificationSettingModel(
        waterNotificationSettings: WaterNotificationSettings.fromJson(json["water_notification_settings"]),
    );

    Map<String, dynamic> toJson() => {
        "water_notification_settings": waterNotificationSettings.toJson(),
    };
}