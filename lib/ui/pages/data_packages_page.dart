// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:mobile_ebanking/models/operator_card_models.dart';
import 'package:mobile_ebanking/shared/theme.dart';
import 'package:mobile_ebanking/ui/widgets/package_item.dart';

class DataPackagesPage extends StatefulWidget {
  final OperatorCardModels data;
  const DataPackagesPage({required this.data, super.key});
  @override
  State<DataPackagesPage> createState() => _DataPackagesPageState();
}

class _DataPackagesPageState extends State<DataPackagesPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: lightBackgroundColor,
          elevation: 0,
          centerTitle: true,
          leading: InkWell(
            onTap: () {},
            child: Icon(
              Icons.arrow_back_ios_new_outlined,
              size: 20,
              color: blackColor,
            ),
          ),
          title: Text(
            "Paket Data",
            style: blackStyle.copyWith(
              fontSize: 15,
              fontWeight: semiBold,
            ),
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          children: [
            const SizedBox(
              height: 30,
            ),
            Text("Paket Data",
                style: blackStyle.copyWith(
                  fontSize: 15,
                  fontWeight: semiBold,
                )),
            const SizedBox(
              height: 15,
            ),
            TextField(
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                  hintText: "+628",
                  hintStyle: greyStyle.copyWith(fontSize: 14),
                  contentPadding: const EdgeInsets.all(12),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            const SizedBox(
              height: 40,
            ),
            Text("Select Package",
                style: blackStyle.copyWith(
                  fontSize: 15,
                  fontWeight: semiBold,
                )),
            const SizedBox(
              height: 10,
            ),
            const Wrap(spacing: 20, runSpacing: 20, children: [
              PackageItem(price: 100000, title: "10"),
              PackageItem(
                price: 420000,
                title: "25",
                iSelected: true,
              ),
              PackageItem(
                price: 2500000,
                title: "40",
              ),
              PackageItem(price: 500000, title: "99"),
            ]),
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
                  onPressed: () async {
                    if (await Navigator.pushNamed(context, '/pinPage') ==
                        true) {
                      await Navigator.pushNamed(context, '/dataSucces');
                    }
                  },
                  child: Text(
                    "Continue",
                    style: whiteStyle.copyWith(fontSize: 13),
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
