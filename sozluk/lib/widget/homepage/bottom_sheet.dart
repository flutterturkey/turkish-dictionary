import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sozluk/util/app_constant.dart';
import 'package:sozluk/util/app_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class AppBottomSheetWidgets {
  static Widget selectCategory(Widget widget, Widget widget2) => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[widget, widget2],
        ),
      );

  static Widget buildHakkindaItem(Widget widget) => Column(
        children: <Widget>[
          AppWidget.pullDown(AppConstant.colorPullDown2),
          widget,
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Center(child: SvgPicture.asset(AppConstant.svgLogoRed, height: 32)),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 32, 40, 0),
            child: Center(
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500, color: AppConstant.colorAppDescription),
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

  static Widget buildKatkiItem(Widget widget) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          AppWidget.pullDown(AppConstant.colorPullDown2),
          widget,
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SvgPicture.asset(AppConstant.svgMessage, height: 40),
                Padding(
                  padding: const EdgeInsets.fromLTRB(32, 30, 32, 24),
                  child: Center(child: Text(AppConstant.katkiOneriDetails, style: _bottomSheetTextStyleF14W500)),
                ),
                AppBottomSheetWidgets.btnEpostaYaz,
              ],
            ),
          )
        ],
      );

  static Widget buildIletisimItem(Widget widget) => SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AppWidget.pullDown(AppConstant.colorPullDown2),
            widget,
            Padding(padding: const EdgeInsets.only(top: 32.0), child: AppBottomSheetWidgets.sectionItem(AppConstant.appDescription, AppConstant.address)),
            Padding(padding: const EdgeInsets.only(left: 32), child: AppBottomSheetWidgets.phoneRow(Icons.print)),
            Padding(padding: const EdgeInsets.only(left: 32), child: AppBottomSheetWidgets.btnEpostaYaz),
            Padding(padding: const EdgeInsets.fromLTRB(16, 24, 16, 22), child: Divider(color: AppConstant.colorBottomSheetDivider, thickness: 1)),
            AppBottomSheetWidgets.sectionItem(AppConstant.magaza, AppConstant.magazaAddress),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 24, 0, 0),
              child: MaterialButton(
                minWidth: 314,
                height: 48,
                elevation: 0,
                color: AppConstant.colorDrawerButton,
                shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(8)),
                child: Text(AppConstant.eMagaza, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: AppConstant.colorHeading)),
                onPressed: _launchURL,
              ),
            ),
          ],
        ),
      );

  static Widget sectionItem(String header, String address) => Padding(
        padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(header, style: TextStyle(color: AppConstant.colorBottomSheetItemHeader, fontSize: 18, fontWeight: FontWeight.bold)),
            Padding(padding: const EdgeInsets.only(top: 20.0, bottom: 10), child: Text(address, style: _bottomSheetTextStyleF14W500)),
            phoneRow(Icons.phone),
          ],
        ),
      );

  static Widget get btnEpostaYaz => MaterialButton(
        minWidth: 152,
        height: 48,
        elevation: 0,
        color: AppConstant.colorDrawerButton,
        shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(8)),
        child: Text(AppConstant.epostayaz, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: AppConstant.colorHeading)),
        onPressed: _sendMail,
      );

  static Widget phoneRow(IconData icon) => Row(
        children: <Widget>[
          Icon(icon, size: 15, color: AppConstant.colorPrimary),
          FlatButton(onPressed: _callPhone, child: Text(AppConstant.phoneNumber)),
        ],
      );

  static _sendMail() async {
    final String mail = 'mailto:bilgi@tdk.gov.tr';
    if (await canLaunch(mail)) {
      await launch(mail);
    } else {
      throw 'Mail Gönderilmedi';
    }
  }

  static _callPhone() async {
    final String phone = 'tel:+903124575200';
    if (await canLaunch(phone)) {
      await launch(phone);
    } else {
      throw 'Arama Yapılamadı';
    }
  }

  static _launchURL() async {
    final String url = 'http:http://tdk.gov.tr/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Web Sitesi Açılamadı';
    }
  }

  static BoxDecoration get bottomSheetBoxDecoration => BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topLeft: const Radius.circular(15.0), topRight: const Radius.circular(15.0)),
      );

  static TextStyle get _bottomSheetTextStyleF14W500 => TextStyle(color: AppConstant.colorParagraph2, fontSize: 14, fontWeight: FontWeight.w500);
}
