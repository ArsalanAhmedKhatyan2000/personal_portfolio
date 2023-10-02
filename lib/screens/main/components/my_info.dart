import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:path_provider/path_provider.dart';
import 'package:personal_portfolio/constants.dart';
import 'package:personal_portfolio/services/launch_url_services.dart';

import '../../../services/file_save_services.dart';

class MyInfo extends StatelessWidget {
  const MyInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // aspectRatio: 1.23,
    return Container(
      color: const Color(0xFF242430),
      padding: const EdgeInsets.symmetric(
          horizontal: defaultPadding, vertical: defaultPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // const Spacer(flex: 2),
          const CircleAvatar(
            radius: 50,
            backgroundColor: Color(0xFFffffff),
            backgroundImage: AssetImage("assets/images/my_profile_picture.png"),
          ),
          const SizedBox(height: defaultPadding / 3),
          Text("Arsalan Ahmed Khatyan",
              style: Theme.of(context).textTheme.subtitle2),
          const Text(
            "Software Engineer",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w200,
              height: 1.5,
            ),
          ),
          const SizedBox(height: defaultPadding / 2),
          ElevatedButton(
            onPressed: () async {
              print("Start");
              try {
                if (kIsWeb) {
                  // Some web specific code there
                } else if (defaultTargetPlatform == TargetPlatform.iOS ||
                    defaultTargetPlatform == TargetPlatform.android) {
                  // Some android/ios specific code
                } else if (defaultTargetPlatform == TargetPlatform.linux ||
                    defaultTargetPlatform == TargetPlatform.macOS ||
                    defaultTargetPlatform == TargetPlatform.windows ||
                    defaultTargetPlatform == TargetPlatform.fuchsia) {
                  // Some desktop specific code there
                }
              } catch (e) {
                debugPrint("Error : $e");
              }
              print("end");
            },
            style: TextButton.styleFrom(
              backgroundColor: primaryColor,
              foregroundColor: const Color(0xFFffffff),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Download CV",
                  style: TextStyle(
                    // color: Theme.of(context).textTheme.bodyText1!.color,
                    color: Color(0xFFffffff),
                  ),
                ),
                const SizedBox(width: defaultPadding / 2),
                SvgPicture.asset("assets/icons/download.svg",
                    color: const Color(0xFFffffff)),
              ],
            ),
          ),
          // const Spacer(flex: 2),
        ],
      ),
    );
  }
}
