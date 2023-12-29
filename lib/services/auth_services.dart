import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_ebanking/models/signin_model.dart';
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
          await http.post(Uri.parse("$baseUrl/register"), body: data.toJson());
      if (response.statusCode == 200) {
        UserModels user = UserModels.fromJson(
          jsonDecode(response.body),
        );
        user = user.copyWith(password: data.password);
        await storeCredentialToLocal(user);
        return user;
      } else {
        throw jsonDecode(response.body)["mesage"];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModels> login(SignInModels data) async {
    try {
      final response =
          await http.post(Uri.parse("$baseUrl/login"), body: data.toJson());
      if (response.statusCode == 200) {
        UserModels user = UserModels.fromJson(
          jsonDecode(response.body),
        );
        user = user.copyWith(password: data.password);
        await storeCredentialToLocal(user);
        return user;
      } else {
        throw jsonDecode(response.body)["mesage"];
      }
    } catch (e) {
      rethrow;
    }
  }

  // untuk store credential ke dalam local 
  Future<void> storeCredentialToLocal(UserModels user) async {
    try {
      const storage = FlutterSecureStorage();
      await storage.write(key: "token", value: user.token);
      await storage.write(key: "email", value: user.email);
      await storage.write(key: "password", value: user.password);
    } catch (e) {
      rethrow;
    }
  }

  // untuk mengambil credential dari local
  Future<SignInModels> getCredentialFromLocal() async {
    try {
      const storage = FlutterSecureStorage();
      Map<String, String> value = await storage.readAll();
      if (value["email"] == null || value["password"] == null) {
        throw "authenticated";
      } else {
        final SignInModels data = SignInModels(
          email: value["email"],
          password: value["password"],
        );
        return data;
      }
    } catch (e) {
      rethrow;
    }
  }

  // untuk mendapatkan token barier
  Future<String> getToken() async {
    String token = "";

    const storage = FlutterSecureStorage();
    String? value = await storage.read(key: "token");

    if (value != null) {
      token = "barier$value";
    }
    return token;
  }

  // untuk menghapus simpanan login ataupun register
  Future<void> clearLocalStorage() async {
    const storage = FlutterSecureStorage();
    await storage.deleteAll();
  }
}
