import 'package:alquran/constants.dart';
import 'package:alquran/home/home_screen.dart';
import 'package:alquran/size_config.dart';
import 'package:alquran/splash/components/splash_content.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "Selamat datang di Aplikasi Al Qur'an. \nUntuk Penenang Hati",
      "image": 'assets/images/quran.png'
    },
    {
      "text":
          "Jangan Lupa Untuk Mengaji. \nUsahakan tiap hari baca meskipun itu satu ayat",
      "image": 'assets/images/masjid.png'
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      alignment: Alignment.bottomCenter,
                      image: AssetImage("assets/images/bg.png"),
                      fit: BoxFit.fill)),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: defaultPadding),
              child: Column(
                children: [
                  Expanded(
                    flex: 5,
                    child: PageView.builder(
                        onPageChanged: (value) {
                          setState(() {
                            currentPage = value;
                          });
                        },
                        itemCount: splashData.length,
                        itemBuilder: (context, index) {
                          var splashData2 = splashData;
                          return SplashContent(
                            image: splashData2[index]["image"].toString(),
                            text: splashData[index]["text"].toString(),
                          );
                        }),
                  ),
                  Expanded(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: defaultPadding,
                            vertical: defaultPadding),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(splashData.length,
                              (index) => buildDot(index: index)),
                        ),
                      )),
                  Expanded(
                    flex: 1,
                    child: buildButtonSplash(context),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row buildButtonSplash(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: heightFlex(SizeConfig.orientation!, 1.5, 14),
          padding: EdgeInsets.symmetric(horizontal: defaultPadding),
          child: FlatButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            color: kColor,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return HomeScreen();
              }));
            },
            child: Text(
              "Next",
              style: TextStyle(fontSize: sT20, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 50 : 20,
      decoration: BoxDecoration(
        color: currentPage == index ? kColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
