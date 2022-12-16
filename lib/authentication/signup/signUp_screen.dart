import 'package:flutter/material.dart';
import 'package:furniture_shop/authentication/auth_service.dart';
import 'package:furniture_shop/model/user.dart';

import 'package:furniture_shop/utils/constants/colors_consts.dart';
import 'package:furniture_shop/utils/widgets/resusable_button.dart';
import 'package:furniture_shop/utils/widgets/reusbale_textformf.dart';
import 'package:furniture_shop/utils/widgets/text_style.dart';

import '../../main.dart';
import '../firestore_service.dart';
import '../signin/signIn_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  static const route = '/signUp';
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height / 1,
          child: ListView(
            scrollDirection: Axis.vertical,
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
                            border: Border.all(
                                width: 1.5, color: ConstColors.black2),
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
                height: MediaQuery.of(context).size.height / 8.4,
                child: const Text('WELCOME', style: MyTextStyle.textStyle4),
              ),
              SizedBox(
                child: Card(
                  elevation: 16,
                  color: ConstColors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Text('Name', style: MyTextStyle.textStyle2),
                              ReUsableTextFField(
                                controller: nameController,
                                labelText: '',
                              ),
                              const SizedBox(height: 10),
                              const Text('Email',
                                  style: MyTextStyle.textStyle2),
                              ReUsableTextFField(
                                controller: emailController,
                                labelText: '',
                              ),
                              const SizedBox(height: 10),
                              const Text('Password',
                                  style: MyTextStyle.textStyle2),
                              ReUsableTextFField(
                                controller: passwordController,
                                labelText: '',
                                icon: const Icon(Icons.remove_red_eye_outlined),
                              ),
                              const SizedBox(height: 10),
                              const Text('Confirm Password',
                                  style: MyTextStyle.textStyle2),
                              const ReUsableTextFField(
                                  labelText: '',
                                  icon: Icon(Icons.remove_red_eye_outlined)),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      ResuableButton(
                        buttonText: 'SIGN UP',
                        onTap: () async {
                          await AuthService().registerUser(
                            email: emailController.text,
                            password: passwordController.text,
                          );

                          await FirestoreService().addUser(
                            User(
                              name: nameController.text,
                              email: emailController.text,
                            ),
                          );
                          setState(() {});

                          Navigator.pushNamed(context, AuthStateChanges.route);
                        },
                      ),
                      const SizedBox(height: 10),
                      TextButton(
                        child: Text(
                          'Already have an account? SIGN IN',
                          style: MyTextStyle.textStyle2
                              .copyWith(color: ConstColors.black),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, SignInScreen.route);
                        },
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
