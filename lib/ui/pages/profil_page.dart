// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_ebanking/bloc/auth/auth_bloc.dart';
import 'package:mobile_ebanking/shared/shared_methods.dart';
import 'package:mobile_ebanking/shared/theme.dart';
import 'package:mobile_ebanking/ui/pages/profil_menu_item.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({super.key});

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: lightBackgroundColor,
          leading: InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/homePage');
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
        body: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthFailed) {
              showCustomSnackbar(context, state.error);
            } else if (state is AuthInitial) {
              Navigator.pushNamedAndRemoveUntil(
                  context, "signIn", (route) => false);
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is AuthSucces) {
              return ListView(
                padding:
                    const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    color: Colors.white,
                    elevation: 8.0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
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
                                    image: DecorationImage(
                                      image: state.user.profilePicture == null
                                          ? const AssetImage(
                                              "assets/img_profile.png",
                                            )
                                          : NetworkImage(
                                                  state.user.profilePicture!)
                                              as ImageProvider,
                                    ),
                                  ),
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
                                  state.user.name.toString(),
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
                              if (await Navigator.pushNamed(
                                      context, '/pinPage') ==
                                  true) {
                                Navigator.pushNamed(context, '/profilEditPage');
                              }
                            },
                          ),
                          ProfileMenuItem(
                              iconUrl: "assets/ic_pin.png",
                              title: "My Pin",
                              onTap: () async {
                                if (await Navigator.pushNamed(
                                        context, '/pinPage') ==
                                    true) {
                                  Navigator.pushNamed(
                                      context, '/profilEditPinPage');
                                }
                              }),
                          const ProfileMenuItem(
                              iconUrl: "assets/ic_wallet.png",
                              title: "Wallet Settings"),
                          const ProfileMenuItem(
                              iconUrl: "assets/ic_my_rewards.png",
                              title: "My Rewards"),
                          const ProfileMenuItem(
                              iconUrl: "assets/ic_help.png",
                              title: "Help Center"),
                          ProfileMenuItem(
                            iconUrl: "assets/ic_logout.png",
                            title: "Logout",
                            onTap: () {
                              context.read<AuthBloc>().add(AuthLogout());
                            },
                          ),
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
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
