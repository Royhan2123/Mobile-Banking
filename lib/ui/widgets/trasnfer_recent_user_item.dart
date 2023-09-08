import 'package:flutter/material.dart';
import 'package:mobile_ebanking/shared/theme.dart';

class TransferRecentUserItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String username;
  final bool isVerified;
  const TransferRecentUserItem(
      {required this.imageUrl,
      required this.name,
      required this.username,
       this.isVerified = false,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: whiteColor,
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(imageUrl), fit: BoxFit.cover)),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              name,
              style: blackStyle.copyWith(
                fontSize: 15,
                fontWeight: bold,
              ),
            ),
            Text(
              "@${username.toString()}",
              style: greyStyle.copyWith(
                fontSize: 13,
              ),
            )
          ]),
          const Spacer(),
          if(isVerified)
          Row(
            children: [
              Icon(
                Icons.check_circle,
                size: 20,
                color: greenColor,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                "Verified",
                style: greenStyle.copyWith(
                  fontSize: 15,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
