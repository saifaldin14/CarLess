import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:goldenhack/charts/barGraph.dart';
import 'package:goldenhack/charts/lineGraph.dart';
import 'package:goldenhack/charts/progress.dart';
import 'package:goldenhack/utils/marketplaceAvatars.dart';
import 'package:goldenhack/widget/appbar_widget.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MarketPlace extends StatelessWidget {
  const MarketPlace({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemeSwitchingArea(
        child: Builder(
            builder: (context) => Scaffold(
                appBar: buildAppBar(context),
                body: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(children: [
                      Text(
                        'Select your Avatar',
                        style: TextStyle(fontSize: 48.0),
                      ),
                      Expanded(child: MarketPlaceAvatars())
                    ])))));
  }
}
