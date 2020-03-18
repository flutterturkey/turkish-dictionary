import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sozluk/util/app_constant.dart';

import '../util/app_constant.dart';
import '../util/app_widget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppConstant.colorPageBg,
      body: _body,
      bottomNavigationBar: _bottomNavigationBar,
    );
  }

  Widget get _body => Center(
        child: Stack(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: size.height * .35,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    image: DecorationImage(
                      image: AssetImage('assets/bg.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      AppConstant.svgLogo,
                      height: 40,
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text('Content here'),
                  ),
                ),
              ],
            ),
            Positioned(
              top: size.height * .35 - 32,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Material(
                  elevation: 4,
                  borderRadius: BorderRadius.circular(8),
                  child: AppWidget.getSearchBox(),
                ),
              ),
            ),
          ],
        ),
      );

  Widget get _bottomNavigationBar => ConvexAppBar(
        color: AppConstant.colorParagraph2,
        backgroundColor: Colors.white,
        activeColor: AppConstant.colorPrimary,
        elevation: 0.6,
        height: 56,
        style: TabStyle.fixedCircle,
        items: <TabItem>[
          TabItem(icon: Icons.history, title: ''),
          TabItem(icon: Icons.search, title: ''),
          TabItem(icon: Icons.bookmark_border, title: ''),
        ],
      );
}
