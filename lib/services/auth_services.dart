import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobile_ebanking/models/signup_model.dart';
import 'package:mobile_ebanking/models/users_model.dart';

class AuthServices {
  String baseUrl = "https://bwabank.my.id/api";

  Future<bool> checkEmail(String email) async {
    try {
      final response = await http
          .post(Uri.parse("$baseUrl/is-email-exist"), body: {"email": email});
      if (response.statusCode == 200) {
        return jsonDecode(response.body)["is_email_exist"];
      } else {
        return jsonDecode(response.body)["errors"];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModels> register(SignUpModels data) async {
    try {
      final response =
          await http.post(Uri.parse("$baseUrl/register"), 
          body: data.toJson());
      if (response.statusCode == 200) {
        UserModels user = UserModels.fromJson(
          jsonDecode(response.body),
        );
        user = user.copyWith(password: data.password);
        return user;
      } else {
        throw jsonDecode(response.body)["mesage"];
      }
    } catch (e) {
      rethrow;
    }
  }
}
