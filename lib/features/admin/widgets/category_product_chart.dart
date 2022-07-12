// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

import 'package:amazon_clone/features/admin/models/sales.dart';

class CategoryProductChart extends StatelessWidget {
  final List<charts.Series<Sales, String>> seriesList;
  const CategoryProductChart({
    Key? key,
    required this.seriesList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return charts.BarChart(
      seriesList,
      animate: true,
      barRendererDecorator: charts.BarLabelDecorator<String>(
        labelPosition: charts.BarLabelPosition.inside,
      ),
      domainAxis: charts.OrdinalAxisSpec(),
    );
  }
}
