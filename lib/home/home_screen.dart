import 'dart:convert';

import 'package:alquran/Component/Tabs_Component.dart';
import 'package:alquran/constants.dart';
import 'package:alquran/Component/apiData.dart';
import 'package:alquran/Component/tabsku.dart';
import 'package:alquran/home/screen_Lanscape/backgrounds.dart';
import 'package:alquran/home/screen_Portrait/components/home_header.dart';
import 'package:alquran/model/controlerAyat.dart';
import 'package:alquran/size_config.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    DataApi dataApi = DataApi();
    return Scaffold(
        extendBodyBehindAppBar: (SizeConfig.screenWidth! > 600) ? false : true,
        appBar: AppBar(
          toolbarHeight: heightfit(50),
          // backgroundColor: Colors.transparent,
          backgroundColor: kColor,
          elevation: 0,
          // title: Text("Title"),
        ),
        body: FutureBuilder(
            future: dataApi.readJsonAyat().then((value) => value.dataAyat),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                print((snapshot.data as List).length);
                dataAyat = (snapshot.data! as List<Ayat>);
                return LayoutBuilder(builder: (context, constraints) {
                  if (constraints.maxWidth > 600) {
                    return WideLayout();
                  } else {
                    return NarrowLayout();
                  }
                });
              }
            }));
  }
}

class WideLayout extends StatelessWidget {
  const WideLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgraundHomeR();
  }
}

class NarrowLayout extends StatelessWidget {
  const NarrowLayout({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return HeadHome();
  }
}
