import 'package:mobile_ebanking/models/data_plan.dart';

class OperatorCardModels {
  final int? id;
  final String? name;
  final String? status;
  final String? thumbnail;
  final List<DataPlanModel>? dataPlans;

  const OperatorCardModels({
    this.id,
    this.name,
    this.status,
    this.thumbnail,
    this.dataPlans,
  });

  factory OperatorCardModels.fromJson(Map<String, dynamic> json) =>
      OperatorCardModels(
        id: json["id"],
        name: json["name"],
        status: json["status"],
        thumbnail: json["thumbnail"],
        dataPlans: json["data_plans"] == null
            ? null
            : (json["data_plans"] as List)
                .map(
                  (dataPlans) => DataPlanModel.fromJson(dataPlans),
                )
                .toList(),
      );
}
