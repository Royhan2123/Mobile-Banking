import 'package:flutter/material.dart';
import 'package:mobile_ebanking/shared/theme.dart';

class ProfileMenuItem extends StatelessWidget {
  final String iconUrl;
  final String title;
  final VoidCallback? onTap;
  const ProfileMenuItem(
      {required this.iconUrl, required this.title, this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 30),
        child: Row(
          children: [
            Image.asset(
              iconUrl,
              width: 24,
            ),
            const SizedBox(
              width: 18,
            ),
            Text(
              title,
              style: blackStyle.copyWith(fontWeight: medium),
            )
          ],
        ),
      ),
    );
  }
}
