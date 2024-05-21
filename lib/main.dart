import 'package:flutter/material.dart';
import 'package:jamapp/firebase_options.dart';
import 'package:jamapp/firebase/sign_in.dart';
import 'package:jamapp/firebase/sign_up.dart';
import 'package:jamapp/screens/auth.dart';
import 'screens/onboarding_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/tab_view_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
      );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lezzet Atlasi',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const MainScreen(),
      routes: {
        '/tabview': (context) => TabViewScreen(),
        '/onboarding': (context) => OnboardingScreen(),
        '/signin': (context) => const SignIn(),
        '/signup': (context) => const SignUp(),
      },
    );
  }
}
