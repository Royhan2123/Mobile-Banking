import 'package:flutter/material.dart';
import 'package:mobile_ebanking/shared/shared_methods.dart';
import 'package:mobile_ebanking/shared/theme.dart';
import 'package:mobile_ebanking/ui/widgets/data_provider_item.dart';

class DataProviderPage extends StatelessWidget {
  const DataProviderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: lightBackgroundColor,
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios_new_outlined,
                size: 20,
                color: blackColor,
              )),
          centerTitle: true,
          title: Text(
            "Beli Data",
            style: blackStyle.copyWith(fontSize: 15, fontWeight: bold),
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          children: [
            const SizedBox(
              height: 30,
            ),
            Text(
              "From Wallet",
              style: blackStyle.copyWith(fontSize: 15, fontWeight: semiBold),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Image.asset(
                  "assets/img_wallet.png",
                  width: 80,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "8008 2208 1996",
                      style: blackStyle.copyWith(
                          fontSize: 16, fontWeight: medium, letterSpacing: 1),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Balance: ${formatCurrency(180000000)}",
                      style: greyStyle.copyWith(fontSize: 12),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              "Select Provider",
              style: blackStyle.copyWith(fontSize: 15, fontWeight: semiBold),
            ),
            const SizedBox(
              height: 15,
            ),
            const DataProviderItem(
              imageUrl: "assets/img_provider_telkomsel.png",
              name: "Telkomsel",
              isSelecteed: true,
            ),
            const DataProviderItem(
              imageUrl: "assets/img_provider_indosat.png",
              name: "Indosat Ooredo",
            ),
            const DataProviderItem(
              imageUrl: "assets/img_provider_singtel.png",
              name: "Singtel ID",
            ),
            const SizedBox(
              height: 85,
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
                    Navigator.pushNamed(context, '/dataPackagesPage');
                  },
                  child: Text(
                    "Continue",
                    style: whiteStyle.copyWith(fontSize: 13),
                  )),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
