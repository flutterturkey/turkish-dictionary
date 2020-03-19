import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sozluk/util/app_constant.dart';
import 'package:sozluk/util/app_widget.dart';
import 'package:sozluk/util/fade_animation.dart';
import 'package:sozluk/widget/idiom_card.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var size;
  bool isKeyboardVisible = false;

  FocusNode _searchFn = FocusNode();
  @override
  void initState() {
    _searchFn.addListener(_searchFnListener);
    super.initState();
  }

  void _searchFnListener() {
    if (_searchFn.hasFocus) {
      setState(() {
        isKeyboardVisible = true;
      });
    } else {
      setState(() {
        isKeyboardVisible = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness:
              isKeyboardVisible ? Brightness.dark : Brightness.light),
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              AnimatedOpacity(
                  opacity: isKeyboardVisible ? 0.0 : 1,
                  duration: Duration(milliseconds: 220),
                  child: _tdkCover(0.35)),
              Expanded(
                child: SingleChildScrollView(
                  padding:
                      EdgeInsets.only(left: 16, right: 16, top: 48, bottom: 32),
                  child: Padding(
                      padding: !isKeyboardVisible
                          ? EdgeInsets.only(top: 0.0)
                          : EdgeInsets.only(top: 64.0),
                      child: isKeyboardVisible
                          ? buildSearchBody()
                          : Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Text(
                                      'Bir Deyim',
                                      style: TextStyle(
                                          color: AppConstant
                                              .colorProverbsIdiomsText),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8),
                                IdiomCard(
                                    title: 'on para',
                                    content: 'çok az (para).'),
                                SizedBox(height: 24),
                                Row(
                                  children: <Widget>[
                                    Text(
                                      'Bir Atasözü',
                                      style: TextStyle(
                                          color: AppConstant
                                              .colorProverbsIdiomsText),
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
                                          color: AppConstant
                                              .colorProverbsIdiomsText),
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
                                          color: AppConstant
                                              .colorProverbsIdiomsText),
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
                                          color: AppConstant
                                              .colorProverbsIdiomsText),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8),
                                IdiomCard(
                                    title: 'Kalem',
                                    content:
                                        'Yazma, çizme vb. işlerde kullanılan çeşitli biçimlerde araç.'),
                              ],
                            )),
                ),
              ),
            ],
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 220),
            top: !isKeyboardVisible ? size.height * .35 - 26 : 40,
            left: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: Material(
                borderRadius: BorderRadius.circular(8),
                elevation: 4,
                shadowColor: Colors.black26,
                child: AppWidget.getSearchBox(isKeyboardVisible, context,
                    focusNode: _searchFn),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 25, 10, 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                isKeyboardVisible
                    ? Container()
                    : IconButton(
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
          )
        ],
      ),
    );
  }

  Widget buildSearchBody() {
    List<String> vowels = ['ç', 'ğ', 'ı', 'ö', 'ş', 'ü', 'â', 'î', 'û'];
    return FadeAnimation(
        0.3,
        Container(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 48,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: false,
                  itemCount: 9,
                  itemBuilder: (BuildContext ctx, int index) => Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 16, left: 16),
                        child: Text(
                          vowels[index],
                          style: Theme.of(context)
                              .textTheme
                              .body2
                              .copyWith(letterSpacing: 0.2),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Text("Search results.."),
              Text("Search results.."),
              Text("Search results.."),
            ],
          ),
        ));
  }

  Widget _tdkCover(double scale) => Container(
        height: !isKeyboardVisible ? size.height * scale : 0,
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
              _tdkCover(0.20),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * .14),
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
          SizedBox(
            height: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
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
    try {
      FocusScope.of(context).unfocus();
    } catch (e) {}
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            color: Colors.transparent,
            height: MediaQuery.of(context).size.height * .4,
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
