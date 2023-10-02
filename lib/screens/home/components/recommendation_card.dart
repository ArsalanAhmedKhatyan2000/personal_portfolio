import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/Recommendation.dart';

class RecommendationCard extends StatelessWidget {
  final Recommendation recommendation;
  const RecommendationCard({super.key, required this.recommendation});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      padding: const EdgeInsets.all(defaultPadding),
      color: secondaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            recommendation.name.toString(),
            style: Theme.of(context).textTheme.subtitle2,
          ),
          Text(recommendation.source.toString()),
          const SizedBox(height: defaultPadding),
          Text(
            recommendation.text.toString(),
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(height: 1.5),
          ),
        ],
      ),
    );
  }
}
