import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mobile_ebanking/shared/theme.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CarouselSlider(
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
                  height: 331,
                  viewportFraction: 1,
                  enableInfiniteScroll: false,
                )),
            const SizedBox(
              height: 80,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 24),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  Text(
                    "Grown Your\nFinancial Today",
                    textAlign: TextAlign.center,
                    style:
                        blackStyle.copyWith(fontSize: 20, fontWeight: semiBold),
                  ),
                  const SizedBox(
                    height: 26,
                  ),
                  Text(
                    "Our system is helping you to\nachieve a better goal",
                    style: greyStyle.copyWith(
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 12,
                        width: 12,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: blueColor),
                        margin: const EdgeInsets.only(right: 10),
                      ),
                      Container(
                        height: 12,
                        width: 12,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: greyColor),
                        margin: const EdgeInsets.only(right: 10),
                      ),
                      Container(
                        height: 12,
                        width: 12,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: greyColor),
                        margin: const EdgeInsets.only(right: 10),
                      ),
                      const Spacer(),
                      SizedBox(
                        width: 150,
                        height: 50,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30))),
                            onPressed: () {},
                            child: Text('Continue',
                                style: whiteStyle.copyWith(
                                    fontSize: 16, fontWeight: semiBold))),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
