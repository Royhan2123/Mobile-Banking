import 'package:flutter/material.dart';
import 'package:mobile_ebanking/shared/theme.dart';

class CustomInputButton extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  const CustomInputButton({required this.title,this.onTap,super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: numberBackgroundColor,
        ),
        child: Center(
            child: Text(
          title,
          style: whiteStyle.copyWith(fontSize: 20, fontWeight: semiBold),
        )),
      ),
    );
  }
}
