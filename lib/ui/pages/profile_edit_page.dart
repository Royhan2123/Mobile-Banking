import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_ebanking/bloc/auth/auth_bloc.dart';
import 'package:mobile_ebanking/shared/theme.dart';

class ProfilEditPage extends StatefulWidget {
  const ProfilEditPage({super.key});

  @override
  State<ProfilEditPage> createState() => _ProfilEditPageState();
}

class _ProfilEditPageState extends State<ProfilEditPage> {
  @override
  void initState() {
    super.initState();
    final auth = context.read<AuthBloc>().state;

    if (auth is AuthSucces) {
      txtUserName.text = auth.user.userName!;
      txtFullName.text = auth.user.name!;
      txtEmail.text = auth.user.email!;
      txtEmail.text = auth.user.password!;
    }
  }

  final TextEditingController txtUserName = TextEditingController(text: "");
  final TextEditingController txtFullName = TextEditingController(text: "");
  final TextEditingController txtEmail = TextEditingController(text: "");
  final TextEditingController txtPassword = TextEditingController(text: "");
  bool obsucureText = true;
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
            child: const Icon(
              Icons.arrow_back_ios_new,
              size: 25,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          title: Text(
            "Edit Photo",
            style: blackStyle.copyWith(fontSize: 15, fontWeight: semiBold),
          ),
        ),
        body: ListView(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: whiteColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Username",
                    style:
                        blackStyle.copyWith(fontSize: 13, fontWeight: medium),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: txtUserName,
                    cursorColor: blackColor,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: greyColor),
                          borderRadius: BorderRadius.circular(15)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: greyColor,
                          ),
                          borderRadius: BorderRadius.circular(15)),
                      contentPadding: const EdgeInsets.all(12),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Full name",
                    style:
                        blackStyle.copyWith(fontSize: 13, fontWeight: medium),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: txtFullName,
                    cursorColor: blackColor,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: greyColor),
                          borderRadius: BorderRadius.circular(15)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: greyColor,
                          ),
                          borderRadius: BorderRadius.circular(15)),
                      contentPadding: const EdgeInsets.all(12),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Email Addres",
                    style:
                        blackStyle.copyWith(fontSize: 13, fontWeight: medium),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: txtEmail,
                    cursorColor: blackColor,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: greyColor),
                          borderRadius: BorderRadius.circular(15)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: greyColor,
                          ),
                          borderRadius: BorderRadius.circular(15)),
                      contentPadding: const EdgeInsets.all(12),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Password",
                    style:
                        blackStyle.copyWith(fontSize: 13, fontWeight: medium),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: txtPassword,
                    cursorColor: blackColor,
                    obscureText: obsucureText,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              obsucureText = !obsucureText;
                            });
                          },
                          icon: Icon(
                            obsucureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: obsucureText ? greyColor : blackColor,
                          )),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: greyColor),
                          borderRadius: BorderRadius.circular(15)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: greyColor,
                          ),
                          borderRadius: BorderRadius.circular(15)),
                      contentPadding: const EdgeInsets.all(12),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            animationDuration: const Duration(seconds: 2),
                            shape: const StadiumBorder(),
                            minimumSize: const Size(300, 45),
                            foregroundColor: blueColor,
                            backgroundColor: purpleColor),
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(context,
                              '/profilEditSuccesPage', (route) => false);
                        },
                        child: Text(
                          "Update Now",
                          style: whiteStyle.copyWith(fontSize: 13),
                        )),
                  ),
                  const SizedBox(
                    height: 15,
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
