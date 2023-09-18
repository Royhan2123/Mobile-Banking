import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_ebanking/models/signup_form_model.dart';
import 'package:mobile_ebanking/shared/shared_methods.dart';
import 'package:mobile_ebanking/shared/theme.dart';
import 'package:mobile_ebanking/ui/pages/signup_set_ktp_page.dart';

class SignUpSetProfilePage extends StatefulWidget {
  final SignUpFormModel data;
  const SignUpSetProfilePage({required this.data, super.key});

  @override
  State<SignUpSetProfilePage> createState() => _SignUpSetProfilePageState();
}

class _SignUpSetProfilePageState extends State<SignUpSetProfilePage> {
  final TextEditingController txtPin = TextEditingController(text: "");
  XFile? selectedImage;

  bool validate() {
    if (txtPin.text.length != 6) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    //ignore: avoid_print
    print(widget.data.toJson());
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          children: [
            Container(
              width: 155,
              height: 50,
              margin: const EdgeInsets.only(top: 60, bottom: 80),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/img_logo_light.png"))),
            ),
            Text(
              "Join Us to Unlock\nYour Growth",
              style: blackStyle.copyWith(fontWeight: bold, fontSize: 18),
            ),
            Container(
              margin: const EdgeInsets.only(top: 40),
              decoration: BoxDecoration(boxShadow: const [
                BoxShadow(color: Colors.grey, blurRadius: 12)
              ], borderRadius: BorderRadius.circular(15), color: Colors.white),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () async {
                              final image = await selectImage();
                              setState(() {
                                selectedImage = image;
                              });
                            },
                            child: Container(
                              width: 100,
                              height: 100,
                              margin: const EdgeInsets.only(),
                              decoration: BoxDecoration(
                                  color: lightBackgroundColor,
                                  borderRadius: BorderRadius.circular(
                                    50,
                                  ),
                                  image: selectedImage == null
                                      ? null
                                      : DecorationImage(
                                          image: FileImage(
                                              File(selectedImage!.path)),
                                          fit: BoxFit.cover)),
                              child: selectedImage != null
                                  ? null
                                  : Center(
                                      child: Image.asset(
                                        "assets/ic_upload.png",
                                        width: 32,
                                      ),
                                    ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Shayna Hanna",
                            style: blackStyle.copyWith(
                                fontWeight: bold, fontSize: 15),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Text(
                      "Set PIN(6 digit number)",
                      style:
                          blackStyle.copyWith(fontSize: 12, fontWeight: medium),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      obscureText: true,
                      controller: txtPin,
                      inputFormatters: [LengthLimitingTextInputFormatter(6)],
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                          contentPadding: const EdgeInsets.all(10)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.blue,
                              shadowColor: Colors.black,
                              backgroundColor: purpleColor,
                              shape: const StadiumBorder(),
                              minimumSize: const Size(350, 40)),
                          onPressed: () {
                            if (validate()) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignUpSetKtp(
                                      data: widget.data.copyWith(
                                          pin: txtPin.text,
                                          profilePicture: selectedImage == null
                                              ? null
                                              : "data:image/png;base64${base64Encode(
                                                  File(
                                                    selectedImage!.path,
                                                  ).readAsBytesSync(),
                                                )},"),
                                    ),
                                  ));
                            } else {
                              showCustomSnackbar(context, "Pin Harus 6 digit");
                            }
                          },
                          child: Text(
                            "Continue",
                            style: whiteStyle.copyWith(fontSize: 13),
                          )),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
