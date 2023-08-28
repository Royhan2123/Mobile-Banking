import 'package:flutter/material.dart';
import 'package:mobile_ebanking/shared/theme.dart';

class SignUpSucces extends StatefulWidget {
  const SignUpSucces({super.key});

  @override
  State<SignUpSucces> createState() => _SignUpSuccesState();
}

class _SignUpSuccesState extends State<SignUpSucces> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Akun Berhasil\nTerdaftar",
              style: blackStyle.copyWith(fontSize: 15, fontWeight: bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              "Grow your finance start\nTogether with us",
              style: greyStyle.copyWith(fontSize: 15, fontWeight: bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(200, 40),
                    shape: const StadiumBorder(),
                    foregroundColor: Colors.lightBlue,
                    backgroundColor: purpleColor),
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/homePage', (route) => false);
                },
                child: Text(
                  "Get Started",
                  style: whiteStyle.copyWith(fontSize: 13),
                ))
          ],
        ),
      ),
    );
  }
}
