import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sozluk/util/app_constant.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  startTimeout() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, AppConstant.pageHome);
    });
  }

  @override
  void initState() {
    super.initState();
    startTimeout();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DecoratedBox(
            position: DecorationPosition.background,
            decoration: BoxDecoration(
              color: Colors.transparent,
              image: DecorationImage(image: AssetImage('assets/bg.jpg'), fit: BoxFit.cover),
            ),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SvgPicture.asset(
                  AppConstant.svgLogo,
                  height: 100,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 75.0),
                  child: Text(AppConstant.appName, style: Theme.of(context).textTheme.body2.copyWith(color: Colors.white)),
                ),
              ],
            ))));
  }
}
