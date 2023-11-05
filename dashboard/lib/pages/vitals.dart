import 'package:dashboard/services/media_query.dart';
import 'package:flutter/material.dart';

class Vitals extends StatelessWidget {
  const Vitals({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width * 0.8,
      child: Column(
        children: [
          SizedBox(height: 10),
          Row(
            children: [
              SizedBox(width: context.width * 0.05 / 3),
              Container(
                  height: context.height * 0.375,
                  width: context.width * 0.375,
                  child: Card()),
              SizedBox(width: context.width * 0.05 / 3),
              Container(
                  height: context.height * 0.375,
                  width: context.width * 0.375,
                  child: Card()),
              SizedBox(width: context.width * 0.05 / 3),
            ],
          )
        ],
      ),
    );
  }
}
