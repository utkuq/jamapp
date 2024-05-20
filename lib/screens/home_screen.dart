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
        body: SingleChildScrollView(
          child: Column(
            children: [
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
            ],
          ),
        ),
      ),
    );
  }
}
