import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  const Avatar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.black,
      ),
      child: CircleAvatar(
        backgroundImage: NetworkImage(
            'https://media-exp1.licdn.com/dms/image/C4D03AQFgZBilNtPUMA/profile-displayphoto-shrink_800_800/0/1604728137407?e=1632960000&v=beta&t=QKa1Nq3WKWQGEGaiKdZ1ovp1h6uAbwPZfihdqY2_pNU'),
      ),
    );
  }
}
