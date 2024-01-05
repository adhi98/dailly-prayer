class AyatKursiModel {
  final String tafsir;
  final String translation;
  final String arabic;
  final String latin;

  AyatKursiModel(
      {required this.tafsir,
      required this.translation,
      required this.arabic,
      required this.latin});

  factory AyatKursiModel.fromJson(Map<String, dynamic> json) {
    return AyatKursiModel(
      tafsir: json['data']['tafsir'],
      translation: json['data']['translation'],
      arabic: json['data']['arabic'],
      latin: json['data']['latin'],
    );
  }
}
