import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobile_ebanking/services/auth_services.dart';

class WalletSercives {
  final String baseUrl = "https://bwabank.my.id/api";

  Future<void> updatePin(String oldPin, String newPin) async {
    try {
      final token = await AuthServices().getToken();
      final response = await http.put(
        Uri.parse("$baseUrl/wallets"),
        headers: {
          "Authorization": token,
        },
        body: {'previous_pin': oldPin, 'new_pin': newPin},
      );
      if (response.statusCode == 200) {
        throw jsonDecode(response.body)["message"];
      }
    } catch (e) {
      rethrow;
    }
  }
}
