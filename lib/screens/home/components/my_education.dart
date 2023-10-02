import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

import '../../../constants.dart';
import '../../../models/education.dart';
import '../../../responsive.dart';
import 'education_card.dart';

class MyEducation extends StatelessWidget {
  const MyEducation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("My Education", style: Theme.of(context).textTheme.headline6),
          const SizedBox(height: defaultPadding),
          Timeline.tileBuilder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            theme: TimelineThemeData(
                color: primaryColor, direction: Axis.vertical),
            builder: TimelineTileBuilder.connectedFromStyle(
              itemCount: demo_educations.length,
              connectionDirection: ConnectionDirection.before,
              connectorStyleBuilder: (context, index) =>
                  ConnectorStyle.solidLine,
              firstConnectorStyle: ConnectorStyle.transparent,
              lastConnectorStyle: ConnectorStyle.transparent,
              indicatorStyleBuilder: (context, index) =>
                  IndicatorStyle.outlined,
              contentsAlign: ContentsAlign.basic,
              nodePositionBuilder: (context, index) =>
                  Responsive.isDesktop(context) ? 0.3 : 0,
              contentsBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                      top: index == 0 ? 0 : defaultPadding,
                      left: defaultPadding / 2),
                  child: EducaionCard(education: demo_educations[index]),
                );
              },
              oppositeContentsBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                      top: index == 0 ? 0 : defaultPadding,
                      right: defaultPadding / 2,
                      left: defaultPadding / 2),
                  child: Container(
                    padding: const EdgeInsets.all(defaultPadding / 3),
                    decoration: const BoxDecoration(
                        color: Color(0xffFFFFFF),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Text(
                      "${demo_educations[index].duration}",
                      style: Theme.of(context).textTheme.subtitle2!.copyWith(
                          color: const Color(0xff000000), fontSize: 10),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
