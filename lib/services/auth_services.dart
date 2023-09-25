import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobile_ebanking/models/signin_form_model.dart';
import 'package:mobile_ebanking/models/signup_form_model.dart';
import 'package:mobile_ebanking/models/user_models.dart';
import 'package:mobile_ebanking/shared/shared_values.dart';

class AuthServices {
  Future<bool> checkEmail(String email) async {
    try {
      final res = await http.post(
        Uri.parse("$baseUrl/is-email-exist"),
        body: {'email': email},
      );
      if (res.statusCode == 200) {
        return jsonDecode(res.body)['is_email_exist'];
      } else {
        return jsonDecode(res.body)['error'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModels> register(SignUpFormModel data) async {
    try {
      final res =
          await http.post(Uri.parse("$baseUrl/register"), body: data.toJson());

      if (res.statusCode == 200) {
        UserModels user = UserModels.fromJson(jsonDecode(res.body));
        user = user.copwith(password: data.password);

        return user;
      } else {
        return jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
  
  Future<UserModels> login(SignInFormModel data) async {
    try {
      final res =
          await http.post(Uri.parse("$baseUrl/login"), body: data.toJson());

      if (res.statusCode == 200) {
        UserModels user = UserModels.fromJson(jsonDecode(res.body));
        user = user.copwith(password: data.password);

        return user;
      } else {
        return jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
}
