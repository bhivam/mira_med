import 'package:dashboard/defaults/media_query.dart';
import 'package:flutter/material.dart';

class Vitals extends StatelessWidget {
  const Vitals({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(child: Text("Vitals")), width: context.width * 0.8);
  }
}
