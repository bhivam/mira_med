import 'package:dashboard/widgets/side_bar_tile.dart';
import 'package:dashboard/widgets/sub_side_bar_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../services/colors.dart';

class ExpandableSideBarTile extends StatelessWidget {
  IconData icon;
  String title;
  Color color;
  Function isCurrentPage;
  Function onClick;
  List<SubSideBarTile> subSidebarTiles;
  ExpandableSideBarTile(this.icon, this.title, this.isCurrentPage, this.onClick,
      this.subSidebarTiles,
      [this.color = Colors.white]);

  @override
  Widget build(BuildContext context) {
    Color iconTextColor = isCurrentPage(title) ? gray : Colors.white;
    Color backgroundColor =
        isCurrentPage(title) ? Colors.white : Colors.transparent;

    return ExpansionTile(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10),
              bottomLeft: Radius.circular(10))),
      children: subSidebarTiles,
      backgroundColor: backgroundColor,
      leading: Padding(
          padding: EdgeInsets.only(left: 8),
          child: Icon(icon, color: iconTextColor)),
      title: Text(title, style: TextStyle(color: iconTextColor)),
    );
  }
}
