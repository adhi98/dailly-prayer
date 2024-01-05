import 'package:daily_prayers/presentation/detail/detail_ayat_kursi_page.dart';
import 'package:daily_prayers/presentation/detail/detail_page.dart';
import 'package:daily_prayers/presentation/widget/card_dashboard.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  static const routeName = '/dashboard_page';
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  String backgroundImg = 'assets/images/bgwhite2.jpg';
  Color textColor = Colors.black;

  void changeBackground() {
    if (backgroundImg == 'assets/images/bgwhite2.jpg') {
      setState(() {
        backgroundImg = 'assets/images/bg_black.jpg';
        textColor = Colors.white;
      });
    } else {
      setState(() {
        backgroundImg = 'assets/images/bgwhite2.jpg';
        textColor = Colors.black;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(backgroundImg), fit: BoxFit.cover)),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 90),
                CardDashboard(
                    title: 'Doa Doa Harian',
                    textColor: textColor,
                    bgImage: 'assets/images/praying.png',
                    ontap: () {
                      Navigator.pushNamed(context, DetailPage.routeName,
                          arguments: 'doa');
                    }),
                CardDashboard(
                    title: 'Bacaan Shalat',
                    bgImage: 'assets/images/shalat.png',
                    textColor: textColor,
                    ontap: () {
                      Navigator.pushNamed(context, DetailPage.routeName,
                          arguments: 'shalat');
                    }),
                CardDashboard(
                    title: 'Ayat Kursi',
                    bgImage: 'assets/images/al-quraan.png',
                    textColor: textColor,
                    ontap: () {
                      Navigator.pushNamed(context, DetailAyatKursi.routeName);
                    }),
                ElevatedButton(
                    style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Color(0xff0D1549))),
                    onPressed: () {
                      changeBackground();
                    },
                    child: const Text('Change Background',
                        style: TextStyle(color: Colors.white)))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
