import 'package:flutter/material.dart';
import 'package:mobile_ebanking/models/data_plan_model.dart';
import 'package:mobile_ebanking/shared/shared_methods.dart';
import 'package:mobile_ebanking/shared/theme.dart';

class PackageItem extends StatelessWidget {
  final DataPlanModel data;
  final bool iSelected;
  const PackageItem(
      {required this.data,
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
           data.name.toString(),
            style: blackStyle.copyWith(fontSize: 20, fontWeight: semiBold),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            formatCurrency(data.price ?? 0),
            style: greyStyle.copyWith(fontSize: 13),
          ),
        ],
      ),
    );
  }
}
