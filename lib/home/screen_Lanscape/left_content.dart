import 'package:alquran/Component/Tabs_Component.dart';
import 'package:alquran/constants.dart';
import 'package:alquran/Component/apiData.dart';
import 'package:alquran/Component/tabsku.dart';
import 'package:flutter/material.dart';

class ContentLeft extends StatefulWidget {
  const ContentLeft({
    Key? key,
    required this.onTaps,
  }) : super(key: key);
  final void Function(String, String) onTaps;
  @override
  _ContentLeftState createState() => _ContentLeftState();
}

class _ContentLeftState extends State<ContentLeft> {
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

  late String indexs;
  late String typeT;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: defaultPadding, top: defaultPadding),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: defaultPadding),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(-9, 0),
                      blurRadius: 10,
                      color: Colors.white.withOpacity(.2),
                    )
                  ],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(0),
                    bottomLeft: Radius.circular(5),
                    topRight: Radius.circular(0),
                    bottomRight: Radius.circular(30),
                  )),
              child: TabButtonku(
                  temaWarna: kTextColor1,
                  initialStateselected: selectedItem,
                  dataCategoryList: categoryDetail,
                  onStateChange: (selected, categoryDetail) {
                    // dataApi.readJsonAyat().whenComplete(() => setState(() {
                    selectedItem = selected;
                    categoryDetail = categoryDetail;
                  },
                  listWidgetPageView: [
                    TabSurah(
                      onTaps: (indx, typeT) {
                        setState(() {
                          widget.onTaps(indx, typeT);
                          indexs = indx;
                          typeT = typeT;
                        });
                      },
                    ),
                    TabJuz(
                      onTaps: (indx, typeT) {
                        setState(() {
                          widget.onTaps(indx, typeT);
                          indexs = indx;
                          typeT = typeT;
                        });
                      },
                    )
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
