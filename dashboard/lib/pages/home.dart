import 'package:dashboard/models/note.dart';
import 'package:dashboard/services/colors.dart';
import 'package:dashboard/services/media_query.dart';
import 'package:dashboard/widgets/note_tile.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Home extends StatelessWidget {
  List<List<dynamic>> data;
  List<Note> notes;
  Home(this.data, this.notes, {super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            child: CircleAvatar(
              child: Icon(Icons.person, size: 35),
              radius: 30,
            ),
            left: context.width * 0.75,
            top: 25),
        Container(
          width: context.width * 0.8,
          child: Column(
            children: [
              SizedBox(height: context.height * 0.025),
              Text(
                "Welcome to Mira's Overview",
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(color: Colors.white, fontWeight: FontWeight.w900),
              ),
              SizedBox(height: context.height * 0.010),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Container(
                        width: context.width * 0.45,
                        child: Stack(
                          children: <Widget>[
                            Card(
                              child: AspectRatio(
                                aspectRatio: 1.7,
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
                            Positioned(
                              bottom:
                                  335, // Adjust this value to position the legend accordingly
                              left:
                                  100, // Adjust this value to align the legend with the chart's left edge
                              child: buildLegend(),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: context.width * 0.45,
                        child: const Stack(
                          children: <Widget>[
                            Card(
                              child: AspectRatio(
                                aspectRatio: 1.8,
                                child: Padding(
                                    padding: EdgeInsets.only(
                                      right: 18,
                                      left: 12,
                                      top: 24,
                                      bottom: 12,
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.warning,
                                              color: Colors.red,
                                              size: 90,
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(height: 20),
                                                Text("Consult Physician!",
                                                    style: TextStyle(
                                                        fontSize: 40)),
                                                Text(
                                                    "Fever detected. High risk of infection.",
                                                    style: TextStyle(
                                                        fontSize: 25)),
                                                SizedBox(height: 20),
                                                Text(
                                                  "Heart rate rising rapidly",
                                                  style: TextStyle(
                                                      fontSize: 25,
                                                      color: Colors.red),
                                                ),
                                                SizedBox(height: 20),
                                                Text(
                                                  "Blood oxygen dipping below 95%",
                                                  style: TextStyle(
                                                      fontSize: 25,
                                                      color: Colors.blue),
                                                ),
                                                SizedBox(height: 20),
                                                Text(
                                                  "Temperature rising above 100\u00b0F",
                                                  style: TextStyle(
                                                      fontSize: 25,
                                                      color: Colors.orange),
                                                )
                                              ],
                                            ),
                                          ],
                                        )
                                      ],
                                    )),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    width: context.width * 0.325,
                    child: Column(
                      children: notes
                          .map((e) => Padding(
                                padding: const EdgeInsets.only(bottom: 15),
                                child: NoteTile(e, context.width * 0.4),
                              ))
                          .toList(),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
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
          interval: 10,
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
    minY: 30,
    maxY: 140,
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

Widget buildLegend() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      legendItem(Colors.orange, "Body Temp."),
      const SizedBox(width: 16),
      legendItem(Colors.red, "BPM"),
      const SizedBox(width: 16),
      legendItem(Colors.blue, "SpO2"),
    ],
  );
}

Widget legendItem(Color color, String text) {
  return Row(
    children: [
      Container(
        width: 16,
        height: 16,
        color: color.withOpacity(0.7),
      ),
      const SizedBox(width: 4),
      Text(text, style: const TextStyle(fontSize: 12, color: Colors.black54)),
    ],
  );
}
