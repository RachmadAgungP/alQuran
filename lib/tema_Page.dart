import 'package:alquran/constants.dart';
import 'package:alquran/size_config.dart';
import 'package:flutter/material.dart';

AppBar appBarLanscape() {
  return AppBar(
      toolbarHeight: heightfit(80),
      // backgroundColor: Colors.transparent,
      backgroundColor: Colors.green,
      elevation: 0,
      // title: Text("Title"),
      actions: <Widget>[
        FittedBox(
            child: Container(height: heightfit(100), width: widthfit(250)))
      ]);
}

AppBar appBarPotrait() {
  return AppBar(
    toolbarHeight: heightfit(50),
    backgroundColor: Colors.transparent,
    // backgroundColor: Colors.green,
    elevation: 0,
    // title: Text("Title"),
  );
}

class TitlePage extends StatelessWidget {
  const TitlePage({
    Key? key,
    required this.judul,
    required this.penjelas,
  }) : super(key: key);
  final String judul;
  final String penjelas;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightfit(80),
      // alignment: Alignment.topLeft,
      child: FittedBox(
        child: Container(
          height: 80,
          width: 200,
          padding: EdgeInsets.only(
              top: defaultPadding, left: defaultPadding, right: defaultPadding),
          child: FittedBox(
            child: RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: "${judul}\n",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  )),
              TextSpan(
                  text: penjelas,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ))
            ])),
          ),
        ),
      ),
    );
  }
}

class BackgraundPotrait extends StatelessWidget {
  const BackgraundPotrait({
    Key? key,
    required this.judul,
    required this.penjelas,
    required this.widgets,
    required this.tema,
  }) : super(key: key);

  final String judul;
  final String penjelas;
  final Widget widgets;
  final Color tema;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: heightfit(60)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitlePage(judul: judul, penjelas: penjelas),
                widgets,
              ],
            ),
          )
        ],
      ),
    );
  }
}

class BackgraundLanscape extends StatelessWidget {
  const BackgraundLanscape({
    Key? key,
    required this.widgets,
  }) : super(key: key);
  final Widget widgets;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.screenHeight,
      width: SizeConfig.screenWidth,
      decoration: BoxDecoration(
          color: kColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(0),
            bottomLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(0),
          )),
      child: widgets,
    );
  }
}
