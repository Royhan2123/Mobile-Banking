import 'package:flutter/material.dart';
import 'package:mobile_ebanking/shared/theme.dart';

class TopUpSucces extends StatefulWidget {
  const TopUpSucces({super.key});

  @override
  State<TopUpSucces> createState() => _TopUpSuccesState();
}

class _TopUpSuccesState extends State<TopUpSucces> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Top Up\nWallet Berhasil",
              style: blackStyle.copyWith(fontSize: 15, fontWeight: bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              "Use the money wisely and\ngrow your finance",
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
                  "Back to Home",
                  style: whiteStyle.copyWith(fontSize: 13),
                ))
          ],
        ),
      ),
    );
  }
}
