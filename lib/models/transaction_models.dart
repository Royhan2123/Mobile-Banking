import 'package:mobile_ebanking/models/payment_method_model.dart';
import 'package:mobile_ebanking/models/transaction_type_models.dart';

class TransactionModels {
  final int? id;
  final int? amount;
  final DateTime? createAt;
  final PaymenMethodModel? paymenMethodModel;
  final TransactionTypeModel? transactionTypeModel;

  const TransactionModels({
    this.id,
    this.amount,
    this.createAt,
    this.paymenMethodModel,
    this.transactionTypeModel,
  });

  factory TransactionModels.fromJson(Map<String, dynamic> json) =>
      TransactionModels(
        id: json["id"],
        amount: json["amount"],
        createAt: DateTime.tryParse(
          json["create_at"],
        ),
        paymenMethodModel: json["payment_metod"] == null
            ? null
            : PaymenMethodModel.fromJson(
                json["payment_method"],
              ),
        transactionTypeModel: json["transaction_type"] == null
            ? null
            : TransactionTypeModel.fromJson(
                json["transaction_type"],
              ),
      );
}
