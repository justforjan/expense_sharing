import 'package:expense_sharing/pages/home_page.dart';
import 'package:expense_sharing/pages/login_or_register.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // body: StreamBuilder<User?>(
        //     stream: FirebaseAuth.instance.authStateChanges(),
        //     builder: (context, snapshot) {
        //       if (snapshot.hasData) {
        //         return HomePage();
        //       } else {
        //         return LoginOrRegisterPage();
        //       }
        //     })
        );
  }
}
