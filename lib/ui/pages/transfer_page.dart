import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_ebanking/bloc/user/user_bloc.dart';
import 'package:mobile_ebanking/models/users_model.dart';
import 'package:mobile_ebanking/shared/theme.dart';
import 'package:mobile_ebanking/ui/widgets/transfer_result_item.dart';
import 'package:mobile_ebanking/ui/widgets/trasnfer_recent_user_item.dart';

class TransferPage extends StatefulWidget {
  const TransferPage({super.key});

  @override
  State<TransferPage> createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  final usernameController = TextEditingController(text: "");
  UserModels? selectedUser;

  late UserBloc userBloc;

  @override
  void initState() {
    super.initState();

    userBloc = context.read<UserBloc>()
      ..add(
        UserGetRecent(),
      );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: lightBackgroundColor,
          elevation: 0,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios_new,
              size: 20,
              color: blackColor,
            ),
          ),
          title: Text(
            "Transfer",
            style: blackStyle.copyWith(fontSize: 13, fontWeight: bold),
          ),
          centerTitle: true,
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            const SizedBox(
              height: 30,
            ),
            Text(
              "Search",
              style: blackStyle.copyWith(fontSize: 16, fontWeight: semiBold),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: usernameController,
              keyboardType: TextInputType.name,
              onFieldSubmitted: (value) {
                if (value.isNotEmpty) {
                  userBloc.add(
                    UserGetByUsername(usernameController.text),
                  );
                } else {
                  selectedUser = null;
                  userBloc.add(
                    UserGetRecent(),
                  );
                }
                setState(() {});
              },
              decoration: InputDecoration(
                  hintText: "by username",
                  hintStyle: greyStyle.copyWith(fontSize: 14),
                  contentPadding: const EdgeInsets.all(12),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            usernameController.text.isEmpty
                ? buildRecentUsers()
                : buildResult(),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
        floatingActionButton: selectedUser != null
            ? Container(
                margin: const EdgeInsets.all(20),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.blue,
                        shadowColor: Colors.black,
                        backgroundColor: purpleColor,
                        shape: const StadiumBorder(),
                        minimumSize: const Size(350, 40)),
                    onPressed: () async {
                      Navigator.pushNamed(context, '/transferAmountPage');
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

  Widget buildRecentUsers() {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Recent Users",
            style: blackStyle.copyWith(fontSize: 16, fontWeight: semiBold),
          ),
          const SizedBox(
            height: 14,
          ),
          BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state is UserSucces) {
                return Column(
                  children: state.user.map((user) {
                    return TransferRecentUserItem(user: user);
                  }).toList(),
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          )
        ],
      ),
    );
  }

  Widget buildResult() {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserSucces) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Result",
                  style:
                      blackStyle.copyWith(fontSize: 16, fontWeight: semiBold),
                ),
                const SizedBox(
                  height: 14,
                ),
                Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  children: state.user.map((user) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          selectedUser = user;
                        });
                      },
                      child: TransferResultUserItem(
                        user: user,
                        isSelected: user.id == selectedUser?.id,
                      ),
                    );
                  }).toList(),
                ),
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.red,
            ),
          );
        },
      ),
    );
  }
}
