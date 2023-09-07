import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class ProfilEditSuccesPage extends StatelessWidget {
  const ProfilEditSuccesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Nice Update!",
              style: blackStyle.copyWith(fontSize: 15, fontWeight: bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              "Your data is safe with\nour system",
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
                      context, '/profilPage', (route) => false);
                },
                child: Text(
                  "My Profil",
                  style: whiteStyle.copyWith(fontSize: 13),
                ))
          ],
        ),
      ),
    ),
    );
  }
}