import 'package:dashboard/widgets/side_bar_tile.dart';
import 'package:dashboard/widgets/sub_side_bar_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../services/colors.dart';

class ExpandableSideBarTile extends StatefulWidget {
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
  State<ExpandableSideBarTile> createState() => _ExpandableSideBarTileState();
}

class _ExpandableSideBarTileState extends State<ExpandableSideBarTile> {
  @override
  Widget build(BuildContext context) {
    Color iconTextColor =
        widget.isCurrentPage(widget.title) ? gray : Colors.white;
    Color backgroundColor =
        widget.isCurrentPage(widget.title) ? Colors.white : Colors.transparent;

    bool expanded = false;

    return ExpansionTile(
      onExpansionChanged: (value) => setState(() => expanded = value),
      shape: Border.symmetric(
          vertical: BorderSide.none,
          horizontal: BorderSide(color: Colors.black26, width: 1)),
      backgroundColor: backgroundColor,
      leading: Padding(
          padding: EdgeInsets.only(left: 8),
          child: Icon(widget.icon, color: iconTextColor)),
      title: Padding(
        padding: EdgeInsets.only(left: 8.0),
        child: Text(widget.title, style: TextStyle(color: iconTextColor)),
      ),
      children: widget.subSidebarTiles,
    );
  }
}
