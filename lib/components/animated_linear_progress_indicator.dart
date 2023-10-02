import 'package:flutter/material.dart';

import '../constants.dart';

class AnimatedLinearProgressIndicator extends StatelessWidget {
  final double percentage;
  final String label;
  const AnimatedLinearProgressIndicator({
    Key? key,
    required this.percentage,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: defaultPadding),
      child: TweenAnimationBuilder(
          tween: Tween<double>(begin: 0, end: percentage),
          duration: defaultDuration,
          builder: (context, double value, child) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(label, style: const TextStyle(color: Colors.white)),
                    Text("${(value * 100).toInt()}%",
                        style: const TextStyle(color: Colors.white)),
                  ],
                ),
                const SizedBox(height: defaultPadding / 2),
                LinearProgressIndicator(
                  value: value,
                  color: primaryColor,
                  backgroundColor: darkColor,
                ),
              ],
            );
          }),
    );
  }
}
