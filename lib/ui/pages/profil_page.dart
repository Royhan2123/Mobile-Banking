// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:mobile_ebanking/shared/theme.dart';
import 'package:mobile_ebanking/ui/pages/profil_menu_item.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: lightBackgroundColor,
          leading: InkWell(
            onTap: () {
              Navigator.pushNamed(context,'/homePage');
            },
            child: Icon(
              Icons.arrow_back_ios_new,
              size: 20,
              color: blackColor,
            ),
          ),
          centerTitle: true,
          title: Text(
            "My Profile",
            style: blackStyle.copyWith(fontSize: 15, fontWeight: bold),
          ),
        ),
        body: ListView(
          children: [
            cards(context),
          ],
        ),
      ),
    );
  }

  Widget cards(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            elevation: 8.0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Column(
                      children: [
                        Container(
                          width: 75,
                          height: 75,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              image: const DecorationImage(
                                  image: AssetImage("assets/img_profile.png"))),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Image.asset(
                              "assets/ic_check.png",
                              width: 22,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Shayna Hanna",
                          style: blackStyle.copyWith(
                              fontSize: 15, fontWeight: semiBold),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  ProfileMenuItem(
                    iconUrl: "assets/ic_edit_profile.png",
                    title: "Edit Profile",
                    onTap: () async {
                      if (await Navigator.pushNamed(context, '/pinPage') ==
                          true) {
                        Navigator.pushNamed(context, '/profilEditPage');
                      }
                    },
                  ),
                  ProfileMenuItem(
                      iconUrl: "assets/ic_pin.png",
                      title: "My Pin",
                      onTap: () async {
                        if (await Navigator.pushNamed(context, '/pinPage') ==
                            true) {
                          Navigator.pushNamed(context, '/profilEditPinPage');
                        }
                      }),
                  const ProfileMenuItem(
                      iconUrl: "assets/ic_wallet.png",
                      title: "Wallet Settings"),
                  const ProfileMenuItem(
                      iconUrl: "assets/ic_my_rewards.png", title: "My Rewards"),
                  const ProfileMenuItem(
                      iconUrl: "assets/ic_help.png", title: "Help Center"),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Center(
            child: Text(
              "Report Problem",
              style: greyStyle.copyWith(fontSize: 15),
            ),
          )
        ],
      ),
    );
  }
}
