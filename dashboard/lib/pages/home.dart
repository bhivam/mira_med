import 'package:dashboard/services/colors.dart';
import 'package:dashboard/services/media_query.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Home extends StatelessWidget {
  List<List<dynamic>> data;
  Home(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width * 0.8,
      child: Column(
        children: [
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: context.width * 0.3875,
                child: Stack(
                  children: <Widget>[
                    Card(
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            right: 18,
                            left: 12,
                            top: 24,
                            bottom: 12,
                          ),
                          child: LineChart(
                            mainData(data),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: context.width * 0.3875,
                child: Stack(
                  children: <Widget>[
                    Card(
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            right: 18,
                            left: 12,
                            top: 24,
                            bottom: 12,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
    ;
  }
}

LineChartData mainData(List<List<dynamic>> data) {
  return LineChartData(
    rangeAnnotations: RangeAnnotations(
      verticalRangeAnnotations: [
        VerticalRangeAnnotation(
          x1: 68,
          x2: 93,
          color: Colors.red.withOpacity(0.3),
        ),
      ],
    ),
    gridData: FlGridData(
      show: true,
      drawVerticalLine: false,
      drawHorizontalLine: false,
      verticalInterval: 1,
    ),
    titlesData: FlTitlesData(
      show: true,
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 30,
          getTitlesWidget: bottomTitleWidgets,
          interval: 8,
        ),
      ),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          interval: 2,
          showTitles: true,
          // getTitlesWidget: leftTitleWidgets,
          reservedSize: 40,
        ),
      ),
      rightTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      topTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
    ),
    lineTouchData: LineTouchData(
      getTouchLineEnd: (data, index) => double.infinity,
      getTouchedSpotIndicator:
          (LineChartBarData barData, List<int> spotIndexes) {
        return spotIndexes.map((spotIndex) {
          return TouchedSpotIndicatorData(
            FlLine(color: Colors.orange, strokeWidth: 3),
            FlDotData(
              getDotPainter: (spot, percent, barData, index) =>
                  FlDotCirclePainter(
                radius: 8,
                color: Colors.orange,
              ),
            ),
          );
        }).toList();
      },
      touchTooltipData: LineTouchTooltipData(
        tooltipBgColor: gray,
      ),
    ),
    borderData: FlBorderData(
      show: true,
      border: Border.all(
        color: Colors.black,
      ),
    ),
    // minX: 48,
    // maxX: 11,
    // minY: 0,
    // maxY: 96,
    lineBarsData: [
      LineChartBarData(
        spots: data.map((e) => FlSpot(e[0], e[2])).toList(),
        isCurved: true,
        color: Colors.orange,
        barWidth: 4,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: false,
        ),
      ),
      LineChartBarData(
        spots: data.map((e) => FlSpot(e[0], e[3])).toList(),
        isCurved: true,
        color: Colors.red,
        barWidth: 4,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: false,
        ),
      ),
      LineChartBarData(
        spots: data.map((e) => FlSpot(e[0], e[4])).toList(),
        isCurved: true,
        color: Colors.blue,
        barWidth: 4,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: false,
        ),
      ),
    ],
  );
}

Widget bottomTitleWidgets(double value, TitleMeta meta) {
  const style = TextStyle(
    fontSize: 10,
    color: Colors.black,
  );
  return SideTitleWidget(
    axisSide: meta.axisSide,
    child: Text("${value % 24}:00", style: style),
  );
}
