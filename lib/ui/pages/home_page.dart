import 'package:flutter/material.dart';
import 'package:mobile_ebanking/shared/theme.dart';
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
          Container(
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
                  ontap: () {}),
              HomeServicesItem(
                  iconUrl: "assets/ic_send.png", title: "Send", ontap: () {}),
              HomeServicesItem(
                  iconUrl: "assets/ic_withdraw.png",
                  title: "Withdraw",
                  ontap: () {}),
              HomeServicesItem(
                  iconUrl: "assets/ic_more.png", title: "More", ontap: () {}),
            ],
          )
        ],
      ),
    );
  }
}
