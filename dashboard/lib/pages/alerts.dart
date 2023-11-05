import 'package:dashboard/services/media_query.dart';
import 'package:flutter/material.dart';

class Alerts extends StatelessWidget {
  const Alerts({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(child: Text("Alerts")), width: context.width * 0.8);
  }
}
