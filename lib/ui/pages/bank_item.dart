import 'package:flutter/material.dart';
import 'package:mobile_ebanking/shared/theme.dart';

class BankItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final bool isSelected;
  final String min;
  const BankItem(
      {required this.imageUrl,
      required this.name,
      required this.min,
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
          Image.asset(
            imageUrl,
            width: 80,
          ),
          Column(
            children: [
              Text(
                name,
                style: blackStyle.copyWith(fontSize: 13, fontWeight: bold),
              ),
              Text(
                min,
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
