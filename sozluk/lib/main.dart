import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sozluk/page/home/home_navigator.dart';
import 'package:sozluk/page/splash_page.dart';
import 'package:sozluk/util/app_constant.dart';

void main() => runApp(Sozluk());

class Sozluk extends StatefulWidget {
  @override
  _SozlukState createState() => _SozlukState();
}

class _SozlukState extends State<Sozluk> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      title: AppConstant.appName,
      initialRoute: AppConstant.pageSplash,
      routes: {
        AppConstant.pageSplash: (context) => SplashPage(),
        AppConstant.pageHome: (context) => HomeNavigator(),
      },
    );
  }
}
