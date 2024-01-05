import 'dart:convert';

import 'package:daily_prayers/model/ayat_kursi_model.dart';
import 'package:daily_prayers/presentation/widget/header_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DetailAyatKursi extends StatelessWidget {
  static const routeName = 'detail_ayat_kursi_page';
  const DetailAyatKursi({super.key});

  Future<AyatKursiModel?> readJson() async {
    try {
      final String jsonString =
          await rootBundle.loadString('assets/json/ayat_kursi.json');

      final Map<String, dynamic> parsedJson = json.decode(jsonString);
      final quraanVerse = AyatKursiModel.fromJson(parsedJson);
      return quraanVerse;
    } catch (e) {
      debugPrint('$e');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: readJson(),
      builder: (context, snapshoot) {
        if (snapshoot.hasData) {
          return Scaffold(
            backgroundColor: const Color(0xff44ACA1),
            body: SafeArea(
                child: Column(
              children: [
                const HeaderDashboard(
                    title: 'Ayat Kursi',
                    subtitle: "Bacaan Ayat Kursi dengan tafsirmya",
                    img: 'assets/images/bg_quran.jpg'),
                Expanded(
                    child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        Text(
                          snapshoot.data!.arabic,
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          snapshoot.data!.latin,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Terjemahan : ${snapshoot.data!.translation}',
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ),
                ))
              ],
            )),
            floatingActionButton: FloatingActionButton(
              backgroundColor: const Color(0xff0D1549),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)),
                        child: Column(
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Colors.grey, width: 1))),
                              width: double.infinity,
                              padding: const EdgeInsets.all(15),
                              child: const Text('Tafsir Ayat Kursi: ',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
                                  )),
                            ),
                            Expanded(
                              child: SingleChildScrollView(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20, bottom: 5, top: 5),
                                  child: Text(
                                    snapshoot.data!.tafsir,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    'Tutup',
                                    style: TextStyle(color: Colors.black),
                                  )),
                            )
                          ],
                        ),
                      );
                    });
              },
              child: const Text(
                'Tafsir',
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
