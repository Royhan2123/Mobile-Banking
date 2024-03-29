import 'dart:convert';

import 'package:mobile_ebanking/models/users_edit_form_model.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_ebanking/models/users_model.dart';
import 'package:mobile_ebanking/services/auth_services.dart';

class UserServices {
  final String baseUrl = "https://bwabank.my.id/api";
  Future<void> updateUser(UserEditFormModel data) async {
    try {
      final token = await AuthServices().getToken();
      final response = await http.put(
        Uri.parse("$baseUrl/users"),
        headers: {
          'Authorization': 'Bearer $token',
        },
        body: data.toJson(),
      );
      if (response.statusCode != 200) {
        throw jsonDecode(response.body)["message"];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<UserModels>> getRecentUsers() async {
    try {
      final token = await AuthServices().getToken();

      final response = await http.get(
        Uri.parse(
          "$baseUrl/transfer_histories",
        ),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        return List<UserModels>.from(
          jsonDecode(response.body)["data"].map(
            (user) => UserModels.fromJson(user),
          ),
        );
      }

      throw jsonDecode(response.body)["message"];
    } catch (e) {
      rethrow;
    }
  }

  Future<List<UserModels>> getUsersByUsername(String username) async {
    try {
      final token = await AuthServices().getToken();

      final response = await http.get(
        Uri.parse(
          "$baseUrl/users/$username",
        ),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        return List<UserModels>.from(
          jsonDecode(response.body).map(
            (user) => UserModels.fromJson(user),
          ),
        );
      }

      throw jsonDecode(response.body)["message"];
    } catch (e) {
      rethrow;
    }
  }
}
