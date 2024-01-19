class DataPlanModel {
  final int? id;
  final String? name;
  final int? price;
  final int? operatorCartId;

  DataPlanModel({
    this.id,
    this.name,
    this.price,
    this.operatorCartId,
  });

  factory DataPlanModel.fromJson(Map<String, dynamic> json) => DataPlanModel(
        id: json['id'],
        name: json['name'],
        price: json['price'],
        operatorCartId: json['operator_card_id'],
      );
}
