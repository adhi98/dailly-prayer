import 'package:daily_prayers/presentation/dashboard/dashboard_page.dart';
import 'package:daily_prayers/presentation/detail/detail_ayat_kursi_page.dart';
import 'package:daily_prayers/presentation/detail/detail_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: DashboardPage.routeName,
      routes: {
        DashboardPage.routeName: (context) => const DashboardPage(),
        DetailPage.routeName: (context) {
          return DetailPage(
              type: ModalRoute.of(context)?.settings.arguments as String);
        },
        DetailAyatKursi.routeName: (context) => const DetailAyatKursi()
      },
    );
  }
}
