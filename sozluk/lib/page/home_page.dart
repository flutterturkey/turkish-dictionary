import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sozluk/util/app_constant.dart';

import '../util/app_constant.dart';
import '../util/app_widget.dart';
import '../widget/idiom_card.dart';

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
          children: <Widget>[_pageBody, _searchBar, _drawerButton],
        ),
      );

  Widget get _bottomNavigationBar => ConvexAppBar(
        color: AppConstant.colorParagraph2,
        backgroundColor: Colors.white,
        activeColor: AppConstant.colorPrimary,
        elevation: 0.5,
        //height causes layout overflow on some devies
        //height: 56,
        initialActiveIndex: 1,
        style: TabStyle.fixedCircle,
        items: <TabItem>[
          TabItem(icon: Icons.history, title: ''),
          TabItem(icon: Icons.search, title: ''),
          TabItem(icon: Icons.bookmark_border, title: ''),
        ],
      );

  Widget get _pageBody => Column(
        children: <Widget>[
          _tdkCover(0.35),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(left: 16, right: 16, top: 48, bottom: 32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        'Bir Deyim',
                        style: TextStyle(
                            color: AppConstant.colorProverbsIdiomsText),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  IdiomCard(title: 'on para', content: 'çok az (para).'),
                  SizedBox(height: 24),
                  Row(
                    children: <Widget>[
                      Text(
                        'Bir Atasözü',
                        style: TextStyle(
                            color: AppConstant.colorProverbsIdiomsText),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  IdiomCard(
                      title: 'siyem siyem ağlamak',
                      content:
                          'hafif hafif, ince ince, durmadan gözyaşı dökmek.'),
                  SizedBox(height: 24),
                  Row(
                    children: <Widget>[
                      Text(
                        'Bir Kelime',
                        style: TextStyle(
                            color: AppConstant.colorProverbsIdiomsText),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  IdiomCard(
                      title: 'Kalem',
                      content:
                          'Yazma, çizme vb. işlerde kullanılan çeşitli biçimlerde araç.'),
                           SizedBox(height: 24),
                  Row(
                    children: <Widget>[
                      Text(
                        'Bir Kelime',
                        style: TextStyle(
                            color: AppConstant.colorProverbsIdiomsText),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  IdiomCard(
                      title: 'Kalem',
                      content:
                          'Yazma, çizme vb. işlerde kullanılan çeşitli biçimlerde araç.'),
                           SizedBox(height: 24),
                  Row(
                    children: <Widget>[
                      Text(
                        'Bir Kelime',
                        style: TextStyle(
                            color: AppConstant.colorProverbsIdiomsText),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  IdiomCard(
                      title: 'Kalem',
                      content:
                          'Yazma, çizme vb. işlerde kullanılan çeşitli biçimlerde araç.'),
                ],
              ),
            ),
          ),
        ],
      );

  Widget get _searchBar => Positioned(
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
      );

  Widget get _drawerButton => Padding(
        padding: const EdgeInsets.fromLTRB(0, 25, 10, 0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.more_horiz,
                color: Colors.white,
              ),
              onPressed: () {
                _onDrawerButtonPressed();
              },
            )
          ],
        ),
      );

  Widget _tdkCover(double scale) => Container(
        height: size.height * scale,
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
      );

  Widget _pullDown(Color color) => Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Container(
            width: 58,
            height: 4,
            decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.all(Radius.circular(14))),
          ),
        ),
      );

  Widget get _buildDrawerItem => Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              _tdkCover(0.25),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 125.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        AppConstant.appDescription,
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          AppConstant.appVersion,
                          style: TextStyle(
                              fontSize: 12,
                              color: AppConstant.colorVersionText),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              _pullDown(AppConstant.colorPullDown1),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: MaterialButton(
                  minWidth: 328,
                  height: 48,
                  elevation: 0,
                  color: AppConstant.colorDrawerButton,
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(8)),
                  child: Text(
                    AppConstant.hakkinda,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppConstant.colorHeading),
                  ),
                  onPressed: () {
                    _onHakkindaButtonPressed();
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: MaterialButton(
                  minWidth: 328,
                  height: 48,
                  elevation: 0,
                  color: AppConstant.colorDrawerButton,
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(8)),
                  child: Text(
                    AppConstant.iletisim,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppConstant.colorHeading),
                  ),
                  onPressed: () {
                    _onIletisimButtonPressed();
                  },
                ),
              ),
            ],
          )
        ],
      );

  Widget get _buildHakkindaItem => Column(
        children: <Widget>[
          _pullDown(AppConstant.colorPullDown2),
          Padding(
            padding: const EdgeInsets.only(top: 32.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new RawMaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                    _onDrawerButtonPressed();
                  },
                  child: new Icon(
                    Icons.arrow_back_ios,
                    color: AppConstant.colorBackButton,
                    size: 13.0,
                  ),
                  shape: new CircleBorder(),
                  elevation: 0,
                  fillColor: AppConstant.colorDrawerButton,
                  padding: const EdgeInsets.all(15.0),
                ),
                Spacer(),
                Text(
                  AppConstant.hakkinda,
                  style: TextStyle(
                      fontSize: 14,
                      color: AppConstant.colorHeading,
                      fontWeight: FontWeight.w500),
                ),
                Spacer(),
                Spacer(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Center(
              child: SvgPicture.asset(
                AppConstant.svgLogoRed,
                height: 32,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 32, 40, 0),
            child: Center(
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: AppConstant.colorAppDescription,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text: AppConstant.appLongRichDescription,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: AppConstant.appLongDescription),
                  ],
                ),
              ),
            ),
          ),
        ],
      );

  void _onDrawerButtonPressed() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            color: Colors.transparent,
            height: 410,
            child: Container(
              child: _buildDrawerItem,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.only(
                  topLeft: const Radius.circular(10),
                  topRight: const Radius.circular(10),
                ),
              ),
            ),
          );
        });
  }

  void _onHakkindaButtonPressed() {
    Navigator.pop(context);
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            color: Colors.transparent,
            height: 410,
            child: Container(
              child: _buildHakkindaItem,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.only(
                  topLeft: const Radius.circular(10),
                  topRight: const Radius.circular(10),
                ),
              ),
            ),
          );
        });
  }

  void _onIletisimButtonPressed() {
    Navigator.pop(context);
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            color: Colors.transparent,
            height: 410,
            child: Container(
              child: _buildDrawerItem,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.only(
                  topLeft: const Radius.circular(10),
                  topRight: const Radius.circular(10),
                ),
              ),
            ),
          );
        });
  }
}
