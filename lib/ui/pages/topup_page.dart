import 'package:flutter/material.dart';
import 'package:mobile_ebanking/shared/theme.dart';
import 'package:mobile_ebanking/ui/pages/bank_item.dart';

class TopUpPage extends StatelessWidget {
  const TopUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text(
            "Top Up",
            style: blackStyle.copyWith(fontSize: 15, fontWeight: bold),
          ),
          backgroundColor: lightBackgroundColor,
          leading: Icon(Icons.arrow_back_ios_new, size: 20, color: blackColor),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          children: [
            const SizedBox(
              height: 25,
            ),
            Text(
              "Wallet",
              style: blackStyle.copyWith(fontSize: 16, fontWeight: semiBold),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Image.asset(
                  'assets/img_wallet.png',
                  width: 80,
                ),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "8008 2208 1996",
                      style: blackStyle.copyWith(
                          fontSize: 13, fontWeight: bold, letterSpacing: 1),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Royhan",
                      style: greyStyle.copyWith(
                        fontSize: 13,
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "Select Bank",
              style: blackStyle.copyWith(fontWeight: bold, fontSize: 15),
            ),
            const SizedBox(
              height: 20,
            ),
            const BankItem(
              imageUrl: 'assets/img_bank_bca.png',
              name: "BANK BCA",
              min: "50 mins",
              isSelected: true,
            ),
            const BankItem(
              imageUrl: 'assets/img_bank_bni.png',
              name: "BANK BNI",
              min: "50 mins",
            ),
            const BankItem(
              imageUrl: 'assets/img_bank_mandiri.png',
              name: "BANK MANDIRI",
              min: "50 mins",
            ),
            const BankItem(
              imageUrl: 'assets/img_bank_ocbc.png',
              name: "BANK OCBC",
              min: "50 mins",
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.blue,
                    shadowColor: Colors.black,
                    backgroundColor: purpleColor,
                    shape: const StadiumBorder(),
                    minimumSize: const Size(350, 40)),
                onPressed: () {
                  Navigator.pushNamed(context, '/topUpAmountPage');
                },
                child: Text(
                  "Continue",
                  style: whiteStyle.copyWith(fontSize: 13),
                )),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
