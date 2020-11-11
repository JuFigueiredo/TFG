/// Example of a  line chart.
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

/// Grafico de Linhas
class SimpleLineChart extends StatelessWidget {
  /// Lista de Graficos
  final List<charts.Series> seriesList;

  /// Flag
  final bool animate;

  /// Construtor
  SimpleLineChart(this.seriesList, {this.animate});

  /// Creates a [LineChart] with sample data and no transition.
  factory SimpleLineChart.withData(List<dynamic> data) {
    return SimpleLineChart(
      _formatData(data),
      // Disable animations for image tests.
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return charts.NumericComboChart(
      seriesList,
      animate: animate,
      defaultRenderer: charts.LineRendererConfig(
        includeArea: true,
        stacked: true,
      ),
      customSeriesRenderers: [
        charts.PointRendererConfig(
          // ID used to link series to this renderer.
          customRendererId: 'customPoint',
        )
      ],
      primaryMeasureAxis: charts.NumericAxisSpec(
        tickProviderSpec: charts.BasicNumericTickProviderSpec(
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
        charts.SeriesLegend(horizontalFirst: true),
      ],
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<Dado, double>> _formatData(List<dynamic> data) {
    var time = -2.56;
    var array = <Dado>[];
    var quedas = <Dado>[];
    var last = -1;

    // ignore: avoid_function_literals_in_foreach_calls
    data.forEach((element) {
      time += 2.56;
      if (last == 5 && element == 6) {
        var queda = Dado(time, element);
        quedas.add(queda);
      }
      last = element;
      var pos = Dado(time, element);
      array.add(pos);
    });

    // Dado test = new Dado(2, 6);
    // print('Posicao {${test.posicao}}');
    // print('Tempo {${test.tempo}}');

    return [
      charts.Series<Dado, double>(
        id: 'Posição em relação ao tempo',
        colorFn: (data, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (data, _) => data.tempo,
        measureFn: (data, _) => data.posicao,
        data: array,
      ),
      charts.Series<Dado, double>(
        id: 'Ocorrência de queda',
        colorFn: (data, __) => charts.MaterialPalette.red.shadeDefault.darker,
        domainFn: (data, _) => data.tempo,
        measureFn: (data, _) => data.posicao - 6,
        data: quedas,
      )
    ];
  }
}

/// Sample linear data type.
class Dado {
  /// Eixo x em segundos
  final double tempo;

  /// Eixo y resultado do Machine Learning
  final int posicao;

  /// Construtor
  Dado(this.tempo, this.posicao);
}

// ignore: missing_return
String _formatterMeasureAxis(num y) {
  var i = y.toInt();
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
