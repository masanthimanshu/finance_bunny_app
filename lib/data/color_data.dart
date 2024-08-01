import 'package:flutter/material.dart';

const List<ColorData> colorData = [
  ColorData(name: "Savings", colors: Colors.blue),
  ColorData(name: "Investment", colors: Colors.orange),
  ColorData(name: "Income", colors: Colors.yellow),
  ColorData(name: "Expense", colors: Colors.teal),
];

class ColorData {
  const ColorData({required this.name, required this.colors});

  final String name;
  final Color colors;
}
