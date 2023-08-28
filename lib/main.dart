import 'package:flutter/material.dart';
import 'package:mobile_ebanking/ui/pages/home_page.dart';
import 'package:mobile_ebanking/ui/pages/onboarding.dart';
import 'package:mobile_ebanking/ui/pages/signup_profile_page.dart';
import 'package:mobile_ebanking/ui/pages/signin_page.dart';
import 'package:mobile_ebanking/ui/pages/signup_page.dart';
import 'package:mobile_ebanking/ui/pages/signup_set_ktp_page.dart';
import 'package:mobile_ebanking/ui/pages/signup_set_profil_page.dart';
import 'package:mobile_ebanking/ui/pages/signup_succes_page.dart';
import 'package:mobile_ebanking/ui/pages/splash_page.dart';

void main() {
  runApp(const NewApp());
}

class NewApp extends StatelessWidget {
  const NewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "",
      routes: {
        '/': (context) => const SplashPage(),
        '/onBoarding': (context) => const OnBoardingPage(),
        '/signIn': (context) => const SignInPage(),
        '/signUp': (context) => const SignUpPage(),
        '/signUpProfil': (context) => const SignUpProfilePage(),
        '/signUpSetProfil': (context) => const SignUpSetProfilePage(),
        '/signUpSetKtp': (context) => const SignUpSetKtp(),
        '/signUpSucces': (context) => const SignUpSucces(),
        '/homePage': (context) => const HomePage(),
      },
    );
  }
}
