// ignore_for_file: use_build_context_synchronously, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mobile_ebanking/bloc/auth/auth_bloc.dart';
import 'package:mobile_ebanking/bloc/top_up/top_up_bloc.dart';
import 'package:mobile_ebanking/models/topup_form_model.dart';
import 'package:mobile_ebanking/shared/shared_methods.dart';
import 'package:mobile_ebanking/shared/theme.dart';
import 'package:mobile_ebanking/ui/widgets/custom_input_button.dart';
import 'package:url_launcher/url_launcher.dart';

class TopUpAmountPage extends StatefulWidget {
  final TopupFormModel topUpFormModel;
  const TopUpAmountPage({required this.topUpFormModel, super.key});

  @override
  State<TopUpAmountPage> createState() => _TopUpAmountPageState();
}

class _TopUpAmountPageState extends State<TopUpAmountPage> {
  @override
  void initState() {
    super.initState();
    amountController.addListener(() {
      final text = amountController.text;
      try {
        amountController.value = amountController.value.copyWith(
            text: NumberFormat.currency(
                    locale: 'id', decimalDigits: 0, symbol: '')
                .format(int.parse(text.replaceAll('.', ''))));
      } catch (e) {
        //ignore: avoid_print
        print(e.toString());
      }
    });
  }

  final TextEditingController amountController =
      TextEditingController(text: '0');

  addAmount(String number) {
    if (amountController.text == '0') {
      amountController.text = '';
    }
    setState(() {
      amountController.text = amountController.text + number;
    });
  }

  deleteAmount() {
    if (amountController.text.isNotEmpty) {
      setState(() {
        amountController.text = amountController.text
            .substring(0, amountController.text.length - 1);
        if (amountController.text == '') {
          amountController.text = '0';
        }
      });
    }
    // ignore: avoid_print
    print(amountController.text);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: darkBackgroundColor,
      body: BlocProvider(
        create: (context) => TopUpBloc(),
        child: BlocConsumer<TopUpBloc, TopUpState>(
          listener: (context, state) async {
            if (state is TopUpFailed) {
              showCustomSnackbar(context, state.error);
            }

            if (state is TopUpSucces) {
              await launch(state.redirectUrl);

              context.read<AuthBloc>().add(
                    AuthUpdateBalance(
                      int.parse(
                        amountController.text.replaceAll('.', ''),
                      ),
                    ),
                  );
              Navigator.pushNamedAndRemoveUntil(
                  context, "/topUpSucces", (route) => false);
            }
          },
          builder: (context, state) {
            return ListView(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              children: [
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    "Total Amount",
                    style: whiteStyle.copyWith(fontSize: 20, fontWeight: bold),
                  ),
                ),
                const SizedBox(
                  height: 75,
                ),
                SizedBox(
                  width: 250,
                  child: TextFormField(
                    controller: amountController,
                    style:
                        whiteStyle.copyWith(fontSize: 30, fontWeight: medium),
                    cursorColor: greyColor,
                    keyboardType: TextInputType.number,
                    enabled: false,
                    decoration: InputDecoration(
                      prefixIcon: Text(
                        "RP",
                        style:
                            whiteStyle.copyWith(fontSize: 30, fontWeight: bold),
                      ),
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
                        addAmount('1');
                      },
                    ),
                    CustomInputButton(
                      title: '2',
                      onTap: () {
                        addAmount('2');
                      },
                    ),
                    CustomInputButton(
                      title: '3',
                      onTap: () {
                        addAmount('3');
                      },
                    ),
                    CustomInputButton(
                      title: '4',
                      onTap: () {
                        addAmount('4');
                      },
                    ),
                    CustomInputButton(
                      title: '5',
                      onTap: () {
                        addAmount('5');
                      },
                    ),
                    CustomInputButton(
                      title: '6',
                      onTap: () {
                        addAmount('6');
                      },
                    ),
                    CustomInputButton(
                      title: '7',
                      onTap: () {
                        addAmount('7');
                      },
                    ),
                    CustomInputButton(
                      title: '8',
                      onTap: () {
                        addAmount('8');
                      },
                    ),
                    CustomInputButton(
                      title: '9',
                      onTap: () {
                        addAmount('9');
                      },
                    ),
                    const SizedBox(
                      height: 60,
                      width: 60,
                    ),
                    CustomInputButton(
                      title: '0',
                      onTap: () {
                        addAmount('0');
                      },
                    ),
                    InkWell(
                      onTap: () {
                        deleteAmount();
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
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.blue,
                          shadowColor: Colors.black,
                          backgroundColor: purpleColor,
                          shape: const StadiumBorder(),
                          minimumSize: const Size(350, 40)),
                      onPressed: () async {
                        if (await Navigator.pushNamed(context, '/pinPage') ==
                            true) {
                          final authState = context.read<AuthBloc>().state;
                          String pin = "";

                          if (authState is AuthSucces) {
                            pin = authState.user.pin!;
                          }

                          context.read<TopUpBloc>().add(
                                TopUpPost(
                                  widget.topUpFormModel.copyWith(
                                    pin: pin,
                                    amount: amountController.text
                                        .replaceAll(".", ""),
                                  ),
                                ),
                              );
                        }
                      },
                      child: Text(
                        "Continue",
                        style: whiteStyle.copyWith(fontSize: 13),
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                    child: Text(
                  "Term & Condition",
                  style: greyStyle.copyWith(fontSize: 15),
                )),
                const SizedBox(
                  height: 20,
                )
              ],
            );
          },
        ),
      ),
    ));
  }
}
