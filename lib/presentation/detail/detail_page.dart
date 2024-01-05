import 'dart:convert';

import 'package:daily_prayers/model/shalat_model.dart';
import 'package:daily_prayers/presentation/widget/card_doa.dart';
import 'package:daily_prayers/presentation/widget/header_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DetailPage extends StatelessWidget {
  final String type;
  static const routeName = 'detail_page';
  const DetailPage({super.key, required this.type});

  Future<List<ShalatModel>> readJson() async {
    try {
      final String jsonString = await rootBundle.loadString(type == 'shalat'
          ? 'assets/json/shalat_prayer.json'
          : 'assets/json/daily_prayer.json');
      final jsonArray = json.decode(jsonString) as List<dynamic>;
      return jsonArray.map((e) => ShalatModel.fromJson(e)).toList();
    } catch (e) {
      debugPrint('$e');
    }
    return [];
  }

  // @override
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: readJson(),
      builder: (context, snapshoot) {
        if (snapshoot.hasData) {
          return Scaffold(
            backgroundColor: type == 'shalat'
                ? const Color(0xff0D1549)
                : const Color(0xff3CA1A2),
            body: SafeArea(
                child: Column(
              children: [
                HeaderDashboard(
                    title: type == 'shalat'
                        ? "Bacaan Shalat"
                        : "Bacaan Doa Sehari-hari",
                    subtitle: type == 'shalat'
                        ? "Bacaan Shalat dari doa iftitah sampai salam"
                        : "Kumpulan Bacaan Doa Sehari-hari",
                    img: type == 'shalat'
                        ? "assets/images/bg_shalat.png"
                        : "assets/images/bg_doa.png"),
                Expanded(
                    child: ListView.builder(
                        itemCount: snapshoot.data!.length,
                        itemBuilder: (context, index) {
                          final prayer = snapshoot.data![index];
                          return CardDoa(
                              title: prayer.name,
                              arabic: prayer.arabic,
                              latin: prayer.latin,
                              translation: prayer.terjemahan);
                        }))
              ],
            )),
            // floatingActionButton: FloatingActionButton.extended(
            //   backgroundColor: const Color(0xff3CA1A2),
            //   onPressed: () {},
            //   label: const Text(
            //     'Referensi',
            //     style: TextStyle(color: Colors.white),
            //   ),
            // ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
