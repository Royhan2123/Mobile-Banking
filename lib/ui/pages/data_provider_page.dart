import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_ebanking/bloc/auth/auth_bloc.dart';
import 'package:mobile_ebanking/bloc/operator_card/operator_card_bloc.dart';
import 'package:mobile_ebanking/models/operator_card_models.dart';
import 'package:mobile_ebanking/shared/shared_methods.dart';
import 'package:mobile_ebanking/shared/theme.dart';
import 'package:mobile_ebanking/ui/pages/data_packages_page.dart';
import 'package:mobile_ebanking/ui/widgets/data_provider_item.dart';

class DataProviderPage extends StatefulWidget {
  const DataProviderPage({super.key});

  @override
  State<DataProviderPage> createState() => _DataProviderPageState();
}

class _DataProviderPageState extends State<DataProviderPage> {
  OperatorCardModels? selectedOperatorCard;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: lightBackgroundColor,
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios_new_outlined,
                size: 20,
                color: blackColor,
              )),
          centerTitle: true,
          title: Text(
            "Beli Data",
            style: blackStyle.copyWith(fontSize: 15, fontWeight: bold),
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          children: [
            const SizedBox(
              height: 30,
            ),
            Text(
              "From Wallet",
              style: blackStyle.copyWith(fontSize: 15, fontWeight: semiBold),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Image.asset(
                  "assets/img_wallet.png",
                  width: 80,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 10),
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    if (state is AuthSucces) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            state.user.cardNumber!.replaceAllMapped(
                                RegExp(r".{4}"),
                                (match) => "${match.group(0)} "),
                            style: blackStyle.copyWith(
                                fontSize: 16,
                                fontWeight: medium,
                                letterSpacing: 1),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Balance: ${formatCurrency(state.user.balance!)}",
                            style: greyStyle.copyWith(fontSize: 12),
                          )
                        ],
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                )
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              "Select Provider",
              style: blackStyle.copyWith(fontSize: 15, fontWeight: semiBold),
            ),
            const SizedBox(
              height: 15,
            ),
            BlocProvider(
              create: (context) => OperatorCardBloc()..add(OperatorCardGet()),
              child: BlocBuilder<OperatorCardBloc, OperatorCardState>(
                builder: (context, state) {
                  if (state is OperatorCardSucces) {
                    return Column(
                      children: state.operatorCards.map((data) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              selectedOperatorCard = data;
                            });
                          },
                          child: DataProviderItem(
                            data: data,
                            isSelecteed: data.id == selectedOperatorCard?.id,
                          ),
                        );
                      }).toList(),
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 85,
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
        floatingActionButton: (selectedOperatorCard != null)
            ? Container(
                margin: const EdgeInsets.all(25),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.blue,
                        shadowColor: Colors.black,
                        backgroundColor: purpleColor,
                        shape: const StadiumBorder(),
                        minimumSize: const Size(350, 40)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>  DataPackagesPage(
                              data: selectedOperatorCard!,
                            ),
                          ));
                    },
                    child: Text(
                      "Continue",
                      style: whiteStyle.copyWith(fontSize: 13),
                    )),
              )
            : Container(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
