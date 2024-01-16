import 'package:flutter/material.dart';
import 'package:mobile_ebanking/shared/theme.dart';
import 'package:mobile_ebanking/ui/widgets/transfer_result_item.dart';
import 'package:mobile_ebanking/ui/widgets/trasnfer_recent_user_item.dart';

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
          padding: const EdgeInsets.symmetric(horizontal: 20),
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
            ),
            buildRecentUsers(),
            // buildResult(),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
        floatingActionButton: Container(
          margin: const EdgeInsets.all(20),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.blue,
                  shadowColor: Colors.black,
                  backgroundColor: purpleColor,
                  shape: const StadiumBorder(),
                  minimumSize: const Size(350, 40)),
              onPressed: () async {
                Navigator.pushNamed(context, '/transferAmountPage');
              },
              child: Text(
                "Continue",
                style: whiteStyle.copyWith(fontSize: 13),
              )),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }

  Widget buildRecentUsers() {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Recent Users",
            style: blackStyle.copyWith(fontSize: 16, fontWeight: semiBold),
          ),
          const SizedBox(
            height: 14,
          ),
          const TransferRecentUserItem(
            imageUrl: "assets/img_friend1.png",
            name: "Yonna Jie",
            username: "Yoenna",
            isVerified: true,
          ),
          const TransferRecentUserItem(
            imageUrl: "assets/img_friend2.png",
            name: "John Hi",
            username: "jhi",
          ),
          const TransferRecentUserItem(
            imageUrl: "assets/img_friend3.png",
            name: "Masayoshi",
            username: "form",
          ),
        ],
      ),
    );
  }

  Widget buildResult() {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Result",
            style: blackStyle.copyWith(fontSize: 16, fontWeight: semiBold),
          ),
          const SizedBox(
            height: 14,
          ),
          const Wrap(
            spacing: 20,
            runSpacing: 20,
            children: [
              TransferResultUserItem(
                imageUrl: "assets/img_friend1.png",
                name: "Yonna Jie",
                username: "yoenna",
                isVerified: true,
              ),
              TransferResultUserItem(
                imageUrl: "assets/img_friend2.png",
                name: "Yonna Jie",
                username: "yoenna",
                isSelected: true,
              ),
            ],
          )
        ],
      ),
    );
  }
}
