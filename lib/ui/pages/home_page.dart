import 'package:flutter/material.dart';
import 'package:mobile_ebanking/shared/theme.dart';
import 'package:mobile_ebanking/ui/pages/home_latest_transaction.dart';
import 'package:mobile_ebanking/ui/pages/home_tips_item.dart';
import 'package:mobile_ebanking/ui/pages/home_user_item.dart';
import 'package:mobile_ebanking/ui/widgets/home_services_items.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: lightBackgroundColor,
        bottomNavigationBar: BottomAppBar(
          color: whiteColor,
          shape: const CircularNotchedRectangle(),
          elevation: 8.0,
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: (value) => setState(() {
                    currentIndex = value;
                  }),
              type: BottomNavigationBarType.fixed,
              unselectedItemColor: greyColor,
              selectedItemColor: blueColor,
              selectedLabelStyle:
                  blackStyle.copyWith(fontSize: 12, fontWeight: medium),
              unselectedLabelStyle: greyStyle.copyWith(fontSize: 12),
              showUnselectedLabels: true,
              showSelectedLabels: true,
              backgroundColor: Colors.white,
              items: [
                BottomNavigationBarItem(
                    icon: Image.asset(
                      "assets/ic_overview.png",
                      width: 25,
                      color: currentIndex == 0 ? blueColor : greyColor,
                    ),
                    label: "Overview"),
                BottomNavigationBarItem(
                    icon: Image.asset(
                      "assets/ic_history.png",
                      color: currentIndex == 1 ? blueColor : greyColor,
                      width: 25,
                    ),
                    label: "History"),
                BottomNavigationBarItem(
                    icon: Image.asset(
                      "assets/ic_statistic.png",
                      width: 25,
                      color: currentIndex == 2 ? blueColor : greyColor,
                    ),
                    label: "Statistic"),
                BottomNavigationBarItem(
                    icon: Image.asset(
                      "assets/ic_reward.png",
                      width: 25,
                      color: currentIndex == 3 ? blueColor : greyColor,
                    ),
                    label: "Reward"),
              ]),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: purpleColor,
          child: Image.asset(
            "assets/ic_plus_circle.png",
            width: 25,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          children: [
            profileSection(),
            buildEwalletCard(),
            buildLevel(),
            buildServices(),
            buildLatesTransaction(),
            buildSendAgain(),
            buildFriendlyTips(),
          ],
        ),
      ),
    );
  }

  Widget profileSection() {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Howdy,",
                style: greyStyle.copyWith(fontSize: 15, fontWeight: medium),
              ),
              Text(
                "shaynahan,",
                style: blackStyle.copyWith(fontSize: 20, fontWeight: semiBold),
              ),
            ],
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/profilPage');
            },
            child: Container(
              width: 75,
              height: 75,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  image: const DecorationImage(
                      image: AssetImage("assets/img_profile.png"))),
              child: Align(
                alignment: Alignment.topRight,
                child: Image.asset(
                  "assets/ic_check.png",
                  width: 22,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildEwalletCard() {
    return Container(
      margin: const EdgeInsets.only(top: 50),
      height: 220,
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          image: const DecorationImage(
              image: AssetImage("assets/img_bg_card.png"), fit: BoxFit.cover)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Shayna Hanna",
            style: whiteStyle.copyWith(fontWeight: medium, fontSize: 15),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "**** **** **** 1280",
            style: whiteStyle.copyWith(
                fontSize: 15, fontWeight: medium, letterSpacing: 6),
          ),
          const SizedBox(
            height: 35,
          ),
          Text(
            "Balance",
            style: whiteStyle.copyWith(fontSize: 14),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "RP 12.500",
            style: whiteStyle.copyWith(fontSize: 20),
          ),
        ],
      ),
    );
  }

  Widget buildLevel() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: whiteColor),
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.all(22),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Level 1",
                style: blackStyle.copyWith(fontWeight: medium, fontSize: 14),
              ),
              const Spacer(),
              Text(
                "55 %",
                style: greenStyle.copyWith(fontWeight: bold, fontSize: 14),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                "of Rp 20.000",
                style: blackStyle.copyWith(fontWeight: bold, fontSize: 14),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(55),
            child: LinearProgressIndicator(
              value: 0.55,
              minHeight: 5,
              valueColor: AlwaysStoppedAnimation(greenColor),
              backgroundColor: lightBackgroundColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildServices() {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Do Something",
            style: blackStyle.copyWith(fontSize: 15, fontWeight: bold),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HomeServicesItem(
                  iconUrl: "assets/ic_topup.png",
                  title: "Top Up",
                  ontap: () {
                    Navigator.pushNamed(context, '/topUpPage');
                  }),
              HomeServicesItem(
                  iconUrl: "assets/ic_send.png",
                  title: "Send",
                  ontap: () {
                    Navigator.pushNamed(context, '/transferPage');
                  }),
              HomeServicesItem(
                  iconUrl: "assets/ic_withdraw.png",
                  title: "Withdraw",
                  ontap: () {}),
              HomeServicesItem(
                  iconUrl: "assets/ic_more.png",
                  title: "More",
                  ontap: () {
                    showDialog(
                        context: context,
                        builder: (context) => const MoreDialog());
                  }),
            ],
          )
        ],
      ),
    );
  }

  Widget buildLatesTransaction() {
    return Container(
      margin: const EdgeInsets.only(top: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Latest Transaction",
            style: blackStyle.copyWith(fontSize: 15, fontWeight: semiBold),
          ),
          Container(
            padding: const EdgeInsets.all(22),
            margin: const EdgeInsets.only(top: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: const Column(
              children: [
                HomeLatestTransactionItem(
                    iconUrl: "assets/ic_transaction_cat1.png",
                    time: "Yesterday",
                    title: "Top Up",
                    value: "+ 450.000"),
                SizedBox(
                  height: 25,
                ),
                HomeLatestTransactionItem(
                    iconUrl: "assets/ic_transaction_cat2.png",
                    time: "Sep 11",
                    title: "Cashback",
                    value: "+ 22.000"),
                SizedBox(
                  height: 25,
                ),
                HomeLatestTransactionItem(
                    iconUrl: "assets/ic_transaction_cat3.png",
                    time: "Sep 2",
                    title: "WithDraw",
                    value: "- 5.000"),
                SizedBox(
                  height: 25,
                ),
                HomeLatestTransactionItem(
                    iconUrl: "assets/ic_transaction_cat4.png",
                    time: "Aug 27",
                    title: "Transfer",
                    value: "- 123.500"),
                SizedBox(
                  height: 25,
                ),
                HomeLatestTransactionItem(
                    iconUrl: "assets/ic_transaction_cat5.png",
                    time: "Feb 18",
                    title: "Electric",
                    value: "- 12.300.000"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSendAgain() {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Send Again",
            style: blackStyle.copyWith(fontSize: 15, fontWeight: semiBold),
          ),
          const SizedBox(
            height: 15,
          ),
          const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                HomeUserItem(
                  imageUrl: "assets/img_friend1.png",
                  name: "@yuanita",
                ),
                HomeUserItem(
                  imageUrl: "assets/img_friend2.png",
                  name: "@jani",
                ),
                HomeUserItem(
                  imageUrl: "assets/img_friend3.png",
                  name: "@urip",
                ),
                HomeUserItem(
                  imageUrl: "assets/img_friend4.png",
                  name: "@masa",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildFriendlyTips() {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Friendly Tips",
            style: blackStyle.copyWith(fontSize: 15, fontWeight: semiBold),
          ),
          const SizedBox(
            height: 15,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HomeTipsItem(
                imageUrl: "assets/img_tips1.png",
                title: "Best tips for using\na credit card",
                url: "https://www.google.com",
              ),
              HomeTipsItem(
                imageUrl: "assets/img_tips2.png",
                title: "Spot the good pie\nof finance model",
                url: "https://pub.dev/",
              ),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HomeTipsItem(
                imageUrl: "assets/img_tips3.png",
                title: "Great hack to get\nbetter advices",
                url:
                    "https://www.youtube.com/watch?v=kFjiDhCdpYU&list=RDlo1yThDWsGk&index=18&ab_channel=LeMoesiekRevole",
              ),
              HomeTipsItem(
                  imageUrl: "assets/img_tips4.png",
                  title: "Save more penny\nbuy this instead",
                  url:
                      "https://class.buildwithangga.com/course_playing/mlrM6XgOwL/36"),
            ],
          ),
          const SizedBox(
            height: 15,
          )
        ],
      ),
    );
  }
}

class MoreDialog extends StatelessWidget {
  const MoreDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.zero,
      backgroundColor: Colors.transparent,
      alignment: AlignmentDirectional.bottomCenter,
      content: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        height: 300,
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
          color: lightBackgroundColor,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Do More With Us",
              style: blackStyle.copyWith(fontSize: 15, fontWeight: semiBold),
            ),
            const SizedBox(
              height: 15,
            ),
            Wrap(
              spacing: 27,
              runSpacing: 24,
              children: [
                HomeServicesItem(
                    iconUrl: "assets/ic_product_data.png",
                    title: "Data",
                    ontap: () {
                      Navigator.pushNamed(context, '/dataProviderPage');
                    }),
                HomeServicesItem(
                    iconUrl: "assets/ic_product_water.png",
                    title: "Water",
                    ontap: () {}),
                HomeServicesItem(
                    iconUrl: "assets/ic_product_stream.png",
                    title: "Stream",
                    ontap: () {}),
                HomeServicesItem(
                    iconUrl: "assets/ic_product_movie.png",
                    title: "Movie",
                    ontap: () {}),
                HomeServicesItem(
                    iconUrl: "assets/ic_product_food.png",
                    title: "Food",
                    ontap: () {}),
                HomeServicesItem(
                    iconUrl: "assets/ic_product_travel.png",
                    title: "Travel",
                    ontap: () {}),
              ],
            )
          ],
        ),
      ),
    );
  }
}
