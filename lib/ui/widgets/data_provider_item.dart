import 'package:flutter/material.dart';
import 'package:mobile_ebanking/shared/theme.dart';

class DataProviderItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final bool isSelecteed;
  const DataProviderItem(
      {required this.imageUrl,
      required this.name,
      this.isSelecteed = false,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 22),
      decoration: BoxDecoration(
          border: isSelecteed ? Border.all(width: 2, color: blueColor) : null,
          borderRadius: BorderRadius.circular(20),
          color: whiteColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            imageUrl,
            height: 30,
            fit: BoxFit.cover,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                name,
                style: blackStyle.copyWith(fontSize: 15, fontWeight: bold),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Available",
                style: greyStyle.copyWith(
                  fontSize: 13,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
