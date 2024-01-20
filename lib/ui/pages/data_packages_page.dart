// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_ebanking/bloc/auth/auth_bloc.dart';
import 'package:mobile_ebanking/bloc/data_plan/data_plan_bloc.dart';
import 'package:mobile_ebanking/models/data_plan_form_model.dart';
import 'package:mobile_ebanking/models/data_plan_model.dart';
import 'package:mobile_ebanking/models/operator_card_model.dart';
import 'package:mobile_ebanking/shared/shared_methods.dart';
import 'package:mobile_ebanking/shared/theme.dart';
import 'package:mobile_ebanking/ui/widgets/package_item.dart';

class DataPackagesPage extends StatefulWidget {
  final OperatorCardModel data;
  const DataPackagesPage({required this.data, super.key});
  @override
  State<DataPackagesPage> createState() => _DataPackagesPageState();
}

class _DataPackagesPageState extends State<DataPackagesPage> {
  final phoneController = TextEditingController(text: "");
  DataPlanModel? selectDataPlan;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => DataPlanBloc(),
        child: BlocConsumer<DataPlanBloc, DataPlanState>(
          listener: (context, state) {
            if (state is DataPlanSucces) {
              context.read<AuthBloc>().add(
                    AuthUpdateBalance(
                      selectDataPlan!.price! * -1,
                    ),
                  );
              Navigator.pushNamedAndRemoveUntil(
                  context, "/transferSuccesPage", (route) => false);
            } else if (state is DataPlanFailed) {
              showCustomSnackbar(context, state.error);
            }
          },
          builder: (context, state) {
            if (state is DataPlanLoading) {
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            return Scaffold(
              appBar: AppBar(
                backgroundColor: lightBackgroundColor,
                elevation: 0,
                centerTitle: true,
                leading: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios_new_outlined,
                    size: 20,
                    color: blackColor,
                  ),
                ),
                title: Text(
                  "Paket Data",
                  style: blackStyle.copyWith(
                    fontSize: 15,
                    fontWeight: semiBold,
                  ),
                ),
              ),
              body: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Text("Paket Data",
                      style: blackStyle.copyWith(
                        fontSize: 15,
                        fontWeight: semiBold,
                      )),
                  const SizedBox(
                    height: 15,
                  ),
                  TextField(
                    controller: phoneController,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      hintText: "+628",
                      hintStyle: greyStyle.copyWith(fontSize: 14),
                      contentPadding: const EdgeInsets.all(12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Text("Select Package",
                      style: blackStyle.copyWith(
                        fontSize: 15,
                        fontWeight: semiBold,
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  Wrap(
                    spacing: 17,
                    runSpacing: 17,
                    children: widget.data.dataPlans!.map((dataPlan) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectDataPlan = dataPlan;
                          });
                        },
                        child: PackageItem(
                          data: dataPlan,
                          iSelected: dataPlan.id == selectDataPlan?.id,
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(
                    height: 85,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
              floatingActionButton: (selectDataPlan != null)
                  ? Container(
                      margin: const EdgeInsets.all(25),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.blue,
                              shadowColor: Colors.black,
                              backgroundColor: purpleColor,
                              shape: const StadiumBorder(),
                              minimumSize: const Size(350, 40)),
                          onPressed: () async {
                            if (await Navigator.pushNamed(
                                    context, '/pinPage') ==
                                true) {
                              final authState = context.read<AuthBloc>().state;
                              String pin = "";

                              if (authState is AuthSucces) {
                                pin = authState.user.pin!;
                              }
                              context.read<DataPlanBloc>().add(
                                    DataPlanPost(
                                      DataPlanFormModel(
                                        dataPlanId: selectDataPlan?.id,
                                        phoneNumber: phoneController.text,
                                        pin: pin,
                                      ),
                                    ),
                                  );
                            }
                          },
                          child: Text(
                            "Continue",
                            style: whiteStyle.copyWith(fontSize: 13),
                          )),
                    )
                  : Container(),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerFloat,
            );
          },
        ),
      ),
    );
  }
}
