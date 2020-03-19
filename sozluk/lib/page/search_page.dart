import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sozluk/util/app_constant.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

TextEditingController _searchText = TextEditingController();

class _SearchPageState extends State<SearchPage> {
  List<String> vowels = ['ç', 'ğ', 'ı', 'ö', 'ş', 'ü', 'â', 'î', 'û'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Positioned(
          top: 60,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 80.0),
            child: TextField(
              controller: _searchText,
              decoration: InputDecoration(
                hintText: 'Arama',
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: AppConstant.colorPrimary)),
                hoverColor: AppConstant.colorPrimary,
                border: OutlineInputBorder(borderSide: BorderSide(color: AppConstant.colorPrimary), borderRadius: BorderRadius.all(Radius.circular(10.0))),
              ),
            ),
          ),
        ),
        Positioned(
          top: 65,
          right: 5,
          child: FlatButton(
            onPressed: () {},
            child: Text(
              'Vazgeç',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14.0,
                letterSpacing: 0.002,
              ),
              textAlign: TextAlign.right,
            ),
          ),
        ),
        Positioned(
          height: 48,
          top: 125,
          right: 0,
          left: 0,
          child: Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  color: Color(0xFFF0F0F0),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 19, right: 19, top: 16, bottom: 16),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
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
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 197,
          left: 16,
          right: 242,
          child: Text(
            'SON ARAMALAR',
            style: Theme.of(context).textTheme.body2.copyWith(color: AppConstant.colorParagraph2),
          ),
        ),
        Positioned(
          top: 210,
          left: 16,
          right: 16,
          child: Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: ListView.builder(
                  itemCount: 3,
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
                                'kalem',
                                style: Theme.of(context).textTheme.body2.copyWith(color: AppConstant.colorHeading),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        )
      ],
    ));
  }
}
