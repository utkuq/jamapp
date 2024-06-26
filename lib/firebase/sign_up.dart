import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  // email controller
  final _emailController = TextEditingController();
  // şifre controller
  final _passwordController = TextEditingController();
  // şifre kontrol
  final _passwordCheckController = TextEditingController();

  // şifre görünür yap
  bool _passwordVisible = false;
  bool _passwordCheckVisible = false;

  bool passwordConfirmed() {
    if (_passwordCheckController.text.trim() ==
        _passwordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  Future signUp() async {
    if (passwordConfirmed()) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
        // Kayıt başarılı olursa yönlendirme yap
        await Navigator.pushNamed(context, '/signin');
        Navigator.pop(context);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Kayıt başarısız: ${e.toString()}')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: const Text('Şifreler uyuşmuyor')),
      );
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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
            child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: size.height * 0.03),
                Text("Kayıt Ol",
                    textAlign: TextAlign.center,
                    style:
                        GoogleFonts.pacifico(fontSize: 37, color: textColor1)),
                const SizedBox(height: 15),
                SizedBox(height: size.height * 0.04),
                // for username and password
                myTextField("E-mail", Colors.white, false, _emailController,
                    false, null),
                myTextField(
                  "Şifre",
                  Colors.black26,
                  true,
                  _passwordController,
                  _passwordVisible,
                  () {
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                ),
                myTextField(
                  "Şifre (Tekrar)",
                  Colors.black26,
                  true,
                  _passwordCheckController,
                  _passwordCheckVisible,
                  () {
                    setState(() {
                      _passwordCheckVisible = !_passwordCheckVisible;
                    });
                  },
                ),
                const SizedBox(height: 10),
                SizedBox(height: size.height * 0.04),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    children: [
                      // for sign in button
                      GestureDetector(
                        onTap: signUp,
                        child: Container(
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
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Zaten bir hesabınız var mı?"),
                          TextButton(
                            onPressed: () async {
                              await Navigator.pushNamed(context, '/signin');
                              Navigator.pop(context);
                            },
                            child: const Text("Giriş Yapın"),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
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

  Container myTextField(
    String hint,
    Color color,
    bool type,
    TextEditingController controller,
    bool obscureTextToggle,
    VoidCallback? onSuffixIconPressed,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 10,
      ),
      child: TextField(
        controller: controller,
        obscureText: type ? !obscureTextToggle : false,
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
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(
                color: Colors.transparent,
                width: 2.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(
                color: Colors.purple,
                width: 2.0,
              ),
            ),
            hintText: hint,
            hintStyle: const TextStyle(
              color: Colors.black45,
              fontSize: 19,
            ),
            suffixIcon: type
                ? GestureDetector(
                    onTap: onSuffixIconPressed,
                    child: Icon(
                      obscureTextToggle
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: color,
                    ),
                  )
                : null),
      ),
    );
  }
}
