import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HomeChart extends StatelessWidget {
  const HomeChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SfCircularChart(series: [
        RadialBarSeries<ChartData, String>(
          gap: "5%",
          maximumValue: 100,
          trackOpacity: 0.1,
          useSeriesColor: true,
          dataSource: chartData,
          cornerStyle: CornerStyle.bothCurve,
          xValueMapper: (data, _) => data.type,
          yValueMapper: (data, _) => data.amount,
          pointColorMapper: (data, _) => data.color,
        ),
      ]),
    );
  }
}

final List<ChartData> chartData = [
  const ChartData(type: "Investments", color: Colors.teal, amount: 52),
  const ChartData(type: "Savings", color: Colors.yellow, amount: 34),
  const ChartData(type: "Expenses", color: Colors.red, amount: 25),
  const ChartData(type: "Income", color: Colors.green, amount: 38),
];

class ChartData {
  const ChartData({
    required this.type,
    required this.color,
    required this.amount,
  });

  final String type;
  final Color color;
  final double amount;
}
