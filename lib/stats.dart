import 'package:flutter/material.dart';
import 'package:goldenhack/charts/barGraph.dart';
import 'package:goldenhack/charts/lineGraph.dart';
import 'package:goldenhack/charts/progress.dart';
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
                          style: TextStyle(color: Colors.black, fontSize: 24.0),
                        ),
                        ProgressBarGradient(),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            '600 / 750 points',
                            textAlign: TextAlign.right,
                            style:
                                TextStyle(color: Colors.black, fontSize: 15.0),
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
                            style:
                                TextStyle(color: Colors.black, fontSize: 24.0),
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
                            style:
                                TextStyle(color: Colors.black, fontSize: 24.0),
                          ),
                          BarChartSample7()
                        ],
                      ))),
            ])));
  }
}
