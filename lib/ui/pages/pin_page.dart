import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_ebanking/bloc/auth/auth_bloc.dart';
import 'package:mobile_ebanking/shared/shared_methods.dart';
import 'package:mobile_ebanking/shared/theme.dart';
import 'package:mobile_ebanking/ui/widgets/custom_input_button.dart';

class PinPage extends StatefulWidget {
  const PinPage({super.key});

  @override
  State<PinPage> createState() => _PinPageState();
}

class _PinPageState extends State<PinPage> {
  String pin = "";
  bool isError = false;
  @override
  void initState() {
    super.initState();
    
    final authstate = context.read<AuthBloc>().state;

    if (authstate is AuthSucces) {
      pin = authstate.user.pin!;
    } else {
      setState(() { 
        isError = true;
      });
    }
  }

  final TextEditingController pinController = TextEditingController(text: '');

  addPin(String number) {
    if (pinController.text.length < 6) {
      setState(() {
        isError = false;
        pinController.text = pinController.text + number;
      });
    }
    if (pinController.text.length == 6) {
      if (pinController.text == pin) {
        Navigator.pop(context, true);
      } else {
        showCustomSnackbar(
            context, "PIN yang anda masukkan salah. Silahkan coba lagi");
      }
    }
  }

  deletePin() {
    if (pinController.text.isNotEmpty) {
      setState(() {
        isError = false;
        pinController.text =
            pinController.text.substring(0, pinController.text.length - 1);
      });
    }
    // ignore: avoid_print
    print(pinController.text);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: darkBackgroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Sha PIN",
                style: whiteStyle.copyWith(fontSize: 20, fontWeight: bold),
              ),
              const SizedBox(
                height: 75,
              ),
              SizedBox(
                width: 170,
                child: TextFormField(
                  controller: pinController,
                  style: whiteStyle.copyWith(
                      fontSize: 25,
                      fontWeight: medium,
                      letterSpacing: 15,
                      color: isError ? redColor : whiteColor),
                  cursorColor: greyColor,
                  keyboardType: TextInputType.number,
                  obscureText: true,
                  obscuringCharacter: "*",
                  enabled: false,
                  decoration: InputDecoration(
                    disabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: greyColor)),
                  ),
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              Wrap(
                spacing: 40,
                runSpacing: 40,
                children: [
                  CustomInputButton(
                    title: '1',
                    onTap: () {
                      addPin('1');
                    },
                  ),
                  CustomInputButton(
                    title: '2',
                    onTap: () {
                      addPin('2');
                    },
                  ),
                  CustomInputButton(
                    title: '3',
                    onTap: () {
                      addPin('3');
                    },
                  ),
                  CustomInputButton(
                    title: '4',
                    onTap: () {
                      addPin('4');
                    },
                  ),
                  CustomInputButton(
                    title: '5',
                    onTap: () {
                      addPin('5');
                    },
                  ),
                  CustomInputButton(
                    title: '6',
                    onTap: () {
                      addPin('6');
                    },
                  ),
                  CustomInputButton(
                    title: '7',
                    onTap: () {
                      addPin('7');
                    },
                  ),
                  CustomInputButton(
                    title: '8',
                    onTap: () {
                      addPin('8');
                    },
                  ),
                  CustomInputButton(
                    title: '9',
                    onTap: () {
                      addPin('9');
                    },
                  ),
                  const SizedBox(
                    height: 60,
                    width: 60,
                  ),
                  CustomInputButton(
                    title: '0',
                    onTap: () {
                      addPin('0');
                    },
                  ),
                  InkWell(
                    onTap: () {
                      deletePin();
                    },
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: numberBackgroundColor,
                      ),
                      child: Center(
                          child: Icon(Icons.arrow_back,
                              color: whiteColor, size: 20)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
