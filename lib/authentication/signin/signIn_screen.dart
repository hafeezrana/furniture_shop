import 'package:flutter/material.dart';
import 'package:furniture_shop/authentication/auth_service.dart';
import 'package:furniture_shop/main.dart';

import 'package:furniture_shop/utils/constants/colors_consts.dart';
import 'package:furniture_shop/utils/widgets/resusable_button.dart';
import 'package:furniture_shop/utils/widgets/reusbale_textformf.dart';
import 'package:furniture_shop/utils/widgets/text_style.dart';
import 'package:go_router/go_router.dart';

import '../signup/signUp_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  static const route = '/signin';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 6,
              child: Stack(
                children: [
                  const Center(
                      child: Divider(
                          indent: 20,
                          endIndent: 20,
                          height: 2,
                          color: ConstColors.black)),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                          border:
                              Border.all(width: 1.5, color: ConstColors.black2),
                          borderRadius: BorderRadius.circular(50)),
                      child: const CircleAvatar(
                          backgroundColor: ConstColors.white,
                          maxRadius: 34,
                          child: Icon(Icons.table_restaurant,
                              color: ConstColors.black3, size: 30)),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 7,
              child: ListView(
                children: [
                  Text('Hello !',
                      style: MyTextStyle.textStyle3
                          .copyWith(color: ConstColors.black2)),
                  const Text('WELCOME BACK', style: MyTextStyle.textStyle4),
                ],
              ),
            ),
            SizedBox(
              child: Card(
                elevation: 16,
                color: ConstColors.white,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Text('Email',
                                  style: MyTextStyle.textStyle2),
                              ReUsableTextFField(
                                controller: emailController,
                                labelText: '',
                              ),
                              const SizedBox(height: 18),
                              const Text(
                                'Password',
                                style: MyTextStyle.textStyle2,
                              ),
                              ReUsableTextFField(
                                controller: passwordController,
                                labelText: '',
                                icon: const Icon(
                                  Icons.remove_red_eye_outlined,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Forgot Password',
                        style: MyTextStyle.textStyle2
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 10),
                      ResuableButton(
                        buttonText: 'Log In',
                        onTap: () async {
                          await AuthService().emailLogin(
                            email: emailController.text,
                            password: passwordController.text,
                          );
                          context.go(AuthStateChanges.route);
                        },
                      ),
                      const SizedBox(height: 10),
                      TextButton(
                        child: Text(
                          'SIGN UP',
                          style: MyTextStyle.textStyle2
                              .copyWith(color: ConstColors.black),
                        ),
                        onPressed: () {
                          context.go(SignUpScreen.route);
                        },
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
