import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_ebanking/bloc/auth/auth_bloc.dart';
import 'package:mobile_ebanking/shared/theme.dart';
import 'package:mobile_ebanking/ui/pages/data_packages_page.dart';
import 'package:mobile_ebanking/ui/pages/data_provider_page.dart';
import 'package:mobile_ebanking/ui/pages/data_succes.dart';
import 'package:mobile_ebanking/ui/pages/home_page.dart';
import 'package:mobile_ebanking/ui/pages/onboarding.dart';
import 'package:mobile_ebanking/ui/pages/pin_page.dart';
import 'package:mobile_ebanking/ui/pages/profil_edit_pin_page.dart';
import 'package:mobile_ebanking/ui/pages/profil_edit_succes_page.dart';
import 'package:mobile_ebanking/ui/pages/profil_page.dart';
import 'package:mobile_ebanking/ui/pages/profile_edit_page.dart';
import 'package:mobile_ebanking/ui/pages/signin_page.dart';
import 'package:mobile_ebanking/ui/pages/signup_page.dart';
import 'package:mobile_ebanking/ui/pages/signup_succes_page.dart';
import 'package:mobile_ebanking/ui/pages/splash_page.dart';
import 'package:mobile_ebanking/ui/pages/topup_amount.dart';
import 'package:mobile_ebanking/ui/pages/topup_page.dart';
import 'package:mobile_ebanking/ui/pages/topup_succes.dart';
import 'package:mobile_ebanking/ui/pages/transfer_amount_page.dart';
import 'package:mobile_ebanking/ui/pages/transfer_page.dart';
import 'package:mobile_ebanking/ui/pages/transfer_succes_page.dart';

void main() {
  runApp(const NewApp());
}

class NewApp extends StatelessWidget {
  const NewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(scaffoldBackgroundColor: lightBackgroundColor),
        routes: {
          '/': (context) => const SplashPage(),
          '/onBoarding': (context) => const OnBoardingPage(),
          '/signIn': (context) => const SignInPage(),
          '/signUp': (context) => const SignUpPage(),
          '/signUpSucces': (context) => const SignUpSucces(),
          '/homePage': (context) => const HomePage(),
          '/profilPage': (context) => const ProfilPage(),
          '/pinPage': (context) => const PinPage(),
          '/profilEditPage': (context) => const ProfilEditPage(),
          '/profilEditPinPage': (context) => const ProfilEditPinPage(),
          '/profilEditSuccesPage': (context) => const ProfilEditSuccesPage(),
          '/topUpPage': (context) => const TopUpPage(),
          '/topUpAmountPage': (context) => const TopUpAmountPage(),
          '/topUpSucces': (context) => const TopUpSucces(),
          '/transferPage': (context) => const TransferPage(),
          '/transferAmountPage': (context) => const TransferAmountPage(),
          '/transferSuccesPage': (context) => const TransferSuccesPage(),
          '/dataProviderPage': (context) => const DataProviderPage(),
          '/dataPackagesPage': (context) => const DataPackagesPage(),
          '/dataSucces': (context) => const DataSucces(),
        },
      ),
    );
  }
}
