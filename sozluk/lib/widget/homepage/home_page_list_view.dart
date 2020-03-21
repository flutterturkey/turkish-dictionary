import 'package:flutter/material.dart';
import 'package:sozluk/util/app_constant.dart';
import 'package:sozluk/widget/idiom_card.dart';

class HomePageListView extends StatelessWidget {
  const HomePageListView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                'Bir Deyim',
                style: TextStyle(color: AppConstant.colorProverbsIdiomsText),
              ),
            ],
          ),
          SizedBox(height: 8),
          IdiomCard(title: 'on para', content: 'çok az (para).'),
          SizedBox(height: 24),
          Row(
            children: <Widget>[
              Text(
                'Bir Atasözü',
                style: TextStyle(color: AppConstant.colorProverbsIdiomsText),
              ),
            ],
          ),
          SizedBox(height: 8),
          IdiomCard(title: 'siyem siyem ağlamak', content: 'hafif hafif, ince ince, durmadan gözyaşı dökmek.'),
          SizedBox(height: 24),
          Row(
            children: <Widget>[
              Text(
                'Bir Kelime',
                style: TextStyle(color: AppConstant.colorProverbsIdiomsText),
              ),
            ],
          ),
          SizedBox(height: 8),
          IdiomCard(title: 'Kalem', content: 'Yazma, çizme vb. işlerde kullanılan çeşitli biçimlerde araç.'),
          SizedBox(height: 24),
          Row(
            children: <Widget>[
              Text(
                'Bir Kelime',
                style: TextStyle(color: AppConstant.colorProverbsIdiomsText),
              ),
            ],
          ),
          SizedBox(height: 8),
          IdiomCard(title: 'Kalem', content: 'Yazma, çizme vb. işlerde kullanılan çeşitli biçimlerde araç.'),
          SizedBox(height: 24),
          Row(
            children: <Widget>[
              Text(
                'Bir Kelime',
                style: TextStyle(color: AppConstant.colorProverbsIdiomsText),
              ),
            ],
          ),
          SizedBox(height: 8),
          IdiomCard(title: 'Kalem', content: 'Yazma, çizme vb. işlerde kullanılan çeşitli biçimlerde araç.'),
        ],
      ),
    );
  }
}
