import 'dart:convert';

import 'package:natural_slim_flutter_library/models/settings/size_service_notification/size_setting_model.dart';

class SizeNotificationSettingModel {
    SizeNotificationSettingModel({
      required this.sizeNotificationSettings,
    });

    SizeSettingsModel sizeNotificationSettings;

    static SizeNotificationSettingModel sizeNotificationSettingModelFromJson(String str) => SizeNotificationSettingModel.fromJson(json.decode(str));

    static String sizeNotificationSettingModelToJson(SizeNotificationSettingModel data) => json.encode(data.toJson());

    factory SizeNotificationSettingModel.fromJson(Map<String, dynamic> json) => SizeNotificationSettingModel(
        sizeNotificationSettings: SizeSettingsModel.fromJson(json["size_notification_settings"]),
    );

    Map<String, dynamic> toJson() => {
        "size_notification_settings": sizeNotificationSettings.toJson(),
    };
}

