import 'package:charts_flutter/flutter.dart' as charts;
import 'package:cuarantine/rep_series.dart';
import 'package:flutter/material.dart';

class RepLineChart extends StatelessWidget {
  final List<charts.Series> repSeriesList;
  final bool animate;

  RepLineChart(this.repSeriesList, {this.animate});

  factory RepLineChart.withSampleData() {
    return new RepLineChart(
      _createSampleData(),
      animate: true, // Disable animations for image tests
    );
  }

  @override
  Widget build(BuildContext context) {
    return new charts.LineChart(
      repSeriesList,
      animate: animate,
      behaviors: [new charts.SeriesLegend()],
      defaultRenderer: new charts.LineRendererConfig(includePoints: true)
    );
  }

  static List<charts.Series<RepSeries, int>> _createSampleData() {
    final squatData = [
      new RepSeries(1, 20),
      new RepSeries(2, 35),
      new RepSeries(3, 40),
      new RepSeries(4, 85),
    ];

    final burpeeData = [
      new RepSeries(1, 25),
      new RepSeries(2, 25),
      new RepSeries(3, 30),
      new RepSeries(4, 60),
    ];

    final CrunchesData = [
      new RepSeries(1, 30),
      new RepSeries(2, 40),
      new RepSeries(3, 70),
      new RepSeries(4, 100),
    ];

    final PushUpsData = [
      new RepSeries(1, 30),
      new RepSeries(2, 55),
      new RepSeries(3, 70),
      new RepSeries(4, 85),
    ];


    return [
      new charts.Series<RepSeries, int>(
        id: 'Squats',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (RepSeries reps, _) => reps.week,
        measureFn: (RepSeries reps, _) => reps.reps,
        data: squatData
      ),
      new charts.Series<RepSeries, int>(
          id: 'Burpees',
          colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
          domainFn: (RepSeries reps, _) => reps.week,
          measureFn: (RepSeries reps, _) => reps.reps,
          data: burpeeData
      ),

      new charts.Series<RepSeries, int>(
          id: 'Crunches',
          colorFn: (_, __) => charts.MaterialPalette.pink.shadeDefault,
          domainFn: (RepSeries reps, _) => reps.week,
          measureFn: (RepSeries reps, _) => reps.reps,
          data: CrunchesData
      ),

      new charts.Series<RepSeries, int>(
          id: 'PushUps',
          colorFn: (_, __) => charts.MaterialPalette.purple.shadeDefault,
          domainFn: (RepSeries reps, _) => reps.week,
          measureFn: (RepSeries reps, _) => reps.reps,
          data: PushUpsData
      )

    ];
  }
}
