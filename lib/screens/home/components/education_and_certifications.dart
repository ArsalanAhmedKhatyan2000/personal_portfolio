import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../responsive.dart';
import 'my_certifications.dart';
import 'my_education.dart';

class EducationAndCertifications extends StatelessWidget {
  const EducationAndCertifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive.isMobile(context)
        ? Column(
            children: const [
              MyEducation(),
              SizedBox(height: defaultPadding),
              MyCertifications(),
            ],
          )
        : Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Expanded(child: MyEducation()),
              Expanded(child: MyCertifications()),
            ],
          );
  }
}
