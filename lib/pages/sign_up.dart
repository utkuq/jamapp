import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //Color backgroundColor1 = const Color(0xffE9EAF7);
    Color backgroundColor2 = const Color(0xffF4EEF2);
    //Color backgroundColor3 = const Color(0xffEBEBF2);
    Color backgroundColor4 = const Color(0xffE3EDF5);
    //Color primaryColor = const Color(0xffD897FD);
    Color textColor1 = const Color(0xff353047);
    //Color textColor2 = const Color(0xff6F6B7A);
    Color buttonColor = Colors.purple;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              backgroundColor2,
              backgroundColor2,
              backgroundColor4,
            ],
          ),
        ),
        child: SafeArea(
            child: ListView(
          children: [
            SizedBox(height: size.height * 0.03),
            Text("Kayıt Ol",
                textAlign: TextAlign.center,
                style: GoogleFonts.pacifico(fontSize: 37, color: textColor1)),
            const SizedBox(height: 15),
            SizedBox(height: size.height * 0.04),
            // for username and password
            myTextField("E-mail", Colors.white, false),
            myTextField("Şifre", Colors.black26, true),
            myTextField("Şifre (Tekrar)", Colors.black26, true),
            const SizedBox(height: 10),
            SizedBox(height: size.height * 0.04),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  // for sign in button
                  Container(
                    width: size.width,
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      color: buttonColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Center(
                      child: Text(
                        "Kayıt Ol",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Zaten bir hesabınız var mı?"),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/signin');
                        },
                        child: Text("Giriş Yapın"),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }

  Container socialIcon(image) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 32,
        vertical: 15,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.white,
          width: 2,
        ),
      ),
      child: Image.asset(
        image,
        height: 35,
      ),
    );
  }

  Container myTextField(String hint, Color color, bool type) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 10,
      ),
      child: TextField(
        obscureText: type,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 22,
            ),
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(15),
            ),
            hintText: hint,
            hintStyle: const TextStyle(
              color: Colors.black45,
              fontSize: 19,
            ),
            suffixIcon: Icon(
              Icons.visibility_off_outlined,
              color: color,
            )),
      ),
    );
  }
}
