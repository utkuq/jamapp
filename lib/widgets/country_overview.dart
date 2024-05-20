import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';

class CountryOverview extends StatelessWidget {
  final String imagePath;
  final GlobalKey<ExpansionTileCardState> cardA = GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardB = GlobalKey();
  final String ulkeAdi;
  final String ulkeEmoji;
  final String yemek1;
  final String yemek2;
  final String yemek3;
  final String yemek4;
  CountryOverview(
      {super.key,
      required this.imagePath,
      required this.ulkeAdi,
      required this.ulkeEmoji,
      required this.yemek1,
      required this.yemek2,
      required this.yemek3,
      required this.yemek4});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ÜLKE RESMİ
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
          width: MediaQuery.of(context).size.width,
          height: 180,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.6),
                offset: const Offset(
                  0.0,
                  10.0,
                ),
                blurRadius: 10.0,
                spreadRadius: -6.0,
              ),
            ],
            image: DecorationImage(
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.35),
                BlendMode.multiply,
              ),
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),

        // DETAYLAR
        ExpansionTileCard(
          key: cardB,
          leading: CircleAvatar(child: Text(ulkeEmoji)),
          title: Text(ulkeAdi),
          subtitle: const Text('En bilinen yemekleri için tıkla!'),
          children: [
            const Divider(
              thickness: 1.0,
              height: 1.0,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                top: 8.0,
                bottom: 10.0,
              ),
              child: Text(yemek1),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                top: 8.0,
                bottom: 10,
              ),
              child: Text(yemek2),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                top: 8.0,
                bottom: 10,
              ),
              child: Text(yemek3),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                top: 8.0,
                bottom: 10,
              ),
              child: Text(yemek4),
            ),
          ],
        ),
      ],
    );
  }
}
