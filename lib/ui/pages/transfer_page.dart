import 'package:flutter/material.dart';
import 'package:mobile_ebanking/shared/theme.dart';

class TransferPage extends StatelessWidget {
  const TransferPage({super.key});

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
            child: Icon(
              Icons.arrow_back_ios_new,
              size: 20,
              color: blackColor,
            ),
          ),
          title: Text(
            "Transfer",
            style: blackStyle.copyWith(fontSize: 13, fontWeight: bold),
          ),
          centerTitle: true,
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          children: [
            const SizedBox(
              height: 30,
            ),
            Text(
              "Search",
              style: blackStyle.copyWith(fontSize: 16, fontWeight: semiBold),
            ),
            const SizedBox(
              height: 15,
            ),

            TextField(
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                  hintText: "by username",
                  hintStyle: greyStyle.copyWith(fontSize: 14),
                  contentPadding: const EdgeInsets.all(12),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            )
          ],
        ),
      ),
    );
  }
}
