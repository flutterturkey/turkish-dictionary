import 'package:flutter/material.dart';
import 'package:sozluk/util/app_constant.dart';

class Vowels extends StatelessWidget {
  final List<String> vowels = ['ç', 'ğ', 'ı', 'ö', 'ş', 'ü', 'â', 'î', 'û'];

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
