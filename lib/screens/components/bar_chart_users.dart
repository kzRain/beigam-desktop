import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:beigam_desktop/constants/constants.dart';

class BarChartUsers extends StatelessWidget {
  const BarChartUsers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BarChart(BarChartData(
        borderData: FlBorderData(border: Border.all(width: 0)),
        groupsSpace: 15,
        titlesData: FlTitlesData(
            show: true,
            bottomTitles: AxisTitles(
                sideTitles: SideTitles(
              showTitles: true,
              interval: appPadding,
              getTitlesWidget: (value, meta) {
                String text = '';
                if (value == 2) {
                  text = 'jan 6';
                }
                if (value == 4) {
                  text = 'jan 8';
                }
                if (value == 6) {
                  text = 'jan 10';
                }
                if (value == 8) {
                  text = 'jan 12';
                }
                if (value == 10) {
                  text = 'jan 14';
                }
                if (value == 12) {
                  text = 'jan 16';
                }
                if (value == 14) {
                  text = 'jan 18';
                } else {
                  text = '';
                }
                return Text(
                  text,
                  style: const TextStyle(
                    color: lightTextColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                );
              },
            )),
            leftTitles: AxisTitles(
                sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                String text = '';
                if (value == 2) {
                  text = '1K';
                }
                if (value == 6) {
                  text = '2K';
                }
                if (value == 10) {
                  text = '3K';
                }
                if (value == 14) {
                  text = '4K';
                } else {
                  text = '';
                }
                return Text(
                  text,
                  style: const TextStyle(
                    color: lightTextColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                );
              },
              interval: appPadding,
            ))),
        barGroups: [
          BarChartGroupData(x: 1, barRods: [
            BarChartRodData(
                toY: 10,
                width: 20,
                color: primaryColor,
                borderRadius: BorderRadius.circular(5))
          ]),
          BarChartGroupData(x: 2, barRods: [
            BarChartRodData(
                toY: 3,
                width: 20,
                color: primaryColor,
                borderRadius: BorderRadius.circular(5))
          ]),
          BarChartGroupData(x: 3, barRods: [
            BarChartRodData(
                toY: 12,
                width: 20,
                color: primaryColor,
                borderRadius: BorderRadius.circular(5))
          ]),
          BarChartGroupData(x: 4, barRods: [
            BarChartRodData(
                toY: 8,
                width: 20,
                color: primaryColor,
                borderRadius: BorderRadius.circular(5))
          ]),
          BarChartGroupData(x: 5, barRods: [
            BarChartRodData(
                toY: 6,
                width: 20,
                color: primaryColor,
                borderRadius: BorderRadius.circular(5))
          ]),
          BarChartGroupData(x: 6, barRods: [
            BarChartRodData(
                toY: 10,
                width: 20,
                color: primaryColor,
                borderRadius: BorderRadius.circular(5))
          ]),
          BarChartGroupData(x: 7, barRods: [
            BarChartRodData(
                toY: 16,
                width: 20,
                color: primaryColor,
                borderRadius: BorderRadius.circular(5))
          ]),
          BarChartGroupData(x: 8, barRods: [
            BarChartRodData(
                toY: 6,
                width: 20,
                color: primaryColor,
                borderRadius: BorderRadius.circular(5))
          ]),
          BarChartGroupData(x: 9, barRods: [
            BarChartRodData(
                toY: 4,
                width: 20,
                color: primaryColor,
                borderRadius: BorderRadius.circular(5))
          ]),
          BarChartGroupData(x: 10, barRods: [
            BarChartRodData(
                toY: 9,
                width: 20,
                color: primaryColor,
                borderRadius: BorderRadius.circular(5))
          ]),
          BarChartGroupData(x: 11, barRods: [
            BarChartRodData(
                toY: 12,
                width: 20,
                color: primaryColor,
                borderRadius: BorderRadius.circular(5))
          ]),
          BarChartGroupData(x: 12, barRods: [
            BarChartRodData(
                toY: 2,
                width: 20,
                color: primaryColor,
                borderRadius: BorderRadius.circular(5))
          ]),
          BarChartGroupData(x: 13, barRods: [
            BarChartRodData(
                toY: 13,
                width: 20,
                color: primaryColor,
                borderRadius: BorderRadius.circular(5))
          ]),
          BarChartGroupData(x: 14, barRods: [
            BarChartRodData(
                toY: 15,
                width: 20,
                color: primaryColor,
                borderRadius: BorderRadius.circular(5))
          ]),
        ]));
  }
}
