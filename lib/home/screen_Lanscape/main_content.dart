import 'package:alquran/constants.dart';
import 'package:alquran/detail/detailSurah.dart';

import 'package:alquran/size_config.dart';
import 'package:flutter/material.dart';

class MainContent extends StatelessWidget {
  final String index;
  final String typeTampilan;
  const MainContent({
    Key? key,
    required this.index,
    required this.typeTampilan,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('types $typeTampilan');
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: widthfit(defaultPadding / 2),
          vertical: heightfit(defaultPadding * 2)),
      // height: SizeConfig.screenHeight,
      // width: SizeConfig.screenWidth / 1.45,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(-5, 9),
              blurRadius: 20,
              color: Colors.black45.withOpacity(.3),
            )
          ],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5),
            bottomLeft: Radius.circular(30),
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(5),
          )),
      child: SingleChildScrollView(
        child: TabSurahs(
          index: index,
          typeTampilan: typeTampilan,
        ),
      ),
    );
  }
}
