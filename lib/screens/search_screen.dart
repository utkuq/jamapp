import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jamapp/screens/camera_screen.dart';
import 'package:permission_handler/permission_handler.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<SearchScreen> {
  Future requestPermission() async {
    final permission = Permission.camera;

    if (await permission.isDenied) {
      await permission.request();
    }
  }

  Future openCamera() async {
    requestPermission();
    await availableCameras().then((value) => Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CameraScreen(
                  cameras: value,
                ))));
  }

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
          centerTitle: true,
          title: Text(
            "AtlasBOT",
            style: GoogleFonts.pacifico(fontSize: 27),
          ),
        ),
        body: Center(
          child: FloatingActionButton(
            onPressed: openCamera,
            child: Text("kamera"),
          ),
        ),
      ),
    );
  }
}
