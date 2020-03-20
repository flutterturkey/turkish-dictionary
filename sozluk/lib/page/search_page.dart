import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sozluk/util/app_constant.dart';
import 'package:sozluk/util/app_widget.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}


class _SearchPageState extends State<SearchPage> {
  TextEditingController _searchText = TextEditingController(text: "");
  bool isKeyboardVisible = false;

  FocusNode _searchFn = FocusNode();
  List<String> vowels = ['ç', 'ğ', 'ı', 'ö', 'ş', 'ü', 'â', 'î', 'û'];
  List<String> _results = [];

  bool _searching = false;

  @override
  void initState() {
    _searchFn.addListener(_searchFnListener);
    super.initState();
  }

  @override
  void dispose() {
    isKeyboardVisible = false;
    _searching = false;
    super.dispose();
  }
  void _searchFnListener() {
    if (_searchFn.hasFocus) {
      setState(() {
        isKeyboardVisible = true;
        print((_searching));
        _searching = true;
      });
    } else {
      setState(() {
        isKeyboardVisible = false;
        _searching = false;
        print((_searching));
      });
    }
  }

  Future _search(String searchText) async{
    setState(() {
      _searching = true;
    });


    setState(() {
      _searching = false;
    });
    var result = 0;

    return result;
  }



  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Flexible(
                  fit: FlexFit.tight,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0,top: 60),
                    child: Container(
                      height: 52,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppConstant.colorPrimary)
                        ,),
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      child: Theme(
                        data: AppWidget.getThemeData().copyWith(primaryColor: Colors.grey),
                        child: Row(
                          children: <Widget>[
                            Flexible(
                              child: TextFormField(
                                focusNode: _searchFn,
                                autofocus: true,
                                onChanged: _search,
                                controller: _searchText,
                                decoration: InputDecoration(
                                  hintText: 'Arama',
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
                            IconButton(
                              icon: Icon(
                                Icons.close,
                                color: AppConstant.colorBackButton,
                                size: 20,
                              ),
                              onPressed: () {
                                _searching = !_searching;
                                print(_searching);
                                _searchText.text = "";
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 16),
                  child: InkWell(
                    onTap: () {
                      print(_searching);
                      FocusScope.of(context).requestFocus(FocusNode());
                      _searchText.text = "";

                    },
                    child: Container(
                        padding: EdgeInsets.only(top: 60, bottom: 12, right: 4, left: 4),
                        child: Text(
                          "Vazgeç",
                          style: TextStyle(color: AppConstant.colorHeading, fontWeight: FontWeight.w500),
                        )),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Container(
              height: 48, color: Color(0xFFF0F0F0),
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: false,
                  itemCount: 9,
                  itemBuilder: (BuildContext ctx, int index) => Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Padding(padding: const EdgeInsets.only(right: 16, left: 16),
                        child: Text(vowels[index], style: Theme.of(context).textTheme.body1.copyWith(letterSpacing: 0.2),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child:  !isKeyboardVisible  ?
              HistoryBody(historyWord: 'kalem',)
                  :  _results.length ==0  ? Center(
                child: Container(
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.history, color: Color(0xFFC6CBD2),size: 48,),
                      SizedBox(height: 28,),
                      Text('Aradığınız sözcük bulunamadı. ', style: TextStyle(fontSize: 14.0,color: AppConstant.colorBackButton,fontWeight: FontWeight.w600 ),)
                    ],
                  ),
                ),
              ): ListView.builder(
                itemCount: 5,
                itemBuilder: (BuildContext contex, intex){
                  return  Column(
                    children: <Widget>[
                      Material(
                        color: Colors.white,
                        elevation: 4,
                        shadowColor: Colors.black26,
                        borderRadius: BorderRadius.circular(6),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(6),
                          onTap: () {
                          },
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
            ),
          ],
        )
      ],
    );
  }
}


// ignore: must_be_immutable
class HistoryBody extends StatelessWidget {
  HistoryBody({this.historyWord});
  String historyWord;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 24,right: 242),
          child: Text('SON ARAMALAR', style: Theme.of(context).textTheme.body2.copyWith(color: AppConstant.colorParagraph2),),),
        Padding(
          padding: const EdgeInsets.only(left: 16,right: 16),
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
                        child: Text(historyWord, style: Theme.of(context).textTheme.body2.copyWith(color: AppConstant.colorHeading),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],);
  }
}
