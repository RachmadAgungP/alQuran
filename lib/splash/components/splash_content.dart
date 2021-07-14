import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SplashContent extends StatelessWidget {
  final String text;
  final String image;

  const SplashContent({Key? key, required this.text, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (SizeConfig.orientation == Orientation.portrait)
        ? Column(
            children: [
              Flexible(
                  flex: 3,
                  child: Padding(
                    padding: EdgeInsets.all(defaultPadding),
                    child: buildTextSplash(),
                  )),
              Flexible(
                flex: 5,
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(left: defaultPadding * 2),
                    child: Image.asset(
                      image,
                    ),
                  ),
                ),
              )
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                flex: 1,
                child: buildTextSplash(),
              ),
              SizedBox(
                width: defaultPadding / 2,
              ),
              Flexible(
                flex: 1,
                child: Image.asset(
                  image,
                ),
              ),
            ],
          );
  }

  Column buildTextSplash() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: Text(
            "AL Qur'an",
            style: TextStyle(
              fontSize: sT26 + 9,
              color: kTextColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: defaultPadding / 3,
        ),
        Container(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: kTextColor1,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
