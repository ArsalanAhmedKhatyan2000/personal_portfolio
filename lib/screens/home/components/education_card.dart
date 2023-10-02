import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/education.dart';
import '../../../responsive.dart';

class EducaionCard extends StatelessWidget {
  final Education education;
  const EducaionCard({Key? key, required this.education}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 350,
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.all(defaultPadding / 2),
      decoration: const BoxDecoration(color: secondaryColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${education.institute}",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.subtitle2,
          ),
          Visibility(
            visible: Responsive.isDesktop(context) == false,
            child: Text(
              "${education.duration}",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text(
            "${education.description}",
            maxLines: Responsive.isDesktop(context) ? 2 : 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(height: 1.5),
          ),
        ],
      ),
    );
  }
}
