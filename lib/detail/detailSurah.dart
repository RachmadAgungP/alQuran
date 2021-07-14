import 'package:alquran/constants.dart';
import 'package:alquran/detail/component/component.dart';
import 'package:alquran/Component/apiData.dart';
import 'package:alquran/home/components/card_Header.dart';
import 'package:alquran/home/screen_Portrait/components/home_header.dart';
import 'package:alquran/model/controler.dart';
import 'package:alquran/model/controlerAyat.dart';
import 'package:alquran/model/controlerJuz.dart';

import 'package:alquran/size_config.dart';
import 'package:flutter/material.dart';

class DetailSurah extends StatefulWidget {
  const DetailSurah({Key? key, required this.index, required this.typeTampilan})
      : super(key: key);
  final String index;
  final String typeTampilan;
  @override
  _DetailSurahState createState() => _DetailSurahState();
}

class _DetailSurahState extends State<DetailSurah> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      extendBodyBehindAppBar: (SizeConfig.screenWidth! > 600) ? false : true,
      appBar: AppBar(
        toolbarHeight: heightfit(50),
        // backgroundColor: Colors.transparent,
        backgroundColor: kColor,
        elevation: 0,
        // title: Text("Title"),
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
          return WideLayout(
            index: widget.index,
            typeTampilan: widget.typeTampilan,
          );
        } else {
          return NarrowLayout(
              index: widget.index, typeTampilan: widget.typeTampilan);
        }
      }),
    );
  }
}

class WideLayout extends StatelessWidget {
  const WideLayout({Key? key, required this.index, required this.typeTampilan})
      : super(key: key);
  final String index;
  final String typeTampilan;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: TabSurahs(
        index: index,
        typeTampilan: typeTampilan,
      ),
    );
    ;
    // BackgraundHomeR();
  }
}

class NarrowLayout extends StatelessWidget {
  const NarrowLayout(
      {Key? key, required this.index, required this.typeTampilan})
      : super(key: key);
  final String index;
  final String typeTampilan;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: TabSurahs(
        index: index,
        typeTampilan: typeTampilan,
      ),
    );
    ;
  }
}

class TabSurahs extends StatefulWidget {
  final String index;
  final String typeTampilan;
  TabSurahs({
    Key? key,
    required this.index,
    required this.typeTampilan,
    // required this.data,
  }) : super(key: key);

  @override
  _TabSurahsState createState() => _TabSurahsState();
}

class _TabSurahsState extends State<TabSurahs> {
  DataApi dataApi = DataApi();
  @override
  Widget build(BuildContext context) {
    // print(" ${int.tryParse(widget.index)!}");
    // print(" ${juzSpesific(int.tryParse(widget.index)!)}");

    // print(
    //     " ${juzSpesific(int.tryParse(widget.index)!).indexOf(int.tryParse(widget.index)! + 1)}");
    // print("Start ${panjangDataStart(int.tryParse(widget.index)!)}");
    return Container(
      height: SizeConfig.screenHeight!,
      width: SizeConfig.screenWidth!,
      child: SingleChildScrollView(
        child: Stack(
          children: [
            Container(height: heightfit(350), child: BackgraundHome()),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: heightfit(90)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: heightfit(50),
                        child: FittedBox(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: defaultPadding),
                            child: (widget.typeTampilan == "surah")
                                ? RichText(
                                    text: TextSpan(
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                        children: [
                                        TextSpan(
                                            text:
                                                "Surah ${dataSurah[int.tryParse(widget.index)!].title} ",
                                            style: TextStyle(fontSize: 24)),
                                        TextSpan(
                                            text:
                                                "(${dataSurah[int.tryParse(widget.index)!].titleAr})\n",
                                            style: TextStyle(fontSize: 20)),
                                        TextSpan(
                                            text:
                                                "${dataSurah[int.tryParse(widget.index)!].place} - ${dataSurah[int.tryParse(widget.index)!].type}",
                                            style: TextStyle(fontSize: 16))
                                      ]))
                                : RichText(
                                    text: TextSpan(
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                        children: [
                                        TextSpan(
                                            text:
                                                "Juz ${int.tryParse(dataJuz[int.tryParse(widget.index)!].index)} \n",
                                            style: TextStyle(fontSize: 24)),
                                        TextSpan(
                                          text:
                                              "Ayat ${dataJuz[int.tryParse(widget.index)!].start.verse.replaceAll("verse_", "")} ${dataJuz[int.tryParse(widget.index)!].start.name} - ",
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                        TextSpan(
                                          text:
                                              "Ayat ${dataJuz[int.tryParse(widget.index)!].end.verse.replaceAll("verse_", "")} ${dataJuz[int.tryParse(widget.index)!].end.name}",
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ])),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: heightfit(defaultPadding / 2),
                      ),
                      Container(
                        height: heightfit(200),
                        width: SizeConfig.screenWidth,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: widthfit(defaultPadding),
                              vertical: heightfit(defaultPadding)),
                          child: FittedBox(
                            child: CardFitursButtons(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      // horizontal: widthfit(defaultPadding / 3),
                      top: heightfit(defaultPadding / 2)),
                  child: Center(
                    child: Column(
                      children: [
                        Text("بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ",
                            style: TextStyle(
                                color: kColor,
                                fontSize: 30,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: heightfit(defaultPadding / 2),
                ),
                Divider(
                  color: kTextColor.withOpacity(.2),
                ),
                Center(
                  child: Column(
                    children: (widget.typeTampilan == "surah")
                        ? listSurahs(int.tryParse(widget.index)!)
                        : [
                            (dataJuz[int.tryParse(widget.index)!].start.index ==
                                    dataJuz[int.tryParse(widget.index)!]
                                        .end
                                        .index)
                                ? Column(
                                    children: [
                                      CardListTile(
                                        title:
                                            " Ayat ${dariAyat(int.tryParse(widget.index)!)}  ${dataJuz[int.tryParse(widget.index)!].start.name}",
                                        penjelas: "",
                                        textAligns: TextAlign.left,
                                        index: "",
                                      ),
                                      Column(
                                          children: listJuzStart(
                                              int.tryParse(widget.index)!,
                                              panjangDataStart(
                                                  int.tryParse(widget.index)!),
                                              getDataStart(int.tryParse(
                                                  widget.index)!))),
                                    ],
                                  )
                                : Column(
                                    children: [
                                      CardListTile(
                                        title:
                                            " Ayat ${dariAyat(int.tryParse(widget.index)!)} - Ayat ${(int.tryParse(dariAyat(int.tryParse(widget.index)!))! + panjangDataStart(int.tryParse(widget.index)!)) - 1}  ${dataJuz[int.tryParse(widget.index)!].start.name}",
                                        penjelas: "",
                                        textAligns: TextAlign.left,
                                        index: "",
                                      ),
                                      Column(
                                          children: listJuzStart(
                                              int.tryParse(widget.index)!,
                                              panjangDataStart(
                                                  int.tryParse(widget.index)!),
                                              getDataStart(int.tryParse(
                                                  widget.index)!))),
                                      CardListTile(
                                        title:
                                            " Ayat ${dariAyat(int.tryParse(widget.index)!)} - Ayat ${(int.tryParse(dariAyat(int.tryParse(widget.index)!))! + panjangDataEnd(int.tryParse(widget.index)!)) - 1} ${dataJuz[int.tryParse(widget.index)!].end.name}",
                                        penjelas: "",
                                        textAligns: TextAlign.left,
                                        index: "",
                                      ),
                                      Column(
                                          children: listJuzStart(
                                              int.tryParse(widget.index)!,
                                              panjangDataEnd(
                                                  int.tryParse(widget.index)!),
                                              getDataEnd(
                                                  int.tryParse(widget.index)!)))
                                    ],
                                  )
                          ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> listSurahs(int index) =>
      List.generate(dataAyat[index].verse.length, (indexs) {
        return CardListTile(
          title: (dataAyat[index].verse.values).toList()[indexs],
          penjelas: "",
          textAligns: TextAlign.right,
          index: indexs.toString(),
        );
      });

  List<Widget> listJuzStart(int index, int panjangData, List data) =>
      List.generate(panjangData, (indexs) {
        int ind = 0;
        return CardListTile(
          title: data[indexs],
          penjelas: "",
          textAligns: TextAlign.right,
          index: (indexs > panjangDataStart(index))
              ? ((indexs - panjangDataStart(index))).toString()
              : "${int.tryParse(dariAyat(index))! + (indexs)} ",
        );
      });
}

class CardListTile extends StatelessWidget {
  const CardListTile({
    Key? key,
    required this.title,
    required this.penjelas,
    required this.index,
    required this.textAligns,
  }) : super(key: key);
  final String title;
  final String penjelas;
  final String index;
  final TextAlign textAligns;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: widthfit(defaultPadding),
          vertical: heightfit(defaultPadding / 2)),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              blurRadius: 10,
              offset: Offset(5, 5),
              color: kColor.withOpacity(.2))
        ],
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: ListTile(
        leading: Container(
          height: heightfit(70),
          width: widthfit(70),
          child: FittedBox(
            child: Container(
              height: 50,
              width: 50,
              child: Stack(
                children: [
                  Center(
                    child: Icon(
                      Icons.brightness_5_outlined,
                      size: 50,
                      color: kPrimaryColor,
                    ),
                  ),
                  Center(
                    child: Container(
                      height: 25,
                      width: 25,
                      color: Colors.white,
                    ),
                  ),
                  Center(
                    child: Text(index,
                        style: TextStyle(
                          fontSize: 12,
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
        title: Padding(
          padding: EdgeInsets.only(
              // left: widthfit(defaultPadding * 2),
              top: heightfit(defaultPadding / 2)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              RichText(
                textAlign: textAligns,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "${title}",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: "${penjelas}",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                  style: TextStyle(color: kColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
