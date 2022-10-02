import 'package:babylonjs_viewer/babylonjs_viewer.dart';
import 'package:flutter/material.dart';
import 'package:goldenhack/charts/barGraph.dart';
import 'package:goldenhack/charts/lineGraph.dart';
import 'package:goldenhack/charts/progress.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Profile extends StatelessWidget {
  const Profile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Profile"),
          leading: BackButton(
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: BabylonJSViewer(
            src: 'https://models.babylonjs.com/boombox.glb',
          ),
        ));
  }
}
