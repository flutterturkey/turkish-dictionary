import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:sozluk/page/home/history_page.dart';
import 'package:sozluk/page/home/home_page.dart';
import 'package:sozluk/util/app_constant.dart';

class HomeNavigator extends StatefulWidget {
  @override
  _HomeNavigatorState createState() => _HomeNavigatorState();
}

class _HomeNavigatorState extends State<HomeNavigator> {
  int _currentPage = 1;

  List<Widget> _pages = [
    HistoryPage(),
    HomePage(),
    Center(
      child: Text(
        'Todo',
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ConvexAppBar(
        // height causes layout overflow on some devices
        // height: 56,
        color: AppConstant.colorParagraph2,
        backgroundColor: Colors.white,
        activeColor: AppConstant.colorPrimary,
        style: TabStyle.fixedCircle,
        elevation: 0.5,

        initialActiveIndex: _currentPage,

        onTap: (int val) {
          if (val == _currentPage) return;
          setState(() {
            _currentPage = val;
          });
        },

        items: <TabItem>[
          TabItem(
            icon: Icons.history,
            title: '',
          ),
          TabItem(
            icon: Icons.search,
            title: '',
          ),
          TabItem(
            icon: Icons.bookmark_border,
            title: '',
          ),
        ],
      ),
      body: _pages[_currentPage],
    );
  }
}
