import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jamapp/widgets/country_image.dart';
import 'package:jamapp/widgets/splash_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // final user = FirebaseAuth.instance.currentUser!;

  // final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Future<List<Map<String, dynamic>>> getDocuments() async {
  //   CollectionReference collectionRef = _firestore.collection('countries');
  //   List<Map<String, dynamic>> documents = [];
  //   try {
  //     QuerySnapshot querySnapshot = await collectionRef.get();
  //     // Belgeleri döngü ile işle
  //     for (QueryDocumentSnapshot doc in querySnapshot.docs) {
  //       Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

  //       // Her belge için alanları spesifik değişkenlere ata
  //       var _ulkeAdi = data['ulkeAdi'];
  //       var _ulkeEmoji = data['ulkeEmoji'];
  //       var _yemek1 = data['yemek1'];
  //       var _yemek2 = data['yemek2'];
  //       var _yemek3 = data['yemek3'];
  //       var _yemek4 = data['yemek4'];
  //       var _imagePath = data['imagePath'];

  //       documents.add({
  //         'ulkeAdi': _ulkeAdi,
  //         'ulkeEmoji': _ulkeEmoji,
  //         'yemek1': _yemek1,
  //         'yemek2': _yemek2,
  //         'yemek3': _yemek3,
  //         'yemek4': _yemek4,
  //         'imagePath': _imagePath,
  //       });
  //     }
  //   } catch (e) {
  //     print('Hata: $e');
  //   }
  //   return documents;
  // }

  // // document id'ler
  // List<String> docIDs = [];

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
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // ==========================================================
                CountryImage(
                  thumbnailUrl: "assets/resimler/italya.jpg",
                ),
                SplashCard(
                  ulkeAdi: "İtalya",
                  ulkeEmoji: "🇮🇹",
                  yemek1:
                      "Pizza: İtalya'nın dünyaca ünlü yemeği. En klasik hali olan Margherita, domates, mozzarella peyniri ve taze fesleğen ile yapılır.",
                  yemek2:
                      "Makarna: Çeşitli makarna türleri ve sosları ile İtalya mutfağının temel taşlarından biridir.",
                  yemek3:
                      "Risotto: Kremsi bir yapıya sahip, genellikle sebze, et veya deniz ürünleri ile zenginleştirilmiş İtalyan pirinç yemeğidir",
                  yemek4:
                      "Tiramisu: İtalyan mutfağının en ünlü tatlılarından biridir. Mascarpone peyniri, kahve, kakao ve bisküvi katmanlarından oluşur.",
                ),
                SizedBox(
                  height: 20,
                ),
                CountryImage(thumbnailUrl: "assets/resimler/avusturya.png"),
                SplashCard(
                  ulkeAdi: "Avusturya",
                  ulkeEmoji: "🇦🇹",
                  yemek1:
                      "Wiener Schnitzel: Avusturya'nın en ünlü yemeği olan Wiener Schnitzel, ince dövülmüş dana etinin pane edilerek kızartılmasıyla hazırlanır. Genellikle limon dilimi ve patates salatası ile servis edilir.",
                  yemek2:
                      "Tafelspitz: Bu yemek, haşlanmış dana eti ve çeşitli sebzelerden oluşur. Genellikle elma yahnisi ve frenk turpu ile servis edilir.",
                  yemek3:
                      "Apfelstrudel: İnce yufkadan yapılmış elmalı strudel, tarçın, şeker ve bazen kuru üzümle doldurulur. Üzerine pudra şekeri serpilir ve genellikle vanilyalı dondurma veya krem şanti ile servis edilir.",
                  yemek4:
                      "Gulasch: Macar mutfağından etkilenen bu yemek, et, soğan, kırmızı biber ve diğer baharatlarla yapılan doyurucu bir yahni türüdür.",
                ),
                SizedBox(
                  height: 20,
                ),
                CountryImage(thumbnailUrl: "assets/resimler/fransa.jpg"),
                SplashCard(
                  ulkeAdi: "Fransa",
                  ulkeEmoji: "🇫🇷",
                  yemek1:
                      "Croissant: Fransız kahvaltılarının vazgeçilmezi olan bu tereyağlı ve kat kat hamurdan yapılan kruvasan, çıtır ve lezzetli bir hamur işidir.",
                  yemek2:
                      "Coq au Vin: Tavuk etinin kırmızı şarap, mantar, soğan, sarımsak ve domuz pastırması ile pişirilmesiyle yapılan bu yemek, Fransız mutfağının klasiklerinden biridir.",
                  yemek3:
                      "Bouillabaisse: Provence bölgesine özgü olan bu balık çorbası, çeşitli balıklar, deniz ürünleri, safran ve baharatlarla yapılır. Genellikle rouille sosu ve kruton ile servis edilir.",
                  yemek4:
                      "Ratatouille: Patlıcan, kabak, biber, domates, soğan ve sarımsak gibi sebzelerle yapılan bir tür sebze güveçtir. Özellikle Provence mutfağının bir parçasıdır.",
                ),
                SizedBox(
                  height: 20,
                ),
                CountryImage(thumbnailUrl: "assets/resimler/turkiye.jpg"),
                SplashCard(
                  ulkeAdi: "Türkiye",
                  ulkeEmoji: "🇹🇷",
                  yemek1:
                      "Kebaplar: Türk mutfağının en bilinen yemeklerinden biridir. Adana kebap, Urfa kebap, İskender kebap, şiş kebap gibi birçok çeşidi vardır. Genellikle etin baharatlarla marine edilip ızgarada pişirilmesiyle yapılır.",
                  yemek2:
                      "Dolma ve Sarma: Sebzelerin veya asma yaprağının içine pirinç, kıyma, soğan ve baharatlarla hazırlanan harcın doldurulmasıyla yapılan yemeklerdir. Biber dolması, patlıcan dolması ve yaprak sarma en bilinen çeşitlerindendir.",
                  yemek3:
                      "Baklava: İnce yufka katmanlarının arasına ceviz, fındık veya antep fıstığı konulup şerbetle tatlandırılan geleneksel bir tatlıdır. Türkiye'nin en bilinen tatlılarından biridir",
                  yemek4:
                      "Lahmacun: İnce hamurun üzerine kıyma, soğan, domates ve baharat karışımı sürülerek taş fırında pişirilen bir tür Türk pizzasıdır. Genellikle limon ve maydanoz ile servis edilir",
                ),
                SizedBox(
                  height: 20,
                ),
                CountryImage(thumbnailUrl: "assets/resimler/japonya.jpg"),
                SplashCard(
                  ulkeAdi: "Japonya",
                  ulkeEmoji: "🇯🇵",
                  yemek1:
                      "Sushi: Japon mutfağının en bilinen yemeklerinden biridir. Çeşitli malzemelerle yapılan, özellikle çiğ balık ve deniz ürünleri ile hazırlanan, sirkeli pirinç kullanılarak yapılan bir yemektir. Nigiri, maki, sashimi gibi çeşitleri vardır.",
                  yemek2:
                      "Ramen: Çin kökenli bir yemektir ancak Japonya'da oldukça popülerdir. Buğday unundan yapılan erişteler, et veya deniz ürünleri bazlı bir et suyu içinde servis edilir. Üzerine genellikle dilimlenmiş et, deniz yosunu, soya sosu ve yeşil soğan gibi malzemeler eklenir.",
                  yemek3:
                      "Tempura: Deniz ürünleri ve sebzelerin hafif bir hamura batırılarak kızartılması ile yapılan bir yemektir. Tempura, genellikle sıcak bir şekilde servis edilir ve yanında genellikle dipping sosu ile sunulur.",
                  yemek4:
                      "Takoyaki: Küçük, yuvarlak ve içi ahtapot parçaları ile dolu olan hamur toplarıdır. Üzerine takoyaki sosu, mayonez, yeşil soğan ve bonito (kurutulmuş balık) parçaları serpilir.",
                ),
                SizedBox(
                  height: 20,
                ),
                CountryImage(thumbnailUrl: "assets/resimler/hindistan.jpg"),
                SplashCard(
                  ulkeAdi: "Hindistan",
                  ulkeEmoji: "🇮🇳",
                  yemek1:
                      "Biryani: Biryani, pirinç, et (tavuk, kuzu veya keçi), baharatlar, soğan ve bazen sebzelerin bir araya getirilmesiyle yapılan, zengin ve aromatik bir pilav yemeğidir.",
                  yemek2:
                      "Butter Chicken (Tavuk Masala): Tavuk parçalarının tereyağı, krema, domates sosu ve baharatlarla pişirilip servis edildiği nefis bir yemektir.",
                  yemek3:
                      "Tandoori Tavuk: Tandoori tavuk, hint baharatları ve yoğurt ile marine edilmiş, ardından tandırda pişirilmiş tavuktur. Hint mutfağının en ünlü lezzetlerinden biridir.",
                  yemek4:
                      "Dal Tadka: Bujet mercimek veya sarı mercimekten yapılan ve tadını veren baharatlar ve yağda kavrulmuş sarımsak ile birleştirilen bir çeşit mercimek yemeğidir.",
                ),
                SizedBox(
                  height: 20,
                ),
                CountryImage(thumbnailUrl: "assets/resimler/meksika.jpg"),
                SplashCard(
                  ulkeAdi: "Meksika",
                  ulkeEmoji: "🇲🇽",
                  yemek1:
                      "Taco:Meksika'nın en ikonik yiyeceklerinden biridir. Taco, mısır veya buğday tortillası ile doldurulmuş bir çeşit dolgudur. Dolgu genellikle biftek, tavuk, domuz eti veya sebzeler olabilir ve ardından salsa, guacamole, peynir ve marul gibi garnitürlerle servis edilir.",
                  yemek2:
                      "Burrito: Genellikle büyük bir un tortillasına sarılmış bir yemektir. Burrito, içinde et (biftek, tavuk veya domuz eti), pirinç, fasulye, sebzeler, peynir ve bazen salsa veya guacamole gibi ek malzemeler içerir.",
                  yemek3:
                      "Fajita: Genellikle biftek, tavuk veya karidesle yapılan bir yemektir. Dilimlenmiş et ve sebzeler, genellikle sıcak bir tavada servis edilir ve tortillas ile sarılarak yenir. Üzerine salsa, peynir, krema ve guacamole gibi garnitürler eklenir.",
                  yemek4:
                      "Quesadilla: İki mısır veya buğday tortillası arasına peynir, et veya sebzeler konularak yapılır ve daha sonra tavada kızartılır. Genellikle salsa ve guacamole ile servis edilir.",
                ),
                SizedBox(
                  height: 20,
                ),
                CountryImage(thumbnailUrl: "assets/resimler/lubnan.jpg"),
                SplashCard(
                  ulkeAdi: "Lübnan",
                  ulkeEmoji: "🇱🇧",
                  yemek1:
                      "Hummus: Nohut, tahin, limon suyu, sarımsak ve zeytinyağı ile yapılan bu ezme, Lübnan mutfağının en bilinen mezesidir. Genellikle pide ekmeği ile servis edilir",
                  yemek2:
                      "Tabbouleh: İnce bulgur, maydanoz, nane, domates, soğan, limon suyu ve zeytinyağı ile yapılan bir salatadır. Hafif ve ferahlatıcı bir lezzete sahiptir.",
                  yemek3:
                      "Falafel: Nohut veya bakla, soğan, sarımsak ve baharatlarla yapılan ve derin yağda kızartılan küçük köftelerdir. Genellikle tahin sosu ve salata ile servis edilir.",
                  yemek4:
                      "Shawarma: İnce dilimlenmiş etin (genellikle kuzu veya tavuk) baharatlarla marine edilip dikey bir döner ocağında pişirilmesiyle yapılan bir yemektir. Lavaş ekmeği içinde sebzeler ve soslarla birlikte servis edilir.",
                ),
                SizedBox(
                  height: 20,
                ),
                CountryImage(thumbnailUrl: "assets/resimler/gurcistan.jpg"),
                SplashCard(
                  ulkeAdi: "Gürcistan",
                  ulkeEmoji: "🇬🇪",
                  yemek1:
                      "Haçapuri (Khachapuri): Peynirle doldurulmuş geleneksel bir ekmek türüdür. Çeşitleri arasında Adjaruli (açık kayık şeklinde, üzerine yumurta kırılarak servis edilen) ve Imeruli (kapalı ve yuvarlak) haçapuri bulunur.",
                  yemek2:
                      "Hinkali (Khinkali): Baharatlı et veya sebze dolgulu büyük mantılardır. Genellikle sıcak ve sos olmadan servis edilir.",
                  yemek3:
                      "Çakapuli (Chakapuli): Genellikle ilkbaharda yapılan, kuzu eti veya dana eti, taze erik, yeşil otlar ve beyaz şarapla hazırlanan bir tür et yemeğidir.",
                  yemek4:
                      "4.	Badrijani Nigvzit: Cevizle doldurulmuş patlıcan rulolarıdır. Genellikle nar taneleri ile süslenir ve soğuk olarak servis edilir.",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
