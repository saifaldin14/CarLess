import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class ProfileAvatar extends StatefulWidget {
  const ProfileAvatar({Key key}) : super(key: key);

  @override
  State<ProfileAvatar> createState() => _ProfileAvatarState();
}

class _ProfileAvatarState extends State<ProfileAvatar> {
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
            backgroundColor: Colors.white,
            autoPlay: true,
            autoRotate: true,
            ar: true,
          )),
    );
  }
}
