import 'package:flutter/material.dart';
import 'package:mobile_ebanking/shared/theme.dart';

class TransferResultUserItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String username;
  final bool isVerified;
  final bool isSelected;
  const TransferResultUserItem(
      {required this.imageUrl,
      required this.name,
      required this.username,
      this.isVerified = false,
      this.isSelected = false,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 160,
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 22,
        ),
        decoration: BoxDecoration(
          border: Border.all(
              width: 2, color: isSelected ? blueColor : Colors.transparent),
          borderRadius: BorderRadius.circular(20),
          color: whiteColor,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(imageUrl))),
                child: isVerified
                    ? Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          width: 20,
                          height: 20,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/ic_check.png'))),
                        ))
                    : null,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                name,
                style: blackStyle.copyWith(fontSize: 15, fontWeight: semiBold),
              ),
              Text(
                "@$username",
                style: greyStyle.copyWith(fontSize: 13),
              )
            ],
          ),
        ));
  }
}
