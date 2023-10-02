import 'package:flutter/material.dart';

import '../../../constants.dart';

class HighLight extends StatelessWidget {
  final Widget counter;
  final String? label;
  const HighLight({
    Key? key,
    required this.counter,
    this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        counter,
        const SizedBox(width: defaultPadding / 2),
        Text(
          label.toString(),
          style: Theme.of(context).textTheme.subtitle2,
        )
      ],
    );
  }
}
