import 'package:alquran/constants.dart';
import 'package:alquran/size_config.dart';
import 'package:flutter/material.dart';

class CardFitursButtons extends StatelessWidget {
  const CardFitursButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        height: 200,
        width: 450,
        // margin: EdgeInsets.all(defaultPadding),
        decoration: BoxDecoration(
            gradient: kPrimaryGradientColor,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                offset: Offset(-6, 7),
                blurRadius: 25,
                color: Colors.black45.withOpacity(.2),
              )
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                    right: -100,
                    top: -20,
                    child: Container(
                      height: 350,
                      width: 350,
                      child: Padding(
                        padding: EdgeInsets.all(defaultPadding),
                        child: Image.asset("assets/images/quran.png"),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.brown.withOpacity(.3),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(-6, 7),
                            blurRadius: 25,
                            color: Colors.black45.withOpacity(.2),
                          )
                        ]),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.all(defaultPadding * 1.5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.book_rounded,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: defaultPadding / 2,
                              ),
                              RichText(
                                text: TextSpan(
                                  text: "Al Qur'an",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: RichText(
                                  textAlign: TextAlign.justify,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "Bacalah.\n",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      TextSpan(
                                        text:
                                            "Sempatkan Membaca meskipun itu 1 Ayat ",
                                      ),
                                    ],
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                ),
                              ),
                              Expanded(flex: 3, child: Container())
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
