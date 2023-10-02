import 'package:flutter/material.dart';

import '../../../components/animated_linear_progress_indicator.dart';
import '../../../constants.dart';

class Coding extends StatelessWidget {
  const Coding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        // const Divider(),
        // Padding(
        //     padding: const EdgeInsets.symmetric(vertical: defaultPadding),
        //     child:
        //         Text("Coding", style: Theme.of(context).textTheme.subtitle2)),
        SizedBox(height: defaultPadding),
        AnimatedLinearProgressIndicator(label: "Flutter", percentage: 0.8),
        AnimatedLinearProgressIndicator(label: "Dart", percentage: 0.7),
        AnimatedLinearProgressIndicator(label: "MongoDB", percentage: 0.80),
        AnimatedLinearProgressIndicator(label: "Firebase", percentage: 0.65),
        AnimatedLinearProgressIndicator(label: "SQL", percentage: 0.55),
        AnimatedLinearProgressIndicator(label: "Node JS", percentage: 0.5),
        AnimatedLinearProgressIndicator(label: "Express JS", percentage: 0.5),
        AnimatedLinearProgressIndicator(label: "HTML", percentage: 0.9),
        AnimatedLinearProgressIndicator(label: "CSS", percentage: 0.75),
        AnimatedLinearProgressIndicator(label: "Bootstrap", percentage: 0.60),
      ],
    );
  }
}
