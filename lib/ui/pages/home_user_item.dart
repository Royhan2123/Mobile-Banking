import 'package:flutter/material.dart';
import 'package:mobile_ebanking/shared/theme.dart';

class HomeUserItem extends StatelessWidget {
  final String name;
  final String imageUrl;
  const HomeUserItem({required this.name, required this.imageUrl, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 150,
      margin: const EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.white),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            width: 75,
            height: 75,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: AssetImage(imageUrl))),
          ),
          Text(
            name,
            style: blackStyle.copyWith(fontWeight: bold, fontSize: 15),
          ),
        ],
      )),
    );
  }
}
