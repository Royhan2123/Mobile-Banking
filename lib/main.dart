import 'package:flutter/material.dart';
import 'package:mobile_ebanking/shared/theme.dart';
import 'package:mobile_ebanking/ui/pages/home_page.dart';
import 'package:mobile_ebanking/ui/pages/onboarding.dart';
import 'package:mobile_ebanking/ui/pages/pin_page.dart';
import 'package:mobile_ebanking/ui/pages/profil_edit_pin_page.dart';
import 'package:mobile_ebanking/ui/pages/profil_edit_succes_page.dart';
import 'package:mobile_ebanking/ui/pages/profil_page.dart';
import 'package:mobile_ebanking/ui/pages/profile_edit_page.dart';
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
      theme: ThemeData(
        scaffoldBackgroundColor: lightBackgroundColor
      ),
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
        '/profilPage': (context) => const ProfilPage(),
        '/pinPage': (context) => const PinPage(),
        '/profilEditPage': (context) => const ProfilEditPage(),
        '/profilEditPinPage': (context) => const ProfilEditPinPage(),
        '/profilEditSuccesPage': (context) => const ProfilEditSuccesPage(),
      },
    );
  }
}
