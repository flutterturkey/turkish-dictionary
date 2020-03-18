import 'package:flutter/material.dart';

import '../util/app_constant.dart';
import '../util/app_constant.dart';
import '../util/app_constant.dart';
import '../util/app_constant.dart';
import '../util/app_constant.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  PageController _pageController = PageController(initialPage: 0);
  bool isEmpty = false;

  int _selectedCategory = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppConstant.colorHeading,
          ),
        ),
        elevation: 0,
        backgroundColor: AppConstant.colorPageBg,
        title: Text(
          'Geçmiş',
          style: TextStyle(color: AppConstant.colorHeading),
        ),
      ),
      body: Column(
        children: <Widget>[
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                _horizontalCategoryItem(id: 0, title: 'Sözcük'),
                _horizontalCategoryItem(id: 1, title: 'Atasözü & Deyim'),
                _horizontalCategoryItem(id: 2, title: 'Lorem'),
                _horizontalCategoryItem(id: 3, title: 'Ipsum'),
                _horizontalCategoryItem(id: 4, title: 'Dolor'),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: isEmpty ? _renderEmptyState() : _renderHistory(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _renderEmptyState() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.history,
            size: 48,
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            'Henüz geçmiş yok',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppConstant.colorParagraph2),
          ),
        ],
      ),
    );
  }

  Widget _renderHistory() {
    return Column(
      children: <Widget>[
        Expanded(
          child: PageView(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _selectedCategory = page;
              });
            },
            children: <Widget>[
              _words(),
              _idioms(),
              _lorem(),
              _ipsum(),
              _dolor()
            ],
          ),
        ),
      ],
    );
  }

  Widget _words() {
    return Column(
      children: <Widget>[
        _historyItem(title: 'Kalem'),
        _historyItem(title: 'Gül'),
        _historyItem(title: 'Araba'),
      ],
    );
  }

  Widget _idioms() {
    return Column(
      children: <Widget>[
        _historyItem(title: 'Kalemiyle yaşamak veya geçinmek'),
        _historyItem(title: 'Kalemine dolamak')
      ],
    );
  }

  Widget _lorem() {
    return Column(
      children: <Widget>[
        _historyItem(title: 'Lorem ipsum dolor sit'),
      ],
    );
  }

  Widget _ipsum() {
    return Column(
      children: <Widget>[
        _historyItem(title: 'Lorem ipsum'),
      ],
    );
  }

  Widget _dolor() {
    return Column(
      children: <Widget>[
        _historyItem(title: 'Adispicing sit elit'),
      ],
    );
  }

  Widget _horizontalCategoryItem({@required int id, @required String title}) {
    return InkWell(
      onTap: () {
        setState(() {
          _selectedCategory = id;
        });

        _pageController.animateToPage(id,
            duration: Duration(milliseconds: 300), curve: Curves.ease);
      },
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('$title',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: _selectedCategory == id
                      ? FontWeight.bold
                      : FontWeight.normal,
                )),
            SizedBox(
              height: 4,
            ),
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              height: 2,
              width: _selectedCategory == id ? title.length * 4.5 : 0,
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(4)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _historyItem({@required String title}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Material(
        color: Colors.white,
        elevation: 4,
        shadowColor: Colors.black26,
        borderRadius: BorderRadius.circular(6),
        child: InkWell(
          borderRadius: BorderRadius.circular(6),
          onTap: () {},
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  '$title',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: AppConstant.colorPrimary,
                  size: 18,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
