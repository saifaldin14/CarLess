import 'package:flutter/material.dart';
import 'package:simple_progress_indicators/simple_progress_indicators.dart';

class ProgressBarGradient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ProgressBar(
        value: 0.85,
        width: MediaQuery.of(context).size.width,
        height: 30,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xff23b6e6),
            const Color(0xff02d39a),
          ],
        ),
      ),
    );
  }
}
