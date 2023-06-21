import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class VarliklarSayfasi extends StatelessWidget {
  final List<PieChartSectionData> data = [
    PieChartSectionData(
      value: 35,
      title: 'Hisse Senedi\n %35',
      color: Colors.blue,
      radius: 160,
      titleStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    PieChartSectionData(
      value: 15,
      title: 'Döviz \n %15',
      color: Colors.green,
      radius: 160,
      titleStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    PieChartSectionData(
      value: 30,
      title: 'Yatırım Fonu \n %30',
      color: Colors.orange,
      radius: 160,
      titleStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    PieChartSectionData(
      value: 20,
      title: 'Türk Lirasi\n %20',
      color: Colors.red,
      radius: 160,
      titleStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white38,
        title: Text('Varlıklarım',style: TextStyle(color: Colors.black),),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Varlık Dağılımı',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            AspectRatio(
              aspectRatio: 1,
              child: PieChart(
                PieChartData(
                  sections: data,
                  borderData: FlBorderData(show: false),
                  centerSpaceRadius: 0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




