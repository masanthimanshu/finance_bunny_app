import 'package:finance_bunny/data/color_data.dart';
import 'package:finance_bunny/model/radial_chart_model.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class RadialChart extends StatelessWidget {
  const RadialChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SfCircularChart(series: [
        RadialBarSeries<RadialChartModel, String>(
          gap: "5%",
          maximumValue: 100,
          trackOpacity: 0.05,
          useSeriesColor: true,
          dataSource: chartData,
          cornerStyle: CornerStyle.bothCurve,
          xValueMapper: (data, index) => chartData[index].type,
          yValueMapper: (data, index) => chartData[index].amount,
          pointColorMapper: (data, index) => colorData[chartData[index].type],
        ),
      ]),
    );
  }
}

final List<RadialChartModel> chartData = [
  const RadialChartModel(type: "Income", amount: 75),
  const RadialChartModel(type: "Expense", amount: 50),
  const RadialChartModel(type: "Savings", amount: 20),
  const RadialChartModel(type: "Investment", amount: 20),
];
