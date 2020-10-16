/// Example of a  line chart.
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class SimpleLineChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  SimpleLineChart(this.seriesList, {this.animate});

  /// Creates a [LineChart] with sample data and no transition.
  factory SimpleLineChart.withData(List<dynamic> data, String nome, String ia) {
    return new SimpleLineChart(
      _formatData(data, nome, ia),
      // Disable animations for image tests.
      animate: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new charts.LineChart(
      seriesList,
      animate: animate,
      primaryMeasureAxis: new charts.NumericAxisSpec(
          tickProviderSpec: new charts.BasicNumericTickProviderSpec(
              // Make sure we don't have values less than 1 as ticks
              // (ie: counts).
              dataIsInWholeNumbers: true,
              zeroBound: false,
              // Fixed tick count to highlight the integer only behavior
              // generating ticks [0, 1, 2, 3, 4].
              desiredTickCount: 12)),
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<Dado, double>> _formatData(
      List<dynamic> data, String nome, String ia) {
    double time = -2.56;
    List<Dado> array = new List<Dado>();
    int last;
    bool queda = false;
    data.forEach((element) {
      time += 2.56;
      last = element;
      if (last == 5 && element == 6) {
        queda = true;
      }
      array.add(new Dado(time, element));
    });

    return [
      new charts.Series<Dado, double>(
        id: 'Previsão dos movimentos de ' + nome + 'usando uma ' + ia,
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (Dado data, _) => data.tempo,
        measureFn: (Dado data, _) => data.posicao,
        data: array,
      )
    ];
  }
}

/// Sample linear data type.
class Dado {
  final double tempo;
  final int posicao;

  Dado(this.tempo, this.posicao);
}
