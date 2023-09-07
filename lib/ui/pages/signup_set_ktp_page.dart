import 'package:flutter/material.dart';
import 'package:mobile_ebanking/shared/theme.dart';

class SignUpSetKtp extends StatefulWidget {
  const SignUpSetKtp({super.key});

  @override
  State<SignUpSetKtp> createState() => _SignUpSetKtpState();
}

class _SignUpSetKtpState extends State<SignUpSetKtp> {
  final TextEditingController txtPin = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
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
              "Verify Your\nAccount",
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
                            "Passport/ID Card",
                            style: blackStyle.copyWith(
                                fontWeight: bold, fontSize: 15),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 80,
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
                            Navigator.pushNamed(context, '/signUpSucces');
                          },
                          child: Text(
                            "Continue",
                            style: whiteStyle.copyWith(fontSize: 13),
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Center(
                child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/signUpSucces');
              },
              child: Text(
                "Skip for now",
                style: greyStyle.copyWith(fontSize: 14, fontWeight: medium),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
