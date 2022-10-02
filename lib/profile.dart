import 'package:flutter/material.dart';
import 'package:goldenhack/charts/barGraph.dart';
import 'package:goldenhack/charts/lineGraph.dart';
import 'package:goldenhack/charts/progress.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class Profile extends StatefulWidget {
  const Profile({Key key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
            child: ModelViewer(
              src: 'assets/Xbot.glb',
              backgroundColor: Colors.red,
              autoPlay: true,
              autoRotate: true,
              ar: true,
            )));
  }
}
