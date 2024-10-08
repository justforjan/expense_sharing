import 'package:expense_sharing/pages/group_page.dart';
import 'package:expense_sharing/pages/login_or_register.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  Stream<AuthState> get authStateStream =>
      Supabase.instance.client.auth.onAuthStateChange;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<AuthState>(
            stream: authStateStream,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                final session = Supabase.instance.client.auth.currentSession;
                if (session != null || session?.user != null) {
                  return GroupPage();
                } else {
                  return LoginOrRegisterPage();
                }
              }
              return const Center(child: CircularProgressIndicator());
            }));
  }
}
