import 'package:flutter/material.dart';
import 'package:goldenhack/widget/appbar_widget.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class ProfileAvatar extends StatefulWidget {
  final String assetPath;
  final String assetName;
  const ProfileAvatar({Key key, this.assetPath, this.assetName})
      : super(key: key);

  @override
  State<ProfileAvatar> createState() => _ProfileAvatarState();
}

class _ProfileAvatarState extends State<ProfileAvatar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, widget.assetName),
      body: Padding(
          padding: EdgeInsets.all(20),
          child: ModelViewer(
            src: widget.assetPath,
            backgroundColor: Colors.white,
            autoPlay: true,
            autoRotate: true,
            ar: true,
          )),
    );
  }
}
