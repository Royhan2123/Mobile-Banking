import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobile_ebanking/shared/shared_values.dart';

class AuthServices {
  Future<bool> checkEmail(String email) async {
    try {
      final response = await http.post(
        Uri.parse("$baseUrl/is-email-exist"),
        body: {
          'email': email,
        },
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body)["is-email-exist"];
      } else {
        return jsonDecode(response.body)["error"];
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
