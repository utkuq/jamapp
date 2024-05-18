import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';

class SignupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.orangeAccent,
          title: Text('Kayıt Ol'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("E-mail"),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Şifre"),
                  ),
                  obscureText: true,
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Şifre (Tekrar)"),
                ),
                obscureText: true,
              ),
              SizedBox(height: 20),
              CustomButton(
                text: 'Sign Up',
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/home');
                },
              ),
              FilledButton(onPressed: (){Navigator.pushNamed(context, '/signin');}, child: Text("Sign in e git"))
            ],
          ),
        ),
      ),
    );
  }
}