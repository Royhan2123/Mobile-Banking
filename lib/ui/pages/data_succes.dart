import 'package:flutter/material.dart';
import 'package:mobile_ebanking/shared/theme.dart';

class DataSucces extends StatefulWidget {
  const DataSucces({super.key});

  @override
  State<DataSucces> createState() => _DataSuccesState();
}

class _DataSuccesState extends State<DataSucces> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Paket Data\nBerhasil Terbeli",
              style: blackStyle.copyWith(fontSize: 17, fontWeight: semiBold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "Use the money wisely and\ngrow your finance",
              style: greyStyle.copyWith(fontSize: 15, fontWeight: bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
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
