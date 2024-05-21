import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.purple,
        useMaterial3: true,
      ),
      home: Scaffold(
        body: SafeArea(
          child: IntroductionScreen(
            pages: [
              PageViewModel(
                decoration: PageDecoration(
                  titleTextStyle:
                      GoogleFonts.pacifico(fontSize: 30, color: Colors.white),
                ),
                title: "Hoş Geldiniz!",
                body: "Dünya mutfağı Lezzet Atlası ile telefonunuzda!",
                image: Image.asset(
                  'assets/resimler/onboarding.png',
                  height: 275,
                ),
              ),
              PageViewModel(
                decoration: PageDecoration(
                  titleTextStyle:
                      GoogleFonts.pacifico(fontSize: 30, color: Colors.white),
                ),
                title: "Atlasbot Burada!",
                body:
                    "Yemek yapmak istediğiniz malzemeleri Atlasbot ile tarife çevirebilirsiniz!",
                image: Image.asset(
                  'assets/resimler/onboarding2.png',
                  height: 275,
                ),
              ),
              PageViewModel(
                decoration: PageDecoration(
                  titleTextStyle:
                      GoogleFonts.pacifico(fontSize: 30, color: Colors.white),
                ),
                title: "Hadi Başlayalım!",
                body: "",
                image: Center(
                    child:
                        Icon(Icons.thumb_up, size: 100, color: Colors.white)),
              ),
            ],
            onDone: () {
              Navigator.of(context).pushReplacementNamed('/signup');
            },
            onSkip: () {
              Navigator.of(context).pushReplacementNamed('/signup');
            },
            showSkipButton: true,
            skip: const Text(
              "Atla",
              style: TextStyle(color: Colors.black),
            ),
            next: const Icon(Icons.arrow_forward, color: Colors.black),
            done: const Text(
              "Başla",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            dotsDecorator:
                DotsDecorator(color: Colors.white, activeColor: Colors.black),
          ),
        ),
      ),
    );
  }
}
