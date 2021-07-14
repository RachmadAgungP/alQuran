import 'package:alquran/constants.dart';
import 'package:alquran/size_config.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';

class TabButtonku extends StatefulWidget {
  final Function(int, List) onStateChange;
  final Color temaWarna;
  final List dataCategoryList;
  final int initialStateselected;
  final List<Widget> listWidgetPageView;
  const TabButtonku(
      {Key? key,
      required this.initialStateselected,
      required this.dataCategoryList,
      required this.onStateChange,
      required this.listWidgetPageView,
      required this.temaWarna})
      : super(key: key);

  @override
  _TabButtonkuState createState() => _TabButtonkuState();
}

class _TabButtonkuState extends State<TabButtonku> {
  int selected = 0;
  int selectedPage = 0;
  List selectedCategoryList = [];
  int pageNum = 0;
  late PageController _pageController;

  void _changePage(int pageNum) {
    setState(() {
      selected = pageNum;
      _pageController.animateToPage(
        pageNum,
        duration: Duration(milliseconds: 1000),
        curve: Curves.fastLinearToSlowEaseIn,
      );
    });
  }

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);

    selected = widget.initialStateselected;
    selectedCategoryList = widget.dataCategoryList;
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
      padding: EdgeInsets.only(
        right: widthfit(defaultPadding / 2),
        left: widthfit(defaultPadding / 2),
      ),
      child: Column(
        children: [
          Container(
            width: widthfit(160),
            height: heightfit(60),
            padding: EdgeInsets.all(defaultPadding / 3),
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      blurRadius: 10,
                      offset: Offset(0, 9),
                      color: kColor.withOpacity(.2))
                ],
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                color: Colors.white),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: selectedCategoryList.length,
              itemBuilder: (context, index) => Container(
                width: widthfit(60),
                height: heightfit(30),
                padding: EdgeInsets.symmetric(
                    horizontal: widthfit(defaultPadding / 2),
                    vertical: heightfit(defaultPadding / 3)),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      selected = index;
                      pageNum = index;
                      _changePage(index);
                    });
                    if (widget.onStateChange != null) {
                      widget.onStateChange(selected, selectedCategoryList);
                    }
                  },
                  child: Container(
                    height: heightfit(15),
                    width: widthfit(95),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                        color: selected == index
                            ? kPrimaryColor.withOpacity(.8)
                            : kPrimaryColor.withOpacity(.2)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Container(
                            height: heightfit(25),
                            width: widthfit(75),
                            child: FittedBox(
                              child: RichText(
                                textAlign: TextAlign.justify,
                                text: TextSpan(
                                    text: widget.dataCategoryList[index],
                                    style: TextStyle(
                                      color: selected == index
                                          ? Colors.white
                                          : Colors.black38,
                                      fontWeight: FontWeight.w500,
                                      fontSize: heightfit(14),
                                    )),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Divider(
          //   height: .5,
          //   thickness: 2,
          //   color: widget.temaWarna,
          // ),
          Padding(
            padding: EdgeInsets.only(top: heightfit(defaultPadding)),
            child: ExpandablePageView(
              onPageChanged: (int page) {
                setState(() {
                  selected = page;
                });
              },
              controller: _pageController,
              children: widget.listWidgetPageView,
            ),
          ),
        ],
      ),
    );
  }
}
