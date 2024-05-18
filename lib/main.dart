import 'package:flutter/material.dart';
import 'package:jamapp/pages/sign_in.dart';
import 'package:jamapp/pages/sign_up.dart';
import 'screens/onboarding_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'screens/home_screen.dart';
import 'screens/second_screen.dart';

void main()  {
  //await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Onboarding App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.purple,
      ),
      home: OnboardingScreen(),
      routes: {
        '/home': (context) => HomeScreen(),
        '/second': (context) => SecondScreen(),
        '/onboarding': (context) => OnboardingScreen(),
        '/signin': (context) => const SignIn(),
        '/signup': (context) => SignUp(),
      },
    );
  }
}
