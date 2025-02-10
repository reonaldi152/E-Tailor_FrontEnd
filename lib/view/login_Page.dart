import 'package:flutter/material.dart';
import 'package:flutter_application_1/config/app_color.dart';
import 'package:flutter_application_1/config/pref.dart';
import 'package:flutter_application_1/config/viewmodel/user_viewmodel.dart';
import 'package:flutter_application_1/view/home_page.dart';
import 'package:flutter_application_1/view/register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool passwordVisible = true;
  bool isLoading = false;
  final Session _session = Session();

  final _formKey = GlobalKey<FormState>();

  RegExp get emailRegex => RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "E - Tailor",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/penjahitan.jpg',
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Masuk',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              TextFormField(
                  controller: emailController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    fillColor: AppColor.white,
                    filled: true,
                    labelStyle:
                        fontTextStyle.copyWith(color: const Color(0xff878E97)),
                    hintStyle:
                        fontTextStyle.copyWith(color: const Color(0xff878E97)),
                    hintText: "Email",
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(color: Color(0xFFE8EDF1)),
                    ),
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFE8EDF1)),
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFE8EDF1)),
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email harus di isi';
                    } else if (value.isNotEmpty) {
                      if (!emailRegex.hasMatch(value)) {
                        return 'Email tidak valid';
                      }
                    }
                    return null;
                  }),
              const SizedBox(height: 16),
              TextFormField(
                controller: passwordController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                obscureText: passwordVisible,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'kata sandi harus di isi';
                  }
                  return null;
                },
                maxLines: 1,
                decoration: InputDecoration(
                    fillColor: AppColor.white,
                    filled: true,
                    labelStyle:
                        fontTextStyle.copyWith(color: const Color(0xff878E97)),
                    hintStyle:
                        fontTextStyle.copyWith(color: const Color(0xff878E97)),
                    hintText: "Kata Sandi",
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(color: Color(0xFFE8EDF1)),
                    ),
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFE8EDF1)),
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFE8EDF1)),
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                    suffixIconColor: const Color(0xff324256),
                    suffixIcon: IconButton(
                        icon: Icon(passwordVisible
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: () {
                          setState(() {
                            passwordVisible = !passwordVisible;
                          });
                        })),
              ),
              Container(
                margin: const EdgeInsets.only(top: 18, bottom: 30),
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColor.colorSecondBlue,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: isLoading
                    ? const Center(
                        child: CircularProgressIndicator(
                        color: AppColor.white,
                        strokeWidth: 2,
                      ))
                    : TextButton(
                        onPressed: () {
                          Session().setUserLogin(value: true);
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => const HomePage()),
                              (Route<dynamic> route) => false);
                        },
                        child: Text(
                          "Masuk Sekarang",
                          style: fontTextStyle.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColor.white,
                            fontSize: 16,
                          ),
                        )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Belum memiliki akun? ",
                      style: fontTextStyle.copyWith(
                          color: const Color(0xFF4F5E71))),
                  InkResponse(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RegisterPage()));
                      },
                      child: Text("daftar sekarang",
                          style: fontTextStyle.copyWith(
                              color: AppColor.colorSecondBlue)))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void handleLogin() {
    UserViewmodel().login().then(
      (value) async {
        if (value.code == 200) {
          await Session().setUserToken(value.data["access_token"]);

          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (_) => const HomePage()),
            (Route<dynamic> route) => false,
          );
        }
      },
    );
  }
}
