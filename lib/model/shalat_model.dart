class ShalatModel {
  final String id;
  final String name;
  final String arabic;
  final String latin;
  final String terjemahan;

  ShalatModel(
      {required this.id,
      required this.name,
      required this.arabic,
      required this.latin,
      required this.terjemahan});

  factory ShalatModel.fromJson(Map<String, dynamic> json) {
    return ShalatModel(
        id: json['id'].toString(),
        name: json['name'],
        arabic: json['arabic'],
        latin: json['latin'],
        terjemahan: json['terjemahan']);
  }
}
