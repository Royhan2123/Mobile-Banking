import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_ebanking/bloc/auth/auth_bloc.dart';
import 'package:mobile_ebanking/models/signup_model.dart';
import 'package:mobile_ebanking/shared/shared_methods.dart';
import 'package:mobile_ebanking/shared/theme.dart';
import 'package:mobile_ebanking/ui/pages/home_page.dart';

class SignUpSetKtp extends StatefulWidget {
  final SignUpModels data;
  const SignUpSetKtp({required this.data, super.key});

  @override
  State<SignUpSetKtp> createState() => _SignUpSetKtpState();
}

class _SignUpSetKtpState extends State<SignUpSetKtp> {
  final TextEditingController txtPin = TextEditingController(text: "");
  XFile? selectedImage;

  selectImage() async {
    final imagePicker = ImagePicker();
    final XFile? image =
        await imagePicker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        selectedImage = image;
      });
    }
  }

  bool validate() {
    if (selectedImage == null) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthFailed) {
              showCustomSnackbar(context, state.error);
            } else if (state is AuthSucces) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                  (route) => false);
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView(
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
                  "Verify Your\nAccount",
                  style: blackStyle.copyWith(fontWeight: bold, fontSize: 18),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 40),
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(color: Colors.grey, blurRadius: 12)
                      ],
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white),
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
                                    borderRadius: BorderRadius.circular(
                                      50,
                                    ),
                                    image: selectedImage == null
                                        ? null
                                        : DecorationImage(
                                            image: FileImage(
                                              File(selectedImage!.path),
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                    color: lightBackgroundColor,
                                  ),
                                  child: Center(
                                    child: selectedImage != null
                                        ? null
                                        : Image.asset(
                                            "assets/ic_upload.png",
                                            width: 40,
                                          ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Passport/ID Card",
                                style: blackStyle.copyWith(
                                    fontWeight: bold, fontSize: 15),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 80,
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
                                context.read<AuthBloc>().add(
                                      AuthRegister(
                                        widget.data.copyWith(
                                          ktp: selectedImage == null
                                              ? null
                                              // ignore: prefer_interpolation_to_compose_strings
                                              : 'data:image/png;base64,' +
                                                  base64Encode(
                                                    File(selectedImage!.path)
                                                        .readAsBytesSync(),
                                                  ),
                                        ),
                                      ),
                                    );
                              } else {
                                showCustomSnackbar(
                                    context, "Gambar tidak boleh kosong");
                              }
                            },
                            child: Text(
                              "Continue",
                              style: whiteStyle.copyWith(fontSize: 13),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Center(
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Skip for now",
                      style:
                          greyStyle.copyWith(fontSize: 14, fontWeight: medium),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
