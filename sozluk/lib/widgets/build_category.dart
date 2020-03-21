import 'package:flutter/material.dart';
import 'package:sozluk/models/category.dart';

class BuildCategory extends StatelessWidget {
  final Category category;
  final bool active;

  const BuildCategory({
    Key key,
    @required this.category,
    this.active = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('${category.title}',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: active ? FontWeight.bold : FontWeight.normal,
              )),
          SizedBox(
            height: 4,
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            height: 2,
            width: active ? category.title.length * 4.5 : 0,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ],
      ),
    );
  }
}
