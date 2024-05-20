import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jamapp/screens/camera_screen.dart';
import 'package:permission_handler/permission_handler.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<SearchScreen> {
  File? _image;

  XFile? _picture;
  Future requestPermission() async {
    final permissionCamera = Permission.camera;
    final permissionGallery = Permission.photos;
    final p1 = Permission.manageExternalStorage;

    if (await permissionCamera.isDenied) {
      await permissionCamera.request();
    }
    if (await permissionGallery.isDenied) {
      await permissionGallery.request();
    }
    if (await p1.isDenied) {
      await p1.request();
    }
  }

  Future openCamera() async {
    requestPermission();
    final cameras = await availableCameras();
    final XFile? picture = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CameraScreen(
                  cameras: cameras,
                )));
    //if (!context.mounted) return;
    if (picture != null) {
      setState(() {
        _picture = picture;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton(
          onPressed: openCamera,
          child: const Icon(Icons.camera_alt),
        ),
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "AtlasBOT",
            style: GoogleFonts.pacifico(fontSize: 27),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _picture != null
                  ? Image.file(
                      File(_picture!.path),
                      width: 200,
                      height: 200,
                    )
                  : const SizedBox(
                      width: 0,
                      height: 0,
                    ),
              _image != null
                  ? Image.file(
                      File(_image!.path),
                      width: 200,
                      height: 200,
                    )
                  : const SizedBox(
                      width: 0,
                      height: 0,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
