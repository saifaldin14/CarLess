import 'package:flutter/material.dart';
import 'package:goldenhack/graph.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Stats extends StatelessWidget {
  const Stats({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Stats"),
          leading: BackButton(
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Center(child: LineChartSample2()));
  }
}
