import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sozluk/models/history_item.dart';
import 'package:sozluk/page/word_detail_page.dart';
import 'package:sozluk/util/app_constant.dart';

class BuildHistoryItem extends StatelessWidget {
  final HistoryItem historyItem;

  const BuildHistoryItem({
    Key key,
    this.historyItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Material(
        color: Colors.white,
        elevation: 4,
        shadowColor: Colors.black26,
        borderRadius: BorderRadius.circular(6),
        child: InkWell(
          borderRadius: BorderRadius.circular(6),
          onTap: () {
            Navigator.push(
              context,
              CupertinoPageRoute(builder: (context) => WordDetailPage()),
            );
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  '${historyItem.title}',
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
