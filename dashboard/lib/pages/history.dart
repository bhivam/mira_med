import 'package:dashboard/defaults/media_query.dart';
import 'package:flutter/material.dart';

class History extends StatelessWidget {
  const History({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(child: Text("History")), width: context.width * 0.8);
  }
}
