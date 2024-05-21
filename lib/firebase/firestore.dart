import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  // get collection of notes
  final CollectionReference countries =
      FirebaseFirestore.instance.collection('countries');

  // create
  Future<void> addCountry(
    String countryImageUrl,
    String countryName,
    String countryEmoji,
    String cousine_1,
    String cousine_2,
    String cousine_3,
    String cousine_4,
  ) {
    return countries.add({
      'ulkeAdi': countryName,
      'ulkeEmoji': countryEmoji,
      'yemek1': cousine_1,
      'yemek2': cousine_2,
      'yemek3': cousine_3,
      'yemek4': cousine_4,
      'timestamp': Timestamp.now(),
      'imagePath': countryImageUrl,
    });
  }

  // read
  Stream<QuerySnapshot> getCountriesStream() {
    final countriesStream = countries
        .orderBy(
          'timestamp',
          descending: true,
        )
        .snapshots();
    return countriesStream;
  }

  // update

  // delete
}
