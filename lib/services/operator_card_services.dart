import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobile_ebanking/models/operator_card_models.dart';
import 'package:mobile_ebanking/services/auth_services.dart';

class OperatorCardServices {
  String baseUrl = "https://bwabank.my.id/api";

  Future<List<OperatorCardModels>> getOperatorCard() async {
    try {
      final token = await AuthServices().getToken();

      final response = await http.get(
        Uri.parse("$baseUrl/operator_cards"),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        return List<OperatorCardModels>.from(
          jsonDecode(response.body)["data"].map(
            (operatorCard) => OperatorCardModels.fromJson(operatorCard),
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
