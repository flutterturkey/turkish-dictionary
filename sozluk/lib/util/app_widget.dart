import 'package:flutter/material.dart';
import 'package:sozluk/util/app_constant.dart';

class AppWidget {
  static ThemeData getThemeData() {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: AppConstant.colorPrimary,
      //accentColor: Colors.black,
      //toggleableActiveColor: Colors.black,
      //hintColor: Colors.black,

      backgroundColor: AppConstant.colorPageBg,

      textTheme: TextTheme(
        display1: TextStyle(fontSize: AppConstant.fontSizeDisplay, fontWeight: FontWeight.bold),
        headline: TextStyle(fontSize: AppConstant.fontSizeHeadline, fontWeight: FontWeight.bold),
        title: TextStyle(fontSize: AppConstant.fontSizeTitle, fontWeight: FontWeight.bold),
        body1: TextStyle(fontSize: AppConstant.fontSizeBody),
        body2: TextStyle(fontSize: AppConstant.fontSizeBody2, fontWeight: FontWeight.bold),
        caption: TextStyle(fontSize: AppConstant.fontSizeCaption, fontWeight: FontWeight.bold),
      ),
      appBarTheme: AppBarTheme(brightness: Brightness.light),
    );
  }

  static Widget getSearchBox(isKeyboardVisible, context, {FocusNode focusNode}) {
    TextEditingController _searchController = TextEditingController();
    return Row(
      children: <Widget>[
        Flexible(
          child: Container(
            height: 52,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: isKeyboardVisible ? Color(0xFFF3A5B1) : Colors.transparent),
                boxShadow: [
                  !isKeyboardVisible
                      ? BoxShadow(color: Colors.grey.withOpacity(0.1), blurRadius: 5.0, offset: Offset(0, 10))
                      : BoxShadow(color: Colors.transparent)
                ]),
            margin: const EdgeInsets.symmetric(horizontal: 0),
            child: Theme(
              data: AppWidget.getThemeData().copyWith(primaryColor: Colors.grey),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextFormField(
                      focusNode: focusNode,
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Türkçe Sözlükte Ara...',
                        hintStyle: TextStyle(fontSize: 14, color: AppConstant.colorBackButton),
                        //
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: Container(
                          margin: EdgeInsets.only(bottom: 0),
                          child: Icon(
                            Icons.search,
                            color: AppConstant.colorBackButton,
                          ),
                        ),
                        suffixIcon: isKeyboardVisible
                            ? IconButton(
                                icon: Icon(
                                  Icons.close,
                                  color: AppConstant.colorBackButton,
                                  size: 20,
                                ),
                                onPressed: () {
                                  _searchController.text = "";
                                },
                              )
                            : null,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            width: 0,
                            color: Colors.transparent,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            width: 0,
                            color: Colors.transparent,
                          ),
                        ),
                      ),
                    ),
                  ),
/* 
                  AnimatedOpacity(
                    opacity: !isKeyboardVisible ? 0.0 : 1.0,
                    duration: Duration(milliseconds: 1000),
                    child: Container(

                      margin: EdgeInsets.only(left: 16),
                      child: InkWell(
                        onTap: () {
                          FocusScope.of(context).requestFocus(FocusNode());
                        },
                        child: Container(
                            padding: EdgeInsets.only(
                                top: 12, bottom: 12, right: 4, left: 4),
                            child: Text(
                              "Vazgeç",
                              style: TextStyle(
                                  color: AppConstant.colorHeading,
                                  fontWeight: FontWeight.w500),
                            )),
                      ),
                    ),
                  ), */
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
