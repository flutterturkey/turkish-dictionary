import 'package:flutter/material.dart';
import 'package:sozluk/util/app_constant.dart';
import 'package:sozluk/util/app_widget.dart';

class WordDetailPage extends StatefulWidget {
  @override
  _WordDetailPageState createState() => _WordDetailPageState();
}

class _WordDetailPageState extends State<WordDetailPage> {
  bool isKeyboardVisible;
  int _selectedCategory = 0;
  PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    isKeyboardVisible = MediaQuery.of(context).viewInsets.vertical > 0;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppConstant.colorHeading,
          ),
        ),
        elevation: 0,
        backgroundColor: AppConstant.colorPageBg,
        title: Text(
          'Kalem',
          style: TextStyle(color: AppConstant.colorHeading),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.more_horiz,
              color: AppConstant.colorHeading,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Material(
                      borderRadius: BorderRadius.circular(8),
                      shadowColor: Colors.black38,
                      elevation: 4,
                      child: AppWidget.getSearchBox(isKeyboardVisible, context),
                    ),
                  ),
                  SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 16),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: <Widget>[
                        _horizontalCategoryItem(id: 0, title: 'Sözcük'),
                        _horizontalCategoryItem(
                            id: 1, title: 'Atasözü & Deyim'),
                        _horizontalCategoryItem(id: 2, title: 'Lorem'),
                        _horizontalCategoryItem(id: 3, title: 'Ipsum'),
                        _horizontalCategoryItem(id: 4, title: 'Dolor'),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Kalem',
                          style: TextStyle(
                              fontSize: 32, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          'Arapça kalem',
                          style: TextStyle(color: AppConstant.colorParagraph),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Material(
                                  borderRadius: BorderRadius.circular(24),
                                  color: Colors.white,
                                  elevation: 4,
                                  shadowColor: Colors.black38,
                                  child: InkWell(
                                    onTap: () {},
                                    borderRadius: BorderRadius.circular(24),
                                    child: Container(
                                      height: 48,
                                      width: 48,
                                      child: Center(
                                          child: Icon(Icons.settings_voice)),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Material(
                                  borderRadius: BorderRadius.circular(24),
                                  color: Colors.white,
                                  elevation: 4,
                                  shadowColor: Colors.black38,
                                  child: InkWell(
                                    onTap: () {},
                                    borderRadius: BorderRadius.circular(24),
                                    child: Container(
                                      height: 48,
                                      width: 48,
                                      child: Center(
                                          child: Icon(
                                        Icons.bookmark,
                                        color: AppConstant.colorPrimary,
                                      )),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Material(
                              borderRadius: BorderRadius.circular(24),
                              color: Colors.white,
                              elevation: 4,
                              shadowColor: Colors.black38,
                              child: InkWell(
                                onTap: () {},
                                borderRadius: BorderRadius.circular(24),
                                child: Container(
                                  height: 48,
                                  padding: EdgeInsets.symmetric(horizontal: 16),
                                  child: Center(
                                    child: Text(
                                      'Türk İşaret Dili',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: AppConstant.colorParagraph2),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Material(
                          color: Colors.white,
                          elevation: 4,
                          shadowColor: Colors.black38,
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(12),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Text(
                                      '1',
                                      style: TextStyle(
                                          color: AppConstant.colorParagraph2),
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      'İSİM',
                                      style: TextStyle(
                                        color: AppConstant.colorPrimary,
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 16),
                                  child: Column(
                                    children: <Widget>[
                                      SizedBox(
                                        height: 12,
                                      ),
                                      Text(
                                        'Yazma, çizme vb. işlerde kullanılan çeşitli biçimlerde araç:',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black87),
                                      ),
                                      SizedBox(
                                        height: 12,
                                      ),
                                      Text(
                                        '"Kâğıt, kalem, mürekkep, hepsi masanın üstündedir." - Falih Rıfkı Atay',
                                        style: TextStyle(
                                            color: AppConstant.colorParagraph),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 8,),
                                Divider(),

                                SizedBox(height: 8,),

                                  Row(
                                  children: <Widget>[
                                    Text(
                                      '2',
                                      style: TextStyle(
                                          color: AppConstant.colorParagraph2),
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      'İSİM',
                                      style: TextStyle(
                                        color: AppConstant.colorPrimary,
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 16),
                                  child: Column(
                                    children: <Widget>[
                                      SizedBox(
                                        height: 12,
                                      ),
                                      Text(
                                        'Yazma, çizme vb. işlerde kullanılan çeşitli biçimlerde araç:',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black87),
                                      ),
                                      SizedBox(
                                        height: 12,
                                      ),
                                      Text(
                                        '"Kâğıt, kalem, mürekkep, hepsi masanın üstündedir." - Falih Rıfkı Atay',
                                        style: TextStyle(
                                            color: AppConstant.colorParagraph),
                                      ),
                                    ],
                                  ),
                                ),
                              
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
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
}
