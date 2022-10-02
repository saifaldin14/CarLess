import 'package:flutter/material.dart';
import 'package:animated_radial_menu/animated_radial_menu.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:goldenhack/widget/appbar_widget.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Games extends StatelessWidget {
  const Games({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemeSwitchingArea(
      child: Builder(
        builder: (context) => Scaffold(
          appBar: buildAppBar(context, 'Games'),
          body: Padding(
            padding: EdgeInsets.all(20),
            child: Stack(
              children: [
                Text(
                  'Choose a Game on your Route!',
                  style: TextStyle(fontSize: 24.0),
                ),
                RadialMenu(
                  children: [
                    RadialButton(
                        icon: Icon(Icons.grid_3x3),
                        buttonColor: Colors.teal,
                        onPress: () {}),
                    RadialButton(
                        icon: Icon(MdiIcons.snake),
                        buttonColor: Colors.green,
                        onPress: () {}),
                    RadialButton(
                        icon: Icon(Icons.map),
                        buttonColor: Colors.orange,
                        onPress: () {}),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
