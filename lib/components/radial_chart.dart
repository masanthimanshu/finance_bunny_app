import 'package:finance_bunny/data/color_data.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class RadialChart extends StatelessWidget {
  const RadialChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SfCircularChart(series: [
        RadialBarSeries(
          gap: "5%",
          maximumValue: 100,
          trackOpacity: 0.05,
          useSeriesColor: true,
          dataSource: chartData,
          cornerStyle: CornerStyle.bothCurve,
          yValueMapper: (data, index) => chartData[index],
          xValueMapper: (data, index) => colorData[index].name,
          pointColorMapper: (data, index) => colorData[index].colors,
        ),
      ]),
    );
  }
}

final List<int> chartData = [10, 10, 20, 50];
