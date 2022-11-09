import 'dart:convert';

import 'package:natural_slim_flutter_library/models/measure_unit_model.dart';

class MeasureDataModel {
    MeasureDataModel({
        required this.limit,
        required this.measureUnits,
    });

    double limit;
    List<MeasureUnitModel> measureUnits;

    static MeasureDataModel measureDataModelFromJson(String str) => MeasureDataModel.fromJson(json.decode(str));

    static String measureDataModelToJson(MeasureDataModel data) => json.encode(data.toJson());
    
    factory MeasureDataModel.fromJson(Map<String, dynamic> json) => MeasureDataModel(
        limit: double.parse(json["limit"].toString()),
        measureUnits: List<MeasureUnitModel>.from(json["measureUnits"].map((x) => MeasureUnitModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "limit": limit,
        "measureUnits": List<MeasureUnitModel>.from(measureUnits.map((x) => x.toJson())),
    };
}