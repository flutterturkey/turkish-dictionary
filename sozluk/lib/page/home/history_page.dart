import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sozluk/models/category.dart';
import 'package:sozluk/models/history_item.dart';
import 'package:sozluk/util/app_constant.dart';
import 'package:sozluk/widgets/build_category.dart';
import 'package:sozluk/widgets/build_history_item.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  PageController _pageController = PageController(initialPage: 0);

  final List<Category> categories = [
    Category(id: 0, title: 'Sözcük'),
    Category(id: 1, title: 'Atasözü & Deyim'),
    Category(id: 2, title: 'Lorem'),
    Category(id: 3, title: 'Ipsum'),
  ];

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
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.clear,
              color: AppConstant.colorHeading,
            ),
            onPressed: () {
              setState(() {
                isEmpty = !isEmpty;
              });
            },
          )
        ],
        brightness: Brightness.light,
      ),
      body: Column(
        children: <Widget>[
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            scrollDirection: Axis.horizontal,
            child: Row(
                children: categories.map((Category currentCategory) {
              return InkWell(
                onTap: () {
                  setState(() {
                    _selectedCategory = currentCategory.id;
                  });

                  _pageController.animateToPage(currentCategory.id,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.ease);
                },
                child: BuildCategory(
                  category: currentCategory,
                  active: currentCategory.id == _selectedCategory,
                ),
              );
            }).toList()),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: isEmpty
                  ? RenderEmptyHistoryPage()
                  : Column(
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
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _words() {
    return Column(
      children: <Widget>[
        BuildHistoryItem(
          historyItem: HistoryItem(title: 'Kalem'),
        ),
        BuildHistoryItem(
          historyItem: HistoryItem(title: 'Gül'),
        ),
        BuildHistoryItem(
          historyItem: HistoryItem(title: 'Araba'),
        )
      ],
    );
  }

  Widget _idioms() {
    return Column(
      children: <Widget>[
        BuildHistoryItem(
          historyItem: HistoryItem(title: 'Kalemiyle yaşamak veya geçinmek'),
        ),
        BuildHistoryItem(
          historyItem: HistoryItem(title: 'Kalemine dolamak'),
        ),
      ],
    );
  }

  Widget _lorem() {
    return Column(
      children: <Widget>[
        BuildHistoryItem(
          historyItem: HistoryItem(title: 'Lorem ipsum dolor sit'),
        ),
      ],
    );
  }

  Widget _ipsum() {
    return Column(
      children: <Widget>[
        BuildHistoryItem(
          historyItem: HistoryItem(title: 'Lorem'),
        )
      ],
    );
  }

  Widget _dolor() {
    return Column(
      children: <Widget>[
        BuildHistoryItem(
          historyItem: HistoryItem(title: 'Adispicing sit elit'),
        ),
      ],
    );
  }
}

class RenderEmptyHistoryPage extends StatelessWidget {
  const RenderEmptyHistoryPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}
