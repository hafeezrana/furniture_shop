import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_shop/bottom_navbar.dart';
import 'package:furniture_shop/routes.dart';
import 'package:overlay_support/overlay_support.dart';

import 'authentication/auth_service.dart';
import 'authentication/signin/signIn_screen.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // final firebaseAnalytics = FirebaseAnalytics.instance;

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return OverlaySupport(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Furniture Shop',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: RouteGenerator.generateRoute,
        initialRoute: AuthStateChanges.route,
      ),
    );
  }
}

class AuthStateChanges extends StatelessWidget {
  AuthStateChanges({Key? key}) : super(key: key);

  static const String route = '/';

  final authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: authService.authStateChanges,
      builder: (conext, snapshot) {
        if (snapshot.data != null) {
          return const BottomNavBarScreen();
        } else {
          return const SignInScreen();
        }
      },
    );
  }
}
