import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mobile_ebanking/shared/theme.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  int currentIndex = 0;
  CarouselController carouselController = CarouselController();

  List<String> title = [
    "Grown Your\nFinancial Today",
    "Build From\nZero to freedom",
    "Start Together",
  ];

  List<String> subtitle = [
    "Our system is helping you to\nachieve a better goal",
    "We provide tips for you so that \nyou can adapt easier",
    "We will guide to you where\nyou wanted it too",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CarouselSlider(
                carouselController: carouselController,
                items: [
                  Image.asset(
                    "assets/img_onboarding1.png",
                    height: 331,
                  ),
                  Image.asset(
                    "assets/img_onboarding2.png",
                    height: 331,
                  ),
                  Image.asset(
                    "assets/img_onboarding3.png",
                    height: 331,
                  ),
                ],
                options: CarouselOptions(
                  height: 300,
                  viewportFraction: 1,
                  enableInfiniteScroll:
                      false, // <= untuk menghentikan perulangan nya
                  onPageChanged: (index, reason) {
                    setState(() {
                      // <= untuk membuat carouslider dimulai dengan index = 0
                      currentIndex = index; // <= variabel currentindex = 0
                    });
                  },
                )),
            const SizedBox(
              height: 80,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 24),
              decoration: BoxDecoration(boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 20,
                ),
              ], color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  Text(
                    title[currentIndex],
                    textAlign: TextAlign.center,
                    style:
                        blackStyle.copyWith(fontSize: 20, fontWeight: semiBold),
                  ),
                  const SizedBox(
                    height: 26,
                  ),
                  Text(
                    subtitle[currentIndex],
                    style: greyStyle.copyWith(
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: currentIndex == 2 ? 38 : 50,
                  ),
                  currentIndex == 2
                      ? Column(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              height: 40,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: purpleColor,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30))),
                                  onPressed: () {
                                    Navigator.pushNamed(
                                      context,
                                      '/signIn',
                                    );
                                  },
                                  child: Text('Get Started',
                                      style: whiteStyle.copyWith(
                                          fontSize: 16, fontWeight: semiBold))),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                    context,
                                    '/signIn',
                                  );
                                },
                                child: Text(
                                  "Sign In",
                                  style: greyStyle.copyWith(
                                    fontSize: 16,
                                  ),
                                ))
                          ],
                        )
                      : Row(
                          children: [
                            Container(
                              height: 12,
                              width: 12,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: currentIndex == 0
                                      ? blueColor
                                      : greyColor),
                              margin: const EdgeInsets.only(right: 10),
                            ),
                            Container(
                              height: 12,
                              width: 12,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: currentIndex == 1
                                      ? blueColor
                                      : greyColor),
                              margin: const EdgeInsets.only(right: 10),
                            ),
                            Container(
                              height: 12,
                              width: 12,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: currentIndex == 2
                                      ? blueColor
                                      : greyColor),
                              margin: const EdgeInsets.only(right: 10),
                            ),
                            const Spacer(),
                            SizedBox(
                              width: 130,
                              height: 40,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: purpleColor,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30))),
                                  onPressed: () {
                                    carouselController.nextPage();
                                  },
                                  child: Text('Continue',
                                      style: whiteStyle.copyWith(
                                          fontSize: 16, fontWeight: semiBold))),
                            ),
                          ],
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
