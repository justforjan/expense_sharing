import 'package:supabase_flutter/supabase_flutter.dart';

class AuthServices {
  final supabase = Supabase.instance.client;

  AuthServices() {}

  updateUser() {}

  getCurrentUser() {}

  signInWithGoogle() async {}

  createUserWithEmailAndPassword(
      String email, String password, String displayName) async {
    supabase.auth.signUp(password: password, email: email);
  }

  signInWithEmailAndPassword(String email, String password) async {
    await supabase.auth.signInWithPassword(password: password, email: email);
  }

  signUserOut() {
    supabase.auth.signOut();
  }

  String getCurrentUserID() {
    return "1234qwer";
  }
}
