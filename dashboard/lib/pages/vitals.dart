import 'package:dashboard/services/media_query.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class Vitals extends StatefulWidget {
  const Vitals({super.key});

  @override
  _VitalsState createState() => _VitalsState();
}

class _VitalsState extends State<Vitals> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(
        reverse: true); // this will make the animation repeat indefinitely
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: context.width * 0.8,
        height: context.height,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: context.height * 0.6,
              width: context.width * 0.25,
              child: Card(
                child: Column(
                  children: [
                    SizedBox(height: 85),
                    AnimatedBuilder(
                      animation: _animationController,
                      builder: (context, child) {
                        return Icon(
                          Icons.favorite,
                          color: Colors.red,
                          size: 300 +
                              (_animationController.value *
                                  10), // this will animate the icon size between 50 and 60
                        );
                      },
                    ),
                    Expanded(child: Container()),
                    Text("${59} BPM",
                        style: Theme.of(context).textTheme.displayMedium),
                    SizedBox(height: 60),
                  ],
                ),
              ),
            ),
            Container(
                height: context.height * 0.6,
                width: context.width * 0.25,
                child: Card(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CircularPercentIndicator(
                      radius: 120.0,
                      lineWidth: 20.0,
                      animationDuration: 3000,
                      percent: 0.94,
                      animateFromLastPercent: true,
                      center: const Text(
                        "96.2%",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20.0),
                      ),
                      circularStrokeCap: CircularStrokeCap.round,
                      progressColor: Colors.blue,
                    ),
                    SizedBox(
                      height: 80,
                    ),
                    Text("SpO2",
                        style: Theme.of(context).textTheme.displayMedium),
                    SizedBox(
                      height: 60,
                    )
                  ],
                ))),
            Container(
                height: context.height * 0.6,
                width: context.width * 0.25,
                child: Card(
                    child: Column(
                  children: [
                    SizedBox(height: 70),
                    Container(
                      height: context.height * .4,
                      width: context.width * .17,
                      child: SfRadialGauge(axes: <RadialAxis>[
                        RadialAxis(
                            minimum: 90,
                            maximum: 110,
                            ranges: <GaugeRange>[
                              GaugeRange(
                                  startValue: 90,
                                  endValue: 95,
                                  color: Colors.blue,
                                  startWidth: 10,
                                  endWidth: 10),
                              GaugeRange(
                                  startValue: 95,
                                  endValue: 99,
                                  color: Colors.green,
                                  startWidth: 10,
                                  endWidth: 10),
                              GaugeRange(
                                  startValue: 99,
                                  endValue: 110,
                                  color: Colors.red,
                                  startWidth: 10,
                                  endWidth: 10)
                            ],
                            pointers: <GaugePointer>[
                              NeedlePointer(value: 96)
                            ],
                            annotations: <GaugeAnnotation>[
                              GaugeAnnotation(
                                  widget: Container(
                                      child: const Text('96.0',
                                          style: TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold))),
                                  angle: 90,
                                  positionFactor: 0.5)
                            ])
                      ]),
                    ),
                    Text("Temperature",
                        style: Theme.of(context).textTheme.displayMedium),
                  ],
                ))),
          ],
        ));
  }

  @override
  void dispose() {
    _animationController
        .dispose(); // make sure to dispose the controller to free up resources
    super.dispose();
  }
}
