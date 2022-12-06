import 'package:natural_slim_flutter_library/models/measure_unit_model.dart';

class MeasureDataModel {
    MeasureDataModel({
        required this.limit,
        required this.measureUnits,
    });

    double limit;
    List<MeasureUnitModel> measureUnits;
    
    factory MeasureDataModel.fromJson(Map<String, dynamic> json) => MeasureDataModel(
        limit: double.parse(json["limit"].toString()),
        measureUnits: List<MeasureUnitModel>.from(json["measureUnits"].map((x) => MeasureUnitModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "limit": limit,
        "measureUnits": List<dynamic>.from(measureUnits.map((x) => x.toJson())),
    };
}