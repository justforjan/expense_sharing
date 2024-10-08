import 'package:expense_sharing/environment.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:expense_sharing/pages/auth_page.dart';
import 'package:expense_sharing/pages/login_page.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Using dotenv might only be a good idea during development. In production it might be better to use --dart-define= arguments and then the Environment class
  await dotenv.load(fileName: '.env/development.env');

  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL'] ?? 'No URL',
    anonKey: dotenv.env['SUPABASE_ANON_KEY'] ?? 'No Key',
  );

  // print("ANON KEY: ${dotenv.env['SUPABASE_ANON_KEY'] ?? 'No Key'}");
  // print("URL: ${dotenv.env['SUPABASE_URL'] ?? 'No Key'}");

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
