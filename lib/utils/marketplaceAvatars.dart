import 'package:flutter/material.dart';
import 'package:goldenhack/pages/profileAvatar.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MarketPlaceAvatars extends StatelessWidget {
  const MarketPlaceAvatars({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) => ProfileAvatar(
                              assetPath: 'assets/cute1.glb',
                              assetName: 'Angry Blob')));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: CircleBorder(),
                )),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) => ProfileAvatar(
                              assetPath: 'assets/cute2.glb',
                              assetName: 'Broken Heart')));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  shape: CircleBorder(),
                )),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) => ProfileAvatar(
                              assetPath: 'assets/cute3.glb',
                              assetName: 'Smiley Blues')));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  shape: CircleBorder(),
                )),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) => ProfileAvatar(
                              assetPath: 'assets/cute1.glb',
                              assetName: 'Angry Blob')));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow,
                  shape: CircleBorder(),
                )),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) => ProfileAvatar(
                              assetPath: 'assets/cute1.glb',
                              assetName: 'Angry Blob')));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: CircleBorder(),
                )),
          )
        ]);
  }
}
