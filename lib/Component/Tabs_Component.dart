import 'package:alquran/constants.dart';
import 'package:alquran/detail/detailSurah.dart';
import 'package:alquran/Component/apiData.dart';
import 'package:alquran/home/home_screen.dart';
import 'package:alquran/home/screen_Portrait/components/home_header.dart';
import 'package:alquran/model/controler.dart';
import 'package:alquran/model/controlerJuz.dart';
import 'package:alquran/size_config.dart';
import 'package:flutter/material.dart';

class TabSurah extends StatefulWidget {
  const TabSurah({
    Key? key,
    required this.onTaps,
    // required this.data,
  }) : super(key: key);
  final void Function(String, String) onTaps;
  @override
  _TabSurahState createState() => _TabSurahState();
}

class _TabSurahState extends State<TabSurah> {
  @override
  Widget build(BuildContext context) {
    dataSurahAsyncCall().whenComplete(() {
      setState(() {});
    });

    // return FutureBuilder(
    //   future: dataApi.readJsonSurah().then((value) => value.dataSurah),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return Center(
    //         child: CircularProgressIndicator(),
    //       );
    //     } else {
    //       print((snapshot.data as List).length);
    //       dataSurah = (snapshot.data! as List<Surah>);
    return FittedBox(
      child: Container(
        height: (SizeConfig.orientation == Orientation.landscape)
            ? heightfit(1750)
            : heightfit(SizeConfig.screenHeight! - 130),
        width: (SizeConfig.orientation == Orientation.landscape)
            ? 500
            : widthfit(500),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Heading(),
            Center(
              child: Text("Surah ",
                  style: TextStyle(
                      color: kColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
            ),
            SizedBox(
              height: heightfit(defaultPadding / 2),
            ),
            Divider(
              color: kTextColor.withOpacity(.2),
            ),
            Container(
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemCount: dataSurah.length,
                  itemBuilder: (context, index) {
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
                      child: ElevatedButton(
                        onPressed: () {
                          (SizeConfig.screenWidth! > 600)
                              ? widget.onTaps(index.toString(), "surah")
                              : Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                  return DetailSurah(
                                    index: index.toString(),
                                    typeTampilan: "surah",
                                  );
                                }));
                        },
                        style: ElevatedButton.styleFrom(
                            shadowColor: Colors.black45,
                            padding: EdgeInsets.all(1),
                            // padding: EdgeInsets.only(top: 60),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            elevation: 0,
                            primary: Colors.white),
                        child: ListTile(
                          leading: Container(
                            height: heightfit(70),
                            width: widthfit(20),
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
                                      child: Text((index + 1).toString(),
                                          style: TextStyle(
                                            fontSize: 12,
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "${dataSurah[index].title} ",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    TextSpan(
                                      text: "(${dataSurah[index].titleAr})",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                  style: TextStyle(color: kColor),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${dataSurah[index].place}",
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    "${dataSurah[index].type}",
                                    style: TextStyle(
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
  //   },
  // );
}
// }

class TabJuz extends StatefulWidget {
  const TabJuz({
    Key? key,
    required this.onTaps,
  }) : super(key: key);
  final void Function(String, String) onTaps;
  @override
  _TabJuzState createState() => _TabJuzState();
}

class _TabJuzState extends State<TabJuz> {
  @override
  Widget build(BuildContext context) {
    // return FutureBuilder(
    //   future: dataApi.readJsonJuz().then((value) => value.dataJuz),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return Center(
    //         child: CircularProgressIndicator(),
    //       );
    //     } else {
    //       print((snapshot.data as List).length);
    //       dataJuz = (snapshot.data! as List<JuzSurah>);
    dataJuzAsyncCall().whenComplete(() {
      setState(() {});
    });
    return FittedBox(
        child: Container(
      height: (SizeConfig.orientation == Orientation.landscape)
          ? heightfit(1750)
          : heightfit(SizeConfig.screenHeight! - 130),
      width: (SizeConfig.orientation == Orientation.landscape)
          ? 500
          : widthfit(500),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Heading(),
          Padding(
            padding: EdgeInsets.only(
                // horizontal: widthfit(defaultPadding / 3),
                top: heightfit(defaultPadding / 2)),
            child: Center(
              child: Text("Juz ",
                  style: TextStyle(
                      color: kColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
            ),
          ),
          SizedBox(
            height: heightfit(defaultPadding / 2),
          ),
          Divider(
            color: kTextColor.withOpacity(.2),
          ),
          ListView.builder(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: dataJuz.length,
              itemBuilder: (context, index) {
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
                  child: ElevatedButton(
                    onPressed: () {
                      (SizeConfig.screenWidth! > 600)
                          ? widget.onTaps(index.toString(), "juz")
                          : Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                              return DetailSurah(
                                index: index.toString(),
                                typeTampilan: "juz",
                              );
                            }));
                    },
                    style: ElevatedButton.styleFrom(
                        shadowColor: Colors.black45,
                        padding: EdgeInsets.all(1),
                        // padding: EdgeInsets.only(top: 60),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 0,
                        primary: Colors.white),
                    child: ListTile(
                      leading: Container(
                        height: heightfit(70),
                        width: widthfit(20),
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
                                  child: Text((index + 1).toString(),
                                      style: TextStyle(
                                        fontSize: 12,
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text:
                                      "Juz ${int.tryParse(dataJuz[index].index)} \n",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                TextSpan(
                                  text:
                                      "Ayat ${dataJuz[index].start.verse.replaceAll("verse_", "")} ${dataJuz[index].start.name} - ",
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      "Ayat ${dataJuz[index].end.verse.replaceAll("verse_", "")} ${dataJuz[index].end.name}",
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
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
              }),
        ],
      ),
    ));
  }
  //   },
  // );
}
// }
