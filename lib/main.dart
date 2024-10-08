import 'package:expense_sharing/environment.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:expense_sharing/pages/auth_page.dart';
import 'package:expense_sharing/pages/login_page.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: Environment.supabaseUrl,
    anonKey: Environment.supabaseAnonKey,
  );
  print("Supabase Anon Key: ${Environment.supabaseAnonKey}");
  print("Supabase URL: ${Environment.supabaseUrl}");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Testing',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.purple, surface: Colors.grey[300]),
        // scaffoldBackgroundColor: Colors.grey[300],
        // textTheme: TextTheme(),
        useMaterial3: true,
      ),
      home: LoginPage(
        onTap: () {},
      ),
    );
  }
}
