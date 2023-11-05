import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:personal_portfolio/constants.dart';
import 'package:personal_portfolio/screens/main/components/area_info_text.dart';
import 'package:personal_portfolio/screens/main/components/coding.dart';
import 'package:personal_portfolio/screens/main/components/knowledges.dart';
import 'package:personal_portfolio/screens/main/components/skills.dart';

import 'my_info.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            const MyInfo(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(defaultPadding),
                child: Column(
                  children: const [
                    AreaInfoText(title: "Residence", text: "Pakistan"),
                    AreaInfoText(title: "City", text: "Karachi"),
                    AreaInfoText(title: "Phone No.", text: "+92 332 0270677"),
                    AreaInfoText(title: "Age", text: "23"),
                    Skills(),
                    SizedBox(height: defaultPadding),
                    Coding(),
                    Knowledges(),
                    //
                    // const Divider(),
                    // const SizedBox(height: defaultPadding / 2),
                    // TextButton(
                    //   onPressed: () {},
                    //   child: FittedBox(
                    //     child: Row(
                    //       children: [
                    //         Text(
                    //           "Download CV",
                    //           style: TextStyle(
                    //               color: Theme.of(context)
                    //                   .textTheme
                    //                   .bodyText1!
                    //                   .color),
                    //         ),
                    //         const SizedBox(width: defaultPadding / 2),
                    //         SvgPicture.asset("assets/icons/download.svg"),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    // Container(
                    //   margin: const EdgeInsets.only(top: defaultPadding),
                    //   color: const Color(0xFF24242E),
                    //   child: Row(
                    //     children: [
                    //       const Spacer(),
                    //       IconButton(
                    //         onPressed: () {},
                    //         icon: SvgPicture.asset("assets/icons/linkedin.svg"),
                    //       ),
                    //       IconButton(
                    //         onPressed: () {},
                    //         icon: SvgPicture.asset("assets/icons/github.svg"),
                    //       ),
                    //       IconButton(
                    //         onPressed: () {},
                    //         icon: SvgPicture.asset("assets/icons/twitter.svg"),
                    //       ),
                    //       const Spacer(),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
