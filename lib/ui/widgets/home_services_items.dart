import 'package:flutter/material.dart';
import 'package:mobile_ebanking/shared/theme.dart';

class HomeServicesItem extends StatelessWidget {
  final String iconUrl;
  final String title;
  final VoidCallback? ontap;

  const HomeServicesItem(
      {required this.iconUrl, required this.title, this.ontap, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.white),
          child: Center(
              child: Image.asset(
            iconUrl,
            width: 25,
          )),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          title,
          style: blackStyle.copyWith(fontSize: 13, fontWeight: medium),
        )
      ],
    );
  }
}
