import 'package:dashboard/widgets/side_bar_tile.dart';
import 'package:dashboard/widgets/sub_side_bar_tile.dart';
import 'package:flutter/material.dart';

import '../services/colors.dart';
import '../services/media_query.dart';
import 'expandable_side_bar_tile.dart';

class SideBar extends StatefulWidget {
  Function changePage;
  String currentPage;
  SideBar(this.changePage, this.currentPage, {super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  bool isCurrentPage(String page) => widget.currentPage == page;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width * 0.2,
      height: context.height,
      color: gray,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  SideBarTile(
                      Icons.home, "Home", isCurrentPage, widget.changePage),
                  SideBarTile(Icons.monitor_heart, "Vitals", isCurrentPage,
                      widget.changePage),
                  ExpandableSideBarTile(Icons.note_alt, "Notes", isCurrentPage,
                      widget.changePage, [
                    SubSideBarTile("Emotional and Mental Health", isCurrentPage,
                        widget.changePage),
                    SubSideBarTile("Therapy and Exercises", isCurrentPage,
                        widget.changePage),
                    SubSideBarTile("Nutrition and Hydration", isCurrentPage,
                        widget.changePage),
                    SubSideBarTile("Mobility and Motor Skills", isCurrentPage,
                        widget.changePage),
                    SubSideBarTile("Other", isCurrentPage, widget.changePage),
                  ]),
                  SideBarTile(Icons.notification_important, "Alerts",
                      isCurrentPage, widget.changePage),
                  SideBarTile(Icons.question_answer, "MiraBot", isCurrentPage,
                      widget.changePage),
                  SideBarTile(Icons.import_contacts, "Patient Information",
                      isCurrentPage, widget.changePage),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding _customIcon(IconData icon, int index) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Icon(
        icon,
        color: index == 1 ? Colors.white : Colors.black.withOpacity(0.6),
      ),
    );
  }
}
