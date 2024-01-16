import 'package:flutter/material.dart';
import 'package:mobile_ebanking/models/users_model.dart';
import 'package:mobile_ebanking/shared/theme.dart';

class TransferResultUserItem extends StatelessWidget {
  final UserModels user;
  final bool? isSelected;
  const TransferResultUserItem({
    required this.user,
    super.key,
    this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 150,
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 22,
        ),
        decoration: BoxDecoration(
          border: Border.all(
              width: 2, color: isSelected! ? blueColor : Colors.transparent),
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
                  image: DecorationImage(
                      image: user.profilePicture == null
                          ? const AssetImage("assets/img_profile.png")
                          : NetworkImage(user.profilePicture!)
                              as ImageProvider),
                ),
                child: user.verified == 1
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
                user.name.toString(),
                style: blackStyle.copyWith(fontSize: 15, fontWeight: semiBold),
              ),
              Text(
                "@${user.userName}",
                style: greyStyle.copyWith(fontSize: 13),
              )
            ],
          ),
        ));
  }
}
