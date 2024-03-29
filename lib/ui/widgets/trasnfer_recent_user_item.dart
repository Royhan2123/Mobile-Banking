import 'package:flutter/material.dart';
import 'package:mobile_ebanking/models/users_model.dart';
import 'package:mobile_ebanking/shared/theme.dart';

class TransferRecentUserItem extends StatelessWidget {
  final UserModels user;
  const TransferRecentUserItem({required this.user, super.key});

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
                    image: user.profilePicture == null
                        ? const AssetImage("assets/img_profile.png")
                        : NetworkImage(user.profilePicture!) as ImageProvider,
                    fit: BoxFit.cover)),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              user.name.toString(),
              style: blackStyle.copyWith(
                fontSize: 15,
                fontWeight: bold,
              ),
            ),
            Text(
              "@${user.userName.toString()}",
              style: greyStyle.copyWith(
                fontSize: 13,
              ),
            )
          ]),
          const Spacer(),
          if (user.verified == 1)
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
