import 'package:flutter/material.dart';
import 'package:mobile_ebanking/shared/shared_methods.dart';
import 'package:mobile_ebanking/shared/theme.dart';

class PackageItem extends StatelessWidget {
  final String title;
  final int price;
  final bool iSelected;
  const PackageItem(
      {required this.price,
      required this.title,
      this.iSelected = false,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 146,
      height: 160,
      decoration: BoxDecoration(
          border: iSelected ? Border.all(width: 2, color: blueColor) : null,
          borderRadius: BorderRadius.circular(20),
          color: whiteColor),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "${title}GB",
            style: blackStyle.copyWith(fontSize: 20, fontWeight: semiBold),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            formatCurrency(price),
            style: greyStyle.copyWith(fontSize: 13),
          ),
        ],
      ),
    );
  }
}
