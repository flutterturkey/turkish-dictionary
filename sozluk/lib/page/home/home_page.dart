import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sozluk/util/app_constant.dart';
import 'package:sozluk/util/app_widget.dart';
import 'package:sozluk/util/fade_animation.dart';
import 'package:sozluk/widget/idiom_card.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var size;
  bool isKeyboardVisible = false;
  PageController _pageController = PageController(initialPage: 0);
  int _selectedCategory = 0;

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
      value: SystemUiOverlayStyle(statusBarColor: Colors.transparent, statusBarIconBrightness: isKeyboardVisible ? Brightness.dark : Brightness.light),
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              AnimatedOpacity(opacity: isKeyboardVisible ? 0.0 : 1, duration: Duration(milliseconds: 220), child: _tdkCover(0.35)),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(left: 16, right: 16, top: 48, bottom: 32),
                  child: Padding(
                      padding: !isKeyboardVisible ? EdgeInsets.only(top: 0.0) : EdgeInsets.only(top: 64.0),
                      child: isKeyboardVisible
                          ? buildSearchBody()
                          : Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Text(
                                      'Bir Deyim',
                                      style: TextStyle(color: AppConstant.colorProverbsIdiomsText),
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
                                      style: TextStyle(color: AppConstant.colorProverbsIdiomsText),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8),
                                IdiomCard(title: 'siyem siyem ağlamak', content: 'hafif hafif, ince ince, durmadan gözyaşı dökmek.'),
                                SizedBox(height: 24),
                                Row(
                                  children: <Widget>[
                                    Text(
                                      'Bir Kelime',
                                      style: TextStyle(color: AppConstant.colorProverbsIdiomsText),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8),
                                IdiomCard(title: 'Kalem', content: 'Yazma, çizme vb. işlerde kullanılan çeşitli biçimlerde araç.'),
                                SizedBox(height: 24),
                                Row(
                                  children: <Widget>[
                                    Text(
                                      'Bir Kelime',
                                      style: TextStyle(color: AppConstant.colorProverbsIdiomsText),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8),
                                IdiomCard(title: 'Kalem', content: 'Yazma, çizme vb. işlerde kullanılan çeşitli biçimlerde araç.'),
                                SizedBox(height: 24),
                                Row(
                                  children: <Widget>[
                                    Text(
                                      'Bir Kelime',
                                      style: TextStyle(color: AppConstant.colorProverbsIdiomsText),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8),
                                IdiomCard(title: 'Kalem', content: 'Yazma, çizme vb. işlerde kullanılan çeşitli biçimlerde araç.'),
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
            child: AppWidget.getSearchBox(isKeyboardVisible, context, focusNode: _searchFn),
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
                          style: Theme.of(context).textTheme.body2.copyWith(letterSpacing: 0.2),
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
            decoration: BoxDecoration(color: color, borderRadius: BorderRadius.all(Radius.circular(14))),
          ),
        ),
      );

  Widget _itemTopMenu(String heading) => Padding(
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
              heading,
              style: TextStyle(fontSize: 14, color: AppConstant.colorHeading, fontWeight: FontWeight.w500),
            ),
            Spacer(),
            Spacer(),
          ],
        ),
      );

  Widget get _buildDrawerItem => Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              _tdkCover(0.20),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * .14),
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
                          style: TextStyle(fontSize: 12, color: AppConstant.colorVersionText),
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
                  shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(8)),
                  child: Text(
                    AppConstant.hakkinda,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppConstant.colorHeading),
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
                  shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(8)),
                  child: Text(
                    AppConstant.iletisim,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppConstant.colorHeading),
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
          _itemTopMenu(AppConstant.hakkinda),
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
                    TextSpan(text: AppConstant.appLongRichDescription, style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: AppConstant.appLongDescription),
                  ],
                ),
              ),
            ),
          ),
        ],
      );

  Widget get _buildIletisimItem => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _pullDown(AppConstant.colorPullDown2),
          _itemTopMenu(AppConstant.iletisimBilgileri),
          Padding(
            padding: const EdgeInsets.only(top: 32.0),
            child: _sectionItem(AppConstant.appDescription, AppConstant.address),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 32),
            child: _phoneRow(Icons.print),
          ),
          Padding(padding: const EdgeInsets.only(left: 32), child: _btnEpostaYaz),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 22),
            child: Divider(color: AppConstant.colorBottomSheetDivider, thickness: 1),
          ),
          _sectionItem(AppConstant.magaza, AppConstant.magazaAddress),
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 24, 0, 0),
            child: MaterialButton(
              minWidth: 314,
              height: 48,
              elevation: 0,
              color: AppConstant.colorDrawerButton,
              shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(8)),
              child: Text(
                AppConstant.eMagaza,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: AppConstant.colorHeading),
              ),
              onPressed: _launchURL,
            ),
          ),
        ],
      );

  Widget _sectionItem(String header, String address) => Padding(
        padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              header,
              style: TextStyle(
                color: AppConstant.colorBottomSheetItemHeader,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 10),
              child: Text(address, style: _bottomSheetTextStyleF14W500),
            ),
            _phoneRow(Icons.phone),
          ],
        ),
      );

  Widget _phoneRow(IconData icon) => Row(
        children: <Widget>[
          Icon(icon, size: 15, color: AppConstant.colorPrimary),
          FlatButton(
            onPressed: _callPhone,
            child: Text(AppConstant.phoneNumber),
          ),
        ],
      );

  _callPhone() async {
    final String phone = 'tel:+903124575200';
    if (await canLaunch(phone)) {
      await launch(phone);
    } else {
      throw 'Arama Yapılamadı';
    }
  }

  _launchURL() async {
    final String url = 'http:http://tdk.gov.tr/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Web Sitesi Açılamadı';
    }
  }

  _sendMail() async {
    final String mail = 'mailto:bilgi@tdk.gov.tr';
    if (await canLaunch(mail)) {
      await launch(mail);
    } else {
      throw 'Mail Gönderilmedi';
    }
  }

  Widget get _btnEpostaYaz => MaterialButton(
        minWidth: 152,
        height: 48,
        elevation: 0,
        color: AppConstant.colorDrawerButton,
        shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(8)),
        child: Text(
          AppConstant.epostayaz,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: AppConstant.colorHeading),
        ),
        onPressed: _sendMail,
      );

  Widget get _buildKatkiItem => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _pullDown(AppConstant.colorPullDown2),
          _itemTopMenu(AppConstant.katkioneri),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SvgPicture.asset(
                  AppConstant.svgMessage,
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(32, 30, 32, 24),
                  child: Center(child: Text(AppConstant.katkiOneriDetails, style: _bottomSheetTextStyleF14W500)),
                ),
                _btnEpostaYaz
              ],
            ),
          )
        ],
      );

  Widget get _renderItem => Column(
        children: <Widget>[
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _selectedCategory = page;
                });
              },
              children: <Widget>[_buildIletisimItem, _buildKatkiItem],
            ),
          ),
          _selectCategory
        ],
      );

  Widget get _selectCategory => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _horizontalCategoryItem(id: 0, title: AppConstant.iletisim),
            _horizontalCategoryItem(id: 1, title: AppConstant.katkioneri),
          ],
        ),
      );

  Widget _horizontalCategoryItem({@required int id, @required String title}) {
    return InkWell(
      onTap: () {
        setState(() {
          _selectedCategory = id;
          //TEST
          print(id);
          print(_selectedCategory);
        });
        _pageController.animateToPage(_selectedCategory, duration: Duration(milliseconds: 300), curve: Curves.ease);
      },
      borderRadius: BorderRadius.circular(16),
      child: Container(
        color: AppConstant.colorPageBg,
        height: MediaQuery.of(context).size.height * .10,
        width: MediaQuery.of(context).size.width / 2,
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('$title',
                  textAlign: TextAlign.center, style: TextStyle(fontWeight: _selectedCategory == id ? FontWeight.bold : FontWeight.normal, fontSize: 14)),
              SizedBox(
                height: 4,
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 300),
                height: 2,
                width: _selectedCategory == id ? title.length * 2.5 : 0,
                decoration: BoxDecoration(color: AppConstant.colorPrimary, borderRadius: BorderRadius.circular(4)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onDrawerButtonPressed() {
    try {
      FocusScope.of(context).unfocus();
    } catch (e) {}
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height * .5,
            child: Container(child: _buildDrawerItem, decoration: _bottomSheetBoxDecoration),
          );
        });
  }

  void _onHakkindaButtonPressed() {
    Navigator.pop(context);
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height * .5,
            child: Container(child: _buildHakkindaItem, decoration: _bottomSheetBoxDecoration),
          );
        });
  }

  void _onIletisimButtonPressed() {
    Navigator.pop(context);
    showModalBottomSheet<dynamic>(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height * .9,
            child: Container(child: _renderItem, decoration: _bottomSheetBoxDecoration),
          );
        });
  }

  static BoxDecoration get _bottomSheetBoxDecoration => BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(15.0),
          topRight: const Radius.circular(15.0),
        ),
      );

  static TextStyle get _bottomSheetTextStyleF14W500 => TextStyle(color: AppConstant.colorParagraph2, fontSize: 14, fontWeight: FontWeight.w500);
}
