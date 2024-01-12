class PaymenMethodModel {
  final int? id;
  final String? name;
  final String? code;
  final String? thumbnail;

  const PaymenMethodModel({
    this.id,
    this.name,
    this.code,
    this.thumbnail,
  });

  factory PaymenMethodModel.fromJson(Map<String, dynamic> json) => PaymenMethodModel(
    id: json["id"],
    name: json["name"],
    code: json["code"],
    thumbnail: json["thumbnail"],
  );
}
