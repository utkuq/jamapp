import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          children: [
            CustomButton(
              text: 'Go to Second Screen',
              onPressed: () {
                Navigator.pushNamed(context, '/second');
              },
            ),
            CustomButton(
              text: "Onboarding'e git",
              onPressed: () {
                Navigator.pushNamed(context, '/onboarding');
              },
            ),
          ],
        ),
      ),
    );
  }
}
