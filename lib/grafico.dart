/// Example of a  line chart.
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SimpleLineChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;
  String nome;
  String ia;

  SimpleLineChart(this.seriesList, {this.animate});

  /// Creates a [LineChart] with sample data and no transition.
  factory SimpleLineChart.withData(List<dynamic> data) {
    return new SimpleLineChart(
      _formatData(data),
      // Disable animations for image tests.
      animate: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new charts.LineChart(
      seriesList,
      animate: animate,
      defaultRenderer:
          new charts.LineRendererConfig(includeArea: true, stacked: true),
      primaryMeasureAxis: new charts.NumericAxisSpec(
        tickProviderSpec: new charts.BasicNumericTickProviderSpec(
            // Make sure we don't have values less than 1 as ticks
            // (ie: counts).
            dataIsInWholeNumbers: false,
            zeroBound: false,
            // Fixed tick count to highlight the integer only behavior
            // generating ticks [0, 1, 2, 3, 4].
            desiredTickCount: 12),
        tickFormatterSpec: charts.BasicNumericTickFormatterSpec(
          _formatterMeasureAxis,
        ),
        // renderSpec: new charts.SmallTickRendererSpec(
        //     labelRotation: -10,
        //     labelJustification: charts.TickLabelJustification.outside,
        //     labelAnchor: charts.TickLabelAnchor.before, )
      ),
      behaviors: [
        new charts.ChartTitle('Posição em relação ao tempo usando uma SVM',
            titleStyleSpec: charts.TextStyleSpec(
              fontFamily: 'Montserrat',
              color: charts.MaterialPalette.black,
              fontSize: 15,
            ),
            behaviorPosition: charts.BehaviorPosition.top,
            titleOutsideJustification: charts.OutsideJustification.start,
            innerPadding: 18),
        // new charts.ChartTitle('Bottom title text',
        //     behaviorPosition: charts.BehaviorPosition.bottom,
        //     titleOutsideJustification:
        //         charts.OutsideJustification.middleDrawArea),
        // new charts.ChartTitle('Start title',
        //     behaviorPosition: charts.BehaviorPosition.start,
        //     titleOutsideJustification:
        //         charts.OutsideJustification.middleDrawArea),
      ],
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<Dado, double>> _formatData(List<dynamic> data) {
    double time = -2.56;
    List<Dado> array = new List<Dado>();
    int last = -1;
    bool queda = false;

    data.forEach((element) {
      time += 2.56;
      if (last == 5 && element == 6) {
        queda = true;
      }
      last = element;
      array.add(new Dado(time, element));
    });

    return [
      new charts.Series<Dado, double>(
        id: "SVM",
        colorFn: (Dado data, __) => queda == true
            ? charts.MaterialPalette.red.shadeDefault
            : charts.MaterialPalette.blue.shadeDefault,
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

// ignore: missing_return
String _formatterMeasureAxis(num y) {
  int i = y.toInt();
  switch (i) {
    case 1:
      return 'Caminhando';
      break;
    case 2:
      return 'Subindo escada';
      break;
    case 3:
      return 'Descendo escada';
      break;
    case 4:
      return 'Sentado';
      break;
    case 5:
      return 'Em pé';
      break;
    case 6:
      return 'Deitado';
      break;
    case 7:
      return 'Em pé para Sentado';
      break;
    case 8:
      return 'Sentado para Em pé';
      break;
    case 9:
      return 'Sentado para Deitado';
      break;
    case 10:
      return 'Deitado para Sentado';
      break;
    case 11:
      return 'Em pé para Deitado';
      break;
    case 12:
      return 'Deitado para Em pé';
      break;
  }
}
