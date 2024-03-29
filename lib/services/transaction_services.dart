// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobile_ebanking/models/data_plan_form_model.dart';
import 'package:mobile_ebanking/models/topup_form_model.dart';
import 'package:mobile_ebanking/models/transaction_models.dart';
import 'package:mobile_ebanking/models/transfer_form_model.dart';
import 'package:mobile_ebanking/services/auth_services.dart';

class TransactionServices {
  final String baseUrl = "https://bwabank.my.id/api";

  Future<String> topUp(TopupFormModel data) async {
    try {
      print(data.toJson());
      final token = await AuthServices().getToken();

      final res = await http.post(
        Uri.parse('$baseUrl/top_ups'),
        headers: {
          'Authorization': 'Bearer $token',
        },
        body: data.toJson(),
      );

      print(res.body);

      if (res.statusCode == 200) {
        return jsonDecode(res.body)['redirect_url'];
      }

      throw jsonDecode(res.body)['message'];
    } catch (e) {
      rethrow;
    }
  }

  Future<void> trasnfer(TransferFormModel data) async {
    try {
      print(data.toJson());
      final token = await AuthServices().getToken();

      final res = await http.post(
        Uri.parse('$baseUrl/transfers'),
        headers: {
          'Authorization': 'Bearer $token',
        },
        body: data.toJson(),
      );

      print(res.body);

      if (res.statusCode != 200) {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> dataPlan(DataPlanFormModel data) async {
    try {
      print(data.toJson());
      final token = await AuthServices().getToken();

      final res = await http.post(
        Uri.parse('$baseUrl/data_plans'),
        headers: {
          'Authorization': 'Bearer $token',
        },
        body: data.toJson(),
      );

      print(res.body);

      if (res.statusCode != 200) {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<TransactionModels>> getTransaction() async {
    try {
      final token = await AuthServices().getToken();

      final response = await http.get(
        Uri.parse("$baseUrl/transactions"),
        headers: { 
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        return List<TransactionModels>.from(
          jsonDecode(response.body)["data"].map(
            (transaction) => TransactionModels.fromJson(transaction),
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
