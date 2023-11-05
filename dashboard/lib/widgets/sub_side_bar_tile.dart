import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../services/colors.dart';

class SubSideBarTile extends StatelessWidget {
  String title;
  Color color;
  Function isCurrentPage;
  Function onClick;
  SubSideBarTile(this.title, this.isCurrentPage, this.onClick,
      [this.color = Colors.white]);

  @override
  Widget build(BuildContext context) {
    Color textColor = isCurrentPage(title) ? gray : Colors.white;
    Color backgroundColor =
        isCurrentPage(title) ? Colors.white : Colors.transparent;

    return TextButton(
      onPressed: () => onClick(title),
      child: ListTile(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
                bottomLeft: Radius.circular(10))),
        tileColor: backgroundColor,
        title: Padding(
            padding: EdgeInsets.only(left: 52),
            child: Text(title, style: TextStyle(color: textColor))),
      ),
    );
  }
}
