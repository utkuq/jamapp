import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jamapp/widgets/custom_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("HOME"),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 5.0),
              child: Text(
                "İtalya 🇮🇹",
                style: GoogleFonts.sairaCondensed(fontSize: 25),
              ),
            ),
            RecipeCard(
                title: "Test",
                cookTime: "15",
                rating: "10/10",
                thumbnailUrl: "")
          ],
        ),
      ),
    );
  }
}
