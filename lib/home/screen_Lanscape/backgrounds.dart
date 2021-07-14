import 'package:alquran/home/screen_Lanscape/left_content.dart';
import 'package:alquran/home/screen_Lanscape/main_content.dart';
import 'package:alquran/model/controler.dart';
import 'package:alquran/model/controlerAyat.dart';
import 'package:alquran/model/controlerJuz.dart';
import 'package:alquran/tema_Page.dart';
import 'package:flutter/material.dart';

class BackgraundHomeR extends StatefulWidget {
  const BackgraundHomeR({
    Key? key,
  }) : super(key: key);

  @override
  _BackgraundHomeRState createState() => _BackgraundHomeRState();
}

late String ind = "0";
late String typ = 'surah';

class _BackgraundHomeRState extends State<BackgraundHomeR> {
  @override
  Widget build(BuildContext context) {
    return BackgraundLanscape(
      widgets: Row(
        children: [
          Flexible(
            fit: FlexFit.tight,
            flex: 2,
            child: ContentLeft(
              onTaps: (idx, typs) {
                setState(() {
                  ind = idx;
                  typ = typs;
                });
              },
            ),
          ),
          Flexible(
            fit: FlexFit.tight,
            flex: 6,
            child: (dataSurah.length == 0 || dataJuz == 0)
                ? Placeholder()
                : MainContent(
                    index: ind,
                    typeTampilan: typ,
                  ),
          ),
        ],
      ),
    );
  }
}
