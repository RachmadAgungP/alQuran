import 'dart:convert';

import 'package:alquran/model/controler.dart';
import 'package:alquran/model/controlerAyat.dart';
import 'package:alquran/model/controlerJuz.dart';
import 'package:flutter/services.dart';

class DataAyat {
  List<Ayat> dataAyat;

  DataAyat(this.dataAyat);
}

class DataSurah {
  List<Surah> dataSurah;

  DataSurah(this.dataSurah);
}

class DataJuz {
  List<JuzSurah> dataJuz;

  DataJuz(this.dataJuz);
}

class DataApi {
  Future<DataSurah> readJsonSurah() async {
    final String response =
        await rootBundle.loadString('assets/data/surah.json');
    final datasurah = await json.decode(response) as List;

    List<Surah> dataSurat = [
      for (var i = 0; i < datasurah.length; i++)
        Surah(
            place: datasurah[i]["place"],
            type: datasurah[i]["type"],
            count: datasurah[i]["count"],
            title: datasurah[i]["title"],
            titleAr: datasurah[i]["titleAr"],
            index: datasurah[i]["index"],
            pages: datasurah[i]["pages"],
            juz: <Juz>[
              for (var y = 0; y < datasurah[i]["juz"].length; y++)
                Juz(
                    index: int.tryParse(
                        List.from(datasurah[i]["juz"])[y]["index"])!,
                    verse: Verse(
                        start: List.from(datasurah[i]["juz"])[y]["verse"]
                                ["start"]
                            .toString(),
                        end: List.from(datasurah[i]["juz"])[y]["verse"]["end"]
                            .toString()))
            ])
    ];

    return DataSurah(dataSurat);
  }

  Future<DataJuz> readJsonJuz() async {
    final String response = await rootBundle.loadString('assets/data/juz.json');
    final datajuz = await json.decode(response) as List;

    // JuzSurah dataJuz = JuzSurah.fromJson(datajuz);
    List<JuzSurah> dataJuz = [
      for (var i = 0; i < datajuz.length; i++)
        JuzSurah(
          datajuz[i]["index"],
          Start(
              Map.from(datajuz[i]["start"])["index"].toString(),
              Map.from(datajuz[i]["start"])["verse"].toString(),
              Map.from(datajuz[i]["start"])["name"].toString()),
          Start(
              Map.from(datajuz[i]["end"])["index"].toString(),
              Map.from(datajuz[i]["end"])["verse"].toString(),
              Map.from(datajuz[i]["end"])["name"].toString()),
        )
    ];

    return DataJuz(dataJuz);
    // ...
  }

  Future<DataAyat> readJsonAyat() async {
    final String response =
        await rootBundle.loadString('assets/data/Ayat.json');
    final dataayat = await json.decode(response) as List;

    // JuzSurah dataJuz = JuzSurah.fromJson(datajuz);
    List<Ayat> dataAyat = [
      for (var i = 0; i < dataayat.length; i++)
        Ayat(
            index: dataayat[i]["index"],
            name: dataayat[i]["name"],
            verse: dataayat[i]["verse"] as Map<String, dynamic>,
            count: dataayat[i]["count"],
            juz: dataayat[i]["juz"])
    ];

    return DataAyat(dataAyat);
    // ...
  }
}

var data;
var initialFutureData;
DataApi dataApi = DataApi();
Future dataSurahAsyncCall() async {
  dataSurah = await dataApi.readJsonSurah().then((value) => value.dataSurah);
}

Future dataAyatAsyncCall() async {
  dataAyat = await dataApi.readJsonAyat().then((value) => value.dataAyat);
}

Future dataJuzAsyncCall() async {
  dataJuz = await dataApi.readJsonJuz().then((value) => value.dataJuz);
}
