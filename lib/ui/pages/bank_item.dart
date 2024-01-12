import 'package:flutter/material.dart';
import 'package:mobile_ebanking/models/payment_method_model.dart';
import 'package:mobile_ebanking/shared/theme.dart';

class BankItem extends StatelessWidget {
  final PaymenMethodModel paymenMethodModel;
  final bool isSelected;
  const BankItem(
      {required this.paymenMethodModel,
      this.isSelected = false,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 22),
      decoration: BoxDecoration(
          border:
              Border.all(width: 2, color: isSelected ? blueColor : greyColor),
          borderRadius: BorderRadius.circular(18),
          color: whiteColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network(
            paymenMethodModel.thumbnail!,
            width: 80,
          ),
          Column(
            children: [
              Text(
                paymenMethodModel.name.toString(),
                style: blackStyle.copyWith(fontSize: 13, fontWeight: bold),
              ),
              Text(
                "50 MIN",
                style: greyStyle.copyWith(
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
