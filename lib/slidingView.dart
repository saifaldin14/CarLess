import 'package:flutter/material.dart';
import 'package:goldenhack/avatar.dart';

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
        itemBuilder: (_, i) => Avatar(),
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
