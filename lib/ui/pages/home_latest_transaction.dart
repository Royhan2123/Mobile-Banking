import 'package:flutter/material.dart';
import 'package:mobile_ebanking/shared/theme.dart';

class HomeLatestTransactionItem extends StatelessWidget {
  final String title;
  final String iconUrl;
  final String time;
  final String value;
  const HomeLatestTransactionItem(
      {required this.iconUrl,
      required this.time,
      required this.title,
      required this.value,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 55,
          height: 55,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(image: AssetImage(iconUrl))),
        ),
        const SizedBox(
          width: 15,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: blackStyle.copyWith(fontSize: 15, fontWeight: semiBold),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              time,
              style: greyStyle.copyWith(
                fontSize: 13,
              ),
            ),
          ],
        ),
        const Spacer(),
        Text(
          value,
          style: blackStyle.copyWith(fontSize: 15, fontWeight: semiBold),
        )
      ],
    );
  }
}
