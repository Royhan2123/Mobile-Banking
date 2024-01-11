class TopUpFormModel {
  final String? amount;
  final String? pin;
  final String? paymentMethodCode;

  const TopUpFormModel({
    this.amount,
    this.pin,
    this.paymentMethodCode,
  });

  TopUpFormModel copywith({
    String? amount,
    String? pin,
    String? paymentMethodCode,
  }) =>
      TopUpFormModel(
        amount: amount ?? this.amount,
        pin: pin ?? this.pin,
        paymentMethodCode: paymentMethodCode ?? this.paymentMethodCode,
      );

  Map<String, dynamic> toJson() {
    return {
      "amount": amount,
      "pin": pin,
      "payment_method_code": paymentMethodCode,
    };
  }
}
