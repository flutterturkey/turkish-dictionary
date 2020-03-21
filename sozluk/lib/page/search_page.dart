import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sozluk/util/app_constant.dart';
import 'package:sozluk/util/fade_animation.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool isKeyboardVisible = false;
  List<String> vowels = ['ç', 'ğ', 'ı', 'ö', 'ş', 'ü', 'â', 'î', 'û'];
  List<String> _results = [];

  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
      0.3,
      Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              SizedBox(
                height: 16,
              ),
              Container(
                height: 48,
                color: AppConstant.colorVowelBg,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: false,
                    itemCount: 9,
                    itemBuilder: (BuildContext ctx, int index) => Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 32, left: 16),
                          child: Text(
                            vowels[index],
                            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              !isKeyboardVisible
                  ? HistoryBody(
                      historyWord: 'kalem',
                    )
                  : _results.length == 0
                      ? Center(
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.history,
                                  color: Color(0xFFC6CBD2),
                                  size: 48,
                                ),
                                SizedBox(
                                  height: 28,
                                ),
                                Text(
                                  'Aradığınız sözcük bulunamadı. ',
                                  style: TextStyle(fontSize: 14.0, color: AppConstant.colorBackButton, fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                          ),
                        )
                      : ListView.builder(
                          itemCount: 5,
                          itemBuilder: (BuildContext contex, intex) {
                            return Column(
                              children: <Widget>[
                                Material(
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
                                            'kalem',
                                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
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
                              ],
                            );
                          },
                        ),
            ],
          )
        ],
      ),
    );
  }
}

class HistoryBody extends StatelessWidget {
  HistoryBody({this.historyWord});

  final String historyWord;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(top: 24, right: 242, bottom: 12, left: 24),
          child: Text(
            'SON ARAMALAR',
            style: Theme.of(context).textTheme.body2.copyWith(color: AppConstant.colorParagraph2),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: 12,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 54,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Text(
                            historyWord,
                            style: Theme.of(context).textTheme.body2.copyWith(color: AppConstant.colorHeading),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
