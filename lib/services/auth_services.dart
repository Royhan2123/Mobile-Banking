import 'dart:convert';

import 'package:http/http.dart' as http;

class AuthServices {
  final String baseUrl = 'https://bwabank.my.id/api';

  Future<bool> checkEmail(String email) async {
    try {
      final respone = await http.post(
        Uri.parse("$baseUrl/is-email-exist"),
        body: {"email": email},
      );
      if (respone.statusCode == 200) {
        return jsonDecode(respone.body)["is_email_exist"];
      } else {
        return jsonDecode(respone.body)["errors"];
      }
    } catch (e) {
      rethrow;
    }
  }
}
