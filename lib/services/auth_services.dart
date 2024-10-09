import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthServices {
  final _supabase = Supabase.instance.client;

  AuthServices() {}

  SupabaseClient getSupabaseClient() {
    return _supabase;
  }

  updateUser() {}

  getCurrentUser() {}

  signInWithGoogle() async {
    /// Web Client ID that you registered with Google Cloud.
    String webClientId = dotenv.env['GOOGLE_OAUTH_WEB_CLIENTID'] ?? '';

    /// iOS Client ID that you registered with Google Cloud.
    String iosClientId = dotenv.env['GOOGLE_OAUTH_IOS_CLIENTID'] ?? '';

    final GoogleSignIn googleSignIn = GoogleSignIn(
      clientId: iosClientId,
      serverClientId: webClientId,
    );
    final googleUser = await googleSignIn.signIn();
    final googleAuth = await googleUser!.authentication;
    final accessToken = googleAuth.accessToken;
    final idToken = googleAuth.idToken;

    if (accessToken == null) {
      throw 'No Access Token found.';
    }
    if (idToken == null) {
      throw 'No ID Token found.';
    }

    await _supabase.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
      accessToken: accessToken,
    );
  }

  createUserWithEmailAndPassword(
      String email, String password, String displayName) async {
    _supabase.auth.signUp(password: password, email: email);
  }

  signInWithEmailAndPassword(String email, String password) async {
    await _supabase.auth.signInWithPassword(password: password, email: email);
  }

  signUserOut() {
    _supabase.auth.signOut();
  }

  String getCurrentUserID() {
    return "1234qwer";
  }
}
