import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:goldenhack/charts/barGraph.dart';
import 'package:goldenhack/charts/lineGraph.dart';
import 'package:goldenhack/charts/progress.dart';
import 'package:goldenhack/widget/appbar_widget.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Stats extends StatelessWidget {
  const Stats({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemeSwitchingArea(
        child: Builder(
            builder: (context) => Scaffold(
                appBar: buildAppBar(context, 'Stats'),
                body: Padding(
                    padding: EdgeInsets.all(20),
                    child: ListView(children: [
                      Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Padding(
                              padding: EdgeInsets.all(20),
                              child: Column(children: [
                                Text(
                                  'Current Level: 5',
                                  style: TextStyle(fontSize: 24.0),
                                ),
                                ProgressBarGradient(),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    '600 / 750 points',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(fontSize: 15.0),
                                  ),
                                ),
                              ]))),
                      Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Padding(
                              padding: EdgeInsets.all(20),
                              child: Column(
                                children: [
                                  Text(
                                    'CO2 Emission Savings',
                                    style: TextStyle(fontSize: 24.0),
                                  ),
                                  LineChartSample2(),
                                ],
                              ))),
                      Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Padding(
                              padding: EdgeInsets.all(20),
                              child: Column(
                                children: [
                                  Text(
                                    'Weekly Leader Board',
                                    style: TextStyle(fontSize: 24.0),
                                  ),
                                  BarChartSample7()
                                ],
                              ))),
                    ])))));
  }
}
