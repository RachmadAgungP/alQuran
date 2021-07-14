import 'dart:ffi';

import 'package:alquran/detail/detailSurah.dart';
import 'package:alquran/model/controler.dart';
import 'package:alquran/model/controlerAyat.dart';
import 'package:alquran/model/controlerJuz.dart';

List<int> juzSpesific(indexs) {
  return dataSurah[int.tryParse(dataJuz[indexs].start.index)! - 1]
      .juz
      .map((e) => e.index)
      .toList() as List<int>;
}

List<int> juzSpesificEnd(indexs) {
  return dataSurah[int.tryParse(dataJuz[indexs].end.index)! - 1]
      .juz
      .map((e) => e.index)
      .toList() as List<int>;
}

int panjangDataStart(int index) {
  int indexjuz = juzSpesific(index).indexOf(index + 1);
  // print(
  //     "Start=== surah ${dataSurah[(int.tryParse(dataJuz[index].end.index)! - 1)].title}");
  // print("list ${juzSpesific(index)}");
  // print(
  //     "indexJuz ${dataSurah[(int.tryParse(dataJuz[index].start.index)! - 1)].juz[indexjuz].index}");
  // print(
  //     "dari index ${int.tryParse(dataSurah[(int.tryParse(dataJuz[index].start.index)! - 1)].juz[indexjuz].verse.start.replaceAll("verse_", ""))! - 1}");
  // print(
  //     "sampai index ${int.tryParse(dataSurah[(int.tryParse(dataJuz[index].start.index)! - 1)].juz[indexjuz].verse.end.replaceAll("verse_", ""))! - 1}");
  return dataAyat[(int.tryParse(dataJuz[index].start.index)! - 1)]
      .verse
      .keys
      .toList()
      .getRange(
          int.tryParse(
                  dataSurah[(int.tryParse(dataJuz[index].start.index)! - 1)]
                      .juz[indexjuz]
                      .verse
                      .start
                      .replaceAll("verse_", ""))! -
              1,
          int.tryParse(
              dataSurah[(int.tryParse(dataJuz[index].start.index)! - 1)]
                  .juz[indexjuz]
                  .verse
                  .end
                  .replaceAll("verse_", ""))!)
      .toList()
      .length;
}

int panjangDataEnd(int index) {
  int indexjuz = juzSpesificEnd(index).indexOf(index + 1);
  // print(
  //     "End==== surah ${dataSurah[(int.tryParse(dataJuz[index].end.index)! - 1)].title}");
  // print("list ${juzSpesific(index)}");
  // print(
  //     "indexJuz ${dataSurah[(int.tryParse(dataJuz[index].end.index)! - 1)].juz[indexjuz].index}");
  // print(
  //     "dari index ${int.tryParse(dataSurah[(int.tryParse(dataJuz[index].end.index)! - 1)].juz[indexjuz].verse.start.replaceAll("verse_", ""))! - 1}");
  // print(
  //     "sampai index ${int.tryParse(dataSurah[(int.tryParse(dataJuz[index].end.index)! - 1)].juz[indexjuz].verse.end.replaceAll("verse_", ""))! - 1}");
  return dataAyat[(int.tryParse(dataJuz[index].end.index)! - 1)]
      .verse
      .keys
      .toList()
      .getRange(
          int.tryParse(dataSurah[(int.tryParse(dataJuz[index].end.index)! - 1)]
                  .juz[indexjuz]
                  .verse
                  .start
                  .replaceAll("verse_", ""))! -
              1,
          int.tryParse(dataSurah[(int.tryParse(dataJuz[index].end.index)! - 1)]
              .juz[indexjuz]
              .verse
              .end
              .replaceAll("verse_", ""))!)
      .toList()
      .length;
}

List<dynamic> getDataStart(int index) {
  int indexjuz = juzSpesific(index).indexOf(index + 1);
  return dataAyat[(int.tryParse(dataJuz[index].start.index)! - 1)]
      .verse
      .values
      .toList()
      .getRange(
          int.tryParse(
                  dataSurah[(int.tryParse(dataJuz[index].start.index)! - 1)]
                      .juz[indexjuz]
                      .verse
                      .start
                      .replaceAll("verse_", ""))! -
              1,
          int.tryParse(
              dataSurah[(int.tryParse(dataJuz[index].start.index)! - 1)]
                  .juz[indexjuz]
                  .verse
                  .end
                  .replaceAll("verse_", ""))!)
      .toList();
}

List<dynamic> getDataEnd(int index) {
  int indexjuz = juzSpesificEnd(index).indexOf(index + 1);
  return dataAyat[(int.tryParse(dataJuz[index].end.index)! - 1)]
      .verse
      .values
      .toList()
      .getRange(
          int.tryParse(dataSurah[(int.tryParse(dataJuz[index].end.index)! - 1)]
                  .juz[indexjuz]
                  .verse
                  .start
                  .replaceAll("verse_", ""))! -
              1,
          int.tryParse(dataSurah[(int.tryParse(dataJuz[index].end.index)! - 1)]
              .juz[indexjuz]
              .verse
              .end
              .replaceAll("verse_", ""))!)
      .toList();
}

String dariAyat(int index) {
  int indexjuz = juzSpesific(index).indexOf(index + 1);
  return (int.tryParse(
          dataSurah[(int.tryParse(dataJuz[index].start.index)! - 1)]
              .juz[indexjuz]
              .verse
              .start
              .replaceAll("verse_", ""))!)
      .toString();
}

String sampaiAyat(int index) {
  int indexjuz = juzSpesificEnd(index).indexOf(index + 1);
  return (int.tryParse(dataSurah[(int.tryParse(dataJuz[index].end.index)! - 1)]
          .juz[indexjuz]
          .verse
          .end
          .replaceAll("verse_", ""))!)
      .toString();
}
