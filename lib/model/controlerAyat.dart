List<Ayat> dataAyat = [];

class Ayat {
  String index;
  String name;
  Map<String, dynamic> verse;
  int count;
  List<dynamic> juz;

  Ayat(
      {required this.index,
      required this.name,
      required this.verse,
      required this.count,
      required this.juz});
}
