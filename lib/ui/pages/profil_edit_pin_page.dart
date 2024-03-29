import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_ebanking/bloc/auth/auth_bloc.dart';
import 'package:mobile_ebanking/shared/shared_methods.dart';

import '../../shared/theme.dart';

class ProfilEditPinPage extends StatefulWidget {
  const ProfilEditPinPage({super.key});

  @override
  State<ProfilEditPinPage> createState() => _ProfilEditPinPageState();
}

class _ProfilEditPinPageState extends State<ProfilEditPinPage> {
  final TextEditingController txtOldPin = TextEditingController(text: "");
  final TextEditingController txtNewPin = TextEditingController(text: "");

  bool validate() {
    if (txtOldPin.text.isEmpty || txtNewPin.text.isEmpty) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: lightBackgroundColor,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
            size: 25,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        title: Text(
          "Edit PIN",
          style: blackStyle.copyWith(fontSize: 15, fontWeight: semiBold),
        ),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            showCustomSnackbar(context, "Pin yang anda masukkan salah");
          }
          if (state is AuthSucces) {
            Navigator.pushNamedAndRemoveUntil(
                context, "/profilEditSuccesPage", (route) => false);
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            children: [
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), color: whiteColor),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Old PIN",
                      style:
                          blackStyle.copyWith(fontSize: 13, fontWeight: medium),
                    ),
                    TextFormField(
                      controller: txtOldPin,
                      cursorColor: blackColor,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: greyColor),
                            borderRadius: BorderRadius.circular(15)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: greyColor,
                            ),
                            borderRadius: BorderRadius.circular(15)),
                        contentPadding: const EdgeInsets.all(12),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "New PIN",
                      style:
                          blackStyle.copyWith(fontSize: 13, fontWeight: medium),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: txtNewPin,
                      cursorColor: blackColor,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: greyColor),
                            borderRadius: BorderRadius.circular(15)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: greyColor,
                            ),
                            borderRadius: BorderRadius.circular(15)),
                        contentPadding: const EdgeInsets.all(12),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            animationDuration: const Duration(seconds: 2),
                            shape: const StadiumBorder(),
                            minimumSize: const Size(300, 45),
                            foregroundColor: blueColor,
                            backgroundColor: purpleColor),
                        onPressed: () {
                          context.read<AuthBloc>().add(
                                AuthUpdatePin(txtOldPin.text, txtNewPin.text),
                              );
                        },
                        child: Text(
                          "Update Now",
                          style: whiteStyle.copyWith(fontSize: 13),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    ));
  }
}
