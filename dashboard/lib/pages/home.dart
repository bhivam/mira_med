import 'package:dashboard/services/media_query.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width * 0.8,
      child: Column(
        children: [
          SizedBox(height: 20),
          Row(
            children: [
              SizedBox(width: context.width * 0.0125),
              Container(
                width: context.width * 0.775,
                child: Stack(
                  children: <Widget>[
                    Card(
                      child: AspectRatio(
                        aspectRatio: 1.70,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            right: 18,
                            left: 12,
                            top: 24,
                            bottom: 12,
                          ),
                          child: LineChart(
                            mainData(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: context.width * 0.0125),
            ],
          )
        ],
      ),
    );
    ;
  }
}

LineChartData mainData() {
  return LineChartData(
    rangeAnnotations: RangeAnnotations(
      verticalRangeAnnotations: [
        VerticalRangeAnnotation(
          x1: 2,
          x2: 5,
          color: Color(0xffFBC756).withOpacity(0.2),
        ),
        VerticalRangeAnnotation(
          x1: 8,
          x2: 9,
          color: Color(0xff34C4F8).withOpacity(0.2),
        ),
      ],
      horizontalRangeAnnotations: [
        HorizontalRangeAnnotation(
          y1: 2,
          y2: 3,
          color: Color(0xff443C98).withOpacity(0.2),
        ),
      ],
    ),
    // uncomment to see ExtraLines with RangeAnnotations
    extraLinesData: ExtraLinesData(
//         extraLinesOnTop: true,
      horizontalLines: [
        HorizontalLine(
          y: 5,
          color: Colors.green,
          strokeWidth: 2,
          dashArray: [5, 10],
          label: HorizontalLineLabel(
            show: true,
            alignment: Alignment.topRight,
            padding: const EdgeInsets.only(right: 5, bottom: 5),
            style: const TextStyle(
              fontSize: 9,
              fontWeight: FontWeight.bold,
            ),
            labelResolver: (line) => 'H: ${line.y}',
          ),
        ),
      ],
      verticalLines: [
        VerticalLine(
          x: 5.7,
          color: Colors.blue,
          strokeWidth: 2,
          dashArray: [5, 10],
          label: VerticalLineLabel(
            show: true,
            alignment: Alignment.topRight,
            padding: const EdgeInsets.only(left: 10, top: 5),
            style: const TextStyle(
              fontSize: 9,
              fontWeight: FontWeight.bold,
            ),
            labelResolver: (line) => 'V: ${line.x}',
          ),
        ),
        VerticalLine(
          x: 8.5,
          color: Colors.transparent,
        ),
        VerticalLine(
          x: 3.5,
          color: Colors.transparent,
        )
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
          // getTitlesWidget: bottomTitleWidgets,
          interval: 4,
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
        tooltipBgColor: Colors.blue,
      ),
    ),
    borderData: FlBorderData(
      show: true,
      border: Border.all(
        color: Colors.black,
      ),
    ),
    minX: 0,
    maxX: 11,
    minY: 0,
    maxY: 6,
    lineBarsData: [
      LineChartBarData(
        spots: const [
          FlSpot(0, 1),
          FlSpot(2, 1),
          FlSpot(4.9, 5),
          FlSpot(6.8, 5),
          FlSpot(7.5, 3.5),
          FlSpot.nullSpot,
          FlSpot(7.5, 2),
          FlSpot(8, 1),
          FlSpot(10, 2),
          FlSpot(11, 2.5),
        ],
        dashArray: [10, 6],
        isCurved: true,
        color: Colors.red,
        barWidth: 4,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: false,
        ),
      ),
    ],
  );
}
