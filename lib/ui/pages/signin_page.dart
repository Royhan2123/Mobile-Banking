import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_ebanking/bloc/auth/auth_bloc.dart';
import 'package:mobile_ebanking/models/signin_form_model.dart';
import 'package:mobile_ebanking/shared/shared_methods.dart';
import 'package:mobile_ebanking/shared/theme.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool validate() {
    if (txtEmail.text.isEmpty || txtPassword.text.isEmpty) {
      showCustomSnackbar(context, "Tolong Di isi semua field");
      return false;
    }
    return true;
  }

  bool obsucureText = true;
  final TextEditingController txtEmail = TextEditingController(text: "");
  final TextEditingController txtPassword = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthFailed) {
              showCustomSnackbar(context, state.e);
            }
            if (state is AuthSucces) {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/home', (route) => false);
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
                  "Sing In\nGrow Your Finance",
                  style: blackStyle.copyWith(fontWeight: bold, fontSize: 18),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30),
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
                        Text(
                          "Email Addres",
                          style: blackStyle.copyWith(
                              fontSize: 13, fontWeight: medium),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: txtEmail,
                          decoration: InputDecoration(
                              hintStyle: greyStyle.copyWith(fontSize: 13),
                              hintText: "name@example.com",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              contentPadding: const EdgeInsets.all(12)),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Password",
                          style: blackStyle.copyWith(
                              fontSize: 13, fontWeight: medium),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          obscureText: obsucureText,
                          controller: txtPassword,
                          decoration: InputDecoration(
                              hintText: "password",
                              hintStyle: greyStyle.copyWith(fontSize: 13),
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      obsucureText = !obsucureText;
                                    });
                                  },
                                  icon: Icon(obsucureText
                                      ? Icons.visibility_off
                                      : Icons.visibility)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              contentPadding: const EdgeInsets.all(12)),
                          keyboardType: TextInputType.visiblePassword,
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: TextButton(
                              onPressed: () {},
                              child: const Text(
                                "Forgot Your Password",
                                style: TextStyle(fontSize: 13),
                              )),
                        ),
                        const SizedBox(
                          height: 15,
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
                                  context.read<AuthBloc>().add(AuthLogin(
                                      SignInFormModel(
                                          email: txtEmail.text,
                                          password: txtPassword.text)));
                                } else {
                                  showCustomSnackbar(context,
                                      "Semua Field Harus wajib di isi");
                                }
                              },
                              child: Text(
                                "Get Started",
                                style: whiteStyle.copyWith(fontSize: 13),
                              )),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/signUp');
                              },
                              child: Text(
                                "Create New Account",
                                style: greyStyle.copyWith(fontSize: 13),
                              )),
                        )
                      ],
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
