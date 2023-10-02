import 'package:flutter/material.dart';
import 'package:personal_portfolio/responsive.dart';

import '../../../components/animated_counter.dart';
import '../../../constants.dart';
import 'high_light.dart';

class HighLightInfo extends StatelessWidget {
  const HighLightInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
      child: Responsive.isMobileLarge(context)
          ? Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    HighLight(
                        label: "Subscribers",
                        counter: AnimatedCounter(value: 119, text: "K+")),
                    HighLight(
                        label: "Videos",
                        counter: AnimatedCounter(value: 40, text: "+")),
                  ],
                ),
                const SizedBox(height: defaultPadding),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    HighLight(
                        label: "Github Projects",
                        counter: AnimatedCounter(value: 30, text: "+")),
                    HighLight(
                        label: "Stars",
                        counter: AnimatedCounter(value: 13, text: "K+")),
                  ],
                ),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                HighLight(
                    label: "Subscribers",
                    counter: AnimatedCounter(value: 119, text: "K+")),
                HighLight(
                    label: "Videos",
                    counter: AnimatedCounter(value: 40, text: "+")),
                HighLight(
                    label: "Github Projects",
                    counter: AnimatedCounter(value: 30, text: "+")),
                HighLight(
                    label: "Stars",
                    counter: AnimatedCounter(value: 13, text: "K+")),
              ],
            ),
    );
  }
}
