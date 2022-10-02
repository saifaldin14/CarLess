import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SlidingView extends StatelessWidget {
  const SlidingView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      height: 140.0,
      child: ListView.separated(
        itemCount: 10,
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            width: 10,
          );
        },
        itemBuilder: (_, i) => IconButton(
          onPressed: () {},
          icon: Icon(MdiIcons.home),
          color: Colors.blueAccent,
        ),
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
