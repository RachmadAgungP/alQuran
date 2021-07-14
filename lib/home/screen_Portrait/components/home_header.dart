import 'package:alquran/Component/Tabs_Component.dart';
import 'package:alquran/Component/apiData.dart';
import 'package:alquran/Component/tabsku.dart';
import 'package:alquran/home/components/card_Header.dart';
import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../../size_config.dart';

class BackgraundHome extends StatelessWidget {
  const BackgraundHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        height: heightfit(250),
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: defaultPadding),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: kColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            )),
      ),
      Positioned(
        right: 0,
        bottom: heightfit(90),
        child: Container(
            height: heightfit(150),
            width: widthfit(110),
            // alignment: Alignment.topCenter,
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(.4),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(100),
                  bottomRight: Radius.circular(0),
                ))),
      ),
    ]);
  }
}

class HomeHeader extends StatelessWidget {
  final String titleSapa;
  const HomeHeader({
    Key? key,
    required this.titleSapa,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: SizeConfig.screenHeight! * 0.24,
          decoration: BoxDecoration(
              gradient: kPrimaryGradientColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  width: double.infinity,
                  height: SizeConfig.screenHeight! * 0.07),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: RichText(
                    text: TextSpan(
                        style: TextStyle(
                            fontSize: sT22, color: kPrimaryLightColor),
                        children: [
                      TextSpan(text: titleSapa),
                    ])),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Heading extends StatelessWidget {
  const Heading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(height: heightfit(150), child: BackgraundHome()),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: defaultPadding * 2),
              alignment: Alignment.bottomLeft,
              height: heightfit(40),
              child: FittedBox(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                  child: RichText(
                      text: TextSpan(
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                          children: [
                        TextSpan(
                            text: "Assalamualaikum\n",
                            style: TextStyle(fontSize: 24)),
                        TextSpan(
                            text: "Sobat Muslim Milenial.",
                            style: TextStyle(fontSize: 16))
                      ])),
                ),
              ),
            ),
            SizedBox(
              height: heightfit(defaultPadding),
            ),
            Container(
              height: heightfit(180),
              width: widthfit(500),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: widthfit(defaultPadding),
                ),
                child: FittedBox(
                  child: CardFitursButtons(),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class HeadHome extends StatefulWidget {
  const HeadHome({
    Key? key,
  }) : super(key: key);

  @override
  _HeadHomeState createState() => _HeadHomeState();
}

class _HeadHomeState extends State<HeadHome> {
  int selectedItem = 0;
  List categoryDetail = ["Surah", "Juz"];
  late PageController _pageController;

  void _changePage() {
    setState(() {
      // selectedItem = selectedItem;

      _pageController.animateToPage(
        selectedItem,
        duration: Duration(milliseconds: 1000),
        curve: Curves.fastLinearToSlowEaseIn,
      );
    });
  }

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: heightfit(90)),
        child: TabButtonku(
            temaWarna: kTextColor1,
            initialStateselected: selectedItem,
            dataCategoryList: categoryDetail,
            onStateChange: (selected, categoryDetail) {
              selectedItem = selected;
              categoryDetail = categoryDetail;
            },
            listWidgetPageView: [
              TabSurah(
                onTaps: (indx, typeT) {},
              ),
              TabJuz(
                onTaps: (indx, typeT) {},
              )
            ]));
  }
}
