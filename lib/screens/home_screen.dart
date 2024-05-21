import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jamapp/firebase/firestore.dart';
import 'package:jamapp/widgets/country_overview.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // firestore service
  final FirestoreService firestoreService = FirestoreService();

  String countryImageUrl1 = '';
  // text controllers
  TextEditingController countryName_controller = TextEditingController();
  TextEditingController countryEmoji_controller = TextEditingController();
  TextEditingController cousine_1_controller = TextEditingController();
  TextEditingController cousine_2_controller = TextEditingController();
  TextEditingController cousine_3_controller = TextEditingController();
  TextEditingController cousine_4_controller = TextEditingController();

  void openCountryBox() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('İptal')),
          TextButton(
              onPressed: () {
                try {
                  firestoreService.addCountry(
                    countryImageUrl1,
                    countryName_controller.text,
                    countryEmoji_controller.text,
                    cousine_1_controller.text,
                    cousine_2_controller.text,
                    cousine_3_controller.text,
                    cousine_4_controller.text,
                  );

                  // clear textfields
                  countryName_controller.clear();
                  countryEmoji_controller.clear();
                  cousine_1_controller.clear();
                  cousine_2_controller.clear();
                  cousine_3_controller.clear();
                  cousine_4_controller.clear();
                  Navigator.pop(context);
                } catch (error) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(error.toString())));
                }
              },
              child: Text('Kaydet')),
        ],
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () async {
                  // image controller
                  ImagePicker imagePicker = ImagePicker();
                  XFile? countryImage =
                      await imagePicker.pickImage(source: ImageSource.gallery);
                  if (countryImage != null) {
                    // upload image to firebase
                    String uniqueFileName =
                        DateTime.now().millisecondsSinceEpoch.toString();

                    // root'tan referans
                    Reference referenceRoot = FirebaseStorage.instance.ref();
                    Reference referenceDirImages =
                        referenceRoot.child('countries');

                    // kaydedilen görselin referansı
                    Reference referenceImageToUpload =
                        referenceDirImages.child(uniqueFileName);

                    try {
                      await referenceImageToUpload
                          .putFile(File(countryImage.path));
                      String countryImageUrl =
                          await referenceImageToUpload.getDownloadURL();
                      setState(() {
                        countryImageUrl1 = countryImageUrl;
                      });
                    } catch (error) {}
                  } else {
                    String? imagePath = null;
                    print(imagePath);
                    print(countryImage!.path);
                    print(
                        "==================================================================");
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.camera_alt),
                    SizedBox(
                      width: 8,
                    ),
                    Text('Ülke Görseli'),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: TextField(
                  controller: countryName_controller,
                  decoration: InputDecoration(
                    label: Text("Ülke Adı"),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: Colors.grey,
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
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: TextField(
                  controller: countryEmoji_controller,
                  decoration: InputDecoration(
                    label: Text("Ülke Bayrağı Emojisi"),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: Colors.grey,
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
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: TextField(
                  controller: cousine_1_controller,
                  decoration: InputDecoration(
                    label: Text("Yemek 1"),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: Colors.grey,
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
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: TextField(
                  controller: cousine_2_controller,
                  decoration: InputDecoration(
                    label: Text("Yemek 2"),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: Colors.grey,
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
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: TextField(
                  controller: cousine_3_controller,
                  decoration: InputDecoration(
                    label: Text("Yemek 3"),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: Colors.grey,
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
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: TextField(
                  controller: cousine_4_controller,
                  decoration: InputDecoration(
                    label: Text("Yemek 4"),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: Colors.grey,
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
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
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
            "Lezzet Atlası",
            style: GoogleFonts.pacifico(fontSize: 27),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: openCountryBox,
          child: Icon(Icons.add),
        ),
        body: StreamBuilder(
            stream: firestoreService.getCountriesStream(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List countriesList = snapshot.data!.docs;

                return ListView.builder(
                  itemCount: countriesList.length,
                  itemBuilder: (context, index) {
                    // get each doc (ülke)
                    DocumentSnapshot document = countriesList[index];
                    String docID = document.id;

                    // get country from each doc
                    Map<String, dynamic> data =
                        document.data() as Map<String, dynamic>;
                    String countryName = data['ulkeAdi'];
                    String countryEmoji = data['ulkeEmoji'];
                    String cousine_1 = data['yemek1'];
                    String cousine_2 = data['yemek2'];
                    String cousine_3 = data['yemek3'];
                    String cousine_4 = data['yemek4'];
                    String countryImageUrl = data['imagePath'];

                    // display stuff
                    return ListTile(
                      title: CountryOverview(
                        imagePath: countryImageUrl,
                        ulkeAdi: countryName,
                        ulkeEmoji: countryEmoji,
                        yemek1: cousine_1,
                        yemek2: cousine_2,
                        yemek3: cousine_3,
                        yemek4: cousine_4,
                      ),
                    );
                  },
                );
              } else {
                return Text('Henüz ülke eklenmedi...');
              }
            }),
      ),
    );
  }
}
