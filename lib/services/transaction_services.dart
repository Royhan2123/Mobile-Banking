import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobile_ebanking/models/topup_form_model.dart';
import 'package:mobile_ebanking/services/auth_services.dart';

class TransactionServices {
  final String baseUrl = "https://bwabank.my.id/api";

  Future<String> topUp(TopUpFormModel data) async {
    try {
      final token = await AuthServices().getToken();

      final response = await http.post(Uri.parse("$baseUrl/top_ups"), body: {
        data.toJson(),
      }, headers: {
        "Authorization": token,
      });

      if (response.statusCode == 200) {
        return jsonDecode(response.body)["redirect_url"];
      } else {
        throw jsonDecode(response.body)["message"];
      }
    } catch (e) {
      rethrow;
    }
  }
}
