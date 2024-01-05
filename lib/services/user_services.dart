import 'dart:convert';

import 'package:mobile_ebanking/models/users_edit_form_model.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_ebanking/services/auth_services.dart';

class UserServices {
  final String baseUrl = "https://bwabank.my.id/api";
  Future<void> updateUser(UserEditFormModel data) async {
    try {
      final token = await AuthServices().getToken();

      final response = await http
          .put(Uri.parse("$baseUrl/users"), body: data.toJson(), headers: {
        "Authorizoation": token,
      });
      if (response.statusCode != 200) {
        throw jsonDecode(response.body)["message"];
      }
    } catch (e) {
      rethrow;
    }
  }
}
