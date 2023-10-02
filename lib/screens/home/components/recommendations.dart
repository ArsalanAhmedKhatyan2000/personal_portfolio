import 'package:flutter/material.dart';
import 'package:personal_portfolio/screens/home/components/recommendation_card.dart';

import '../../../constants.dart';
import '../../../models/Recommendation.dart';

class Recommendations extends StatelessWidget {
  const Recommendations({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Recommendations", style: Theme.of(context).textTheme.headline6),
          const SizedBox(height: defaultPadding),
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                  demo_recommendations.length,
                  (index) => Padding(
                        padding: const EdgeInsets.only(right: defaultPadding),
                        child: RecommendationCard(
                            recommendation: demo_recommendations[index]),
                      )).toList(),
            ),
          ),
          // RecommendationCard(recommendation: demo_recommendations[0]),
        ],
      ),
    );
  }
}
