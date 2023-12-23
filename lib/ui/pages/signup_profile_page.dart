// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_ebanking/models/signup_model.dart';
import 'package:mobile_ebanking/shared/theme.dart';

class SignUpProfilePage extends StatelessWidget {
  final SignUpModels data;
  SignUpProfilePage({required this.data, super.key});

  final TextEditingController txtPin = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    
    print(data.toJson());
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          children: [
            Container(
              width: 155,
              height: 50,
              margin: const EdgeInsets.only(top: 60, bottom: 80),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/img_logo_light.png"))),
            ),
            Text(
              "Join Us to Unlock\nYour Growth",
              style: blackStyle.copyWith(fontWeight: bold, fontSize: 18),
            ),
            Container(
              margin: const EdgeInsets.only(top: 40),
              decoration: BoxDecoration(boxShadow: const [
                BoxShadow(color: Colors.grey, blurRadius: 12)
              ], borderRadius: BorderRadius.circular(15), color: Colors.white),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Column(
                        children: [
                          Container(
                              width: 100,
                              height: 100,
                              margin: const EdgeInsets.only(),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  50,
                                ),
                                color: lightBackgroundColor,
                              ),
                              child: Center(
                                child: Image.asset(
                                  "assets/ic_upload.png",
                                  width: 40,
                                ),
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Shayna Hanna",
                            style: blackStyle.copyWith(
                                fontWeight: bold, fontSize: 15),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Text(
                      "Set PIN(6 digit number)",
                      style:
                          blackStyle.copyWith(fontSize: 12, fontWeight: medium),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      obscureText: true,
                      inputFormatters: [LengthLimitingTextInputFormatter(6)],
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                          contentPadding: const EdgeInsets.all(10)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.blue,
                              shadowColor: Colors.black,
                              backgroundColor: purpleColor,
                              shape: const StadiumBorder(),
                              minimumSize: const Size(350, 40)),
                          onPressed: () {
                            Navigator.pushNamed(context, '/signUpSetProfil');
                          },
                          child: Text(
                            "Continue",
                            style: whiteStyle.copyWith(fontSize: 13),
                          )),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
