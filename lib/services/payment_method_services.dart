import 'dart:convert';

import "package:http/http.dart" as http;
import 'package:mobile_ebanking/models/payment_method.dart';
import 'package:mobile_ebanking/services/auth_services.dart';

class PaymentMethodServices {
  String baseUrl = "https://bwabank.my.id/api";

  Future<List<PaymenMethodModel>> getPaymentMethods() async {
    try {
      final token = await AuthServices().getToken();

      final response = await http.get(
        Uri.parse("$baseUrl/payment_methods"),
        headers: {
          "Authorization": token,
        },
      );

      if (response.statusCode == 200) {
        return List<PaymenMethodModel>.from(
          jsonDecode(response.body).map(
            (paymentMethod) => PaymenMethodModel.fromJson(paymentMethod),
          ),
        ).toList();
      } else {
        throw jsonDecode(response.body)["message"];
      }
    } catch (e) {
      rethrow;
    }
  }
}
