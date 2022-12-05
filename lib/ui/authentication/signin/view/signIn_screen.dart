import 'package:flutter/material.dart';
import 'package:furniture_shop/ui/authentication/signup/view/signUp_screen.dart';
import 'package:furniture_shop/ui/bottom_navbar.dart';
import 'package:furniture_shop/utils/constants/colors_consts.dart';
import 'package:furniture_shop/utils/widgets/resusable_button.dart';
import 'package:furniture_shop/utils/widgets/reusbale_textformf.dart';
import 'package:furniture_shop/utils/widgets/text_style.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  static const route = '/signin';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.start,
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
                      color: ConstColors.black,
                    ),
                  ),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        border:
                            Border.all(width: 1.5, color: ConstColors.black2),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const CircleAvatar(
                        backgroundColor: ConstColors.white,
                        maxRadius: 34,
                        child: Icon(
                          Icons.table_restaurant,
                          color: ConstColors.black3,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 7,
              child: ListView(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello !',
                    style: MyTextStyle.textStyle3
                        .copyWith(color: ConstColors.black2),
                  ),
                  const Text(
                    'WELCOME BACK',
                    style: MyTextStyle.textStyle4,
                  ),
                ],
              ),
            ),
            SizedBox(
              // height: MediaQuery.of(context).size.height / 2,
              child: Card(
                elevation: 16,
                color: ConstColors.white,
                child: SingleChildScrollView(
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Text('Email', style: MyTextStyle.textStyle2),
                              ReUsableTextFField(
                                labelText: '',
                              ),
                              SizedBox(height: 18),
                              Text('Password', style: MyTextStyle.textStyle2),
                              ReUsableTextFField(
                                  labelText: '',
                                  icon: Icon(Icons.remove_red_eye_outlined)),
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
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            BottomNavBarScreen.route,
                          );
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
                          Navigator.pushNamed(
                            context,
                            SignUpScreen.route,
                          );
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
