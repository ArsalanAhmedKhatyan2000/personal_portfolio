import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:personal_portfolio/constants.dart';
import 'package:personal_portfolio/responsive.dart';
import 'package:personal_portfolio/services/launch_url_services.dart';
import 'components/side_menu.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key, required this.children}) : super(key: key);
  final List<Widget> children;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  ScrollController scrollController = ScrollController();
  bool isVisible = false;
  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.pixels >
          scrollController.position.minScrollExtent) {
        setState(() => isVisible = true);
      } else {
        setState(() => isVisible = false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Responsive.isDesktop(context)
          ? null
          : AppBar(
              backgroundColor: bgColor,
              leading: Builder(
                builder: (context) {
                  return IconButton(
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    icon: const Icon(Icons.menu),
                  );
                },
              )),
      drawer: const SideMenu(),
      body: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Now this take (2+7=9) so 2/9=0.22 means 22%
            if (Responsive.isDesktop(context))
              const Expanded(flex: 2, child: SideMenu()),
            // Now this take (2+7=9) so 7/9=0.77 means 78%
            Expanded(
              flex: 7,
              child: Stack(
                children: [
                  SingleChildScrollView(
                    controller: scrollController,
                    child: Column(
                      children: [
                        ...widget.children,
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: defaultPadding / 2,
                        vertical: defaultPadding / 2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () async =>
                              UrlLauncherServices.launchInBrowser(
                                  url: linkedinProfile),
                          child: CircleAvatar(
                            backgroundColor: const Color(0xFF0A66C2),
                            child: SizedBox(
                              width: 18,
                              height: 18,
                              child: SvgPicture.asset(
                                "assets/icons/linkedin_icon.svg",
                                color: const Color(0xFFffffff),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: defaultPadding / 2),
                        InkWell(
                          onTap: () async =>
                              UrlLauncherServices.launchInBrowser(
                                  url: githubProfile),
                          child: CircleAvatar(
                            backgroundColor: const Color(0xFF171515),
                            child: SizedBox(
                              width: 24,
                              height: 24,
                              child: SvgPicture.asset(
                                "assets/icons/github_icon.svg",
                                color: const Color(0xFFffffff),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: defaultPadding / 2),
                        InkWell(
                          onTap: () async =>
                              UrlLauncherServices.launchInBrowser(
                                  url: gmailProfile),
                          child: const CircleAvatar(
                            backgroundColor: Color(0xFFBB001B),
                            child: Icon(Icons.mail,
                                color: Color(0xFFffffff), size: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: isVisible == true
          ? FloatingActionButton(
              backgroundColor: primaryColor,
              foregroundColor: const Color(0xFFffffff),
              onPressed: () {
                scrollController.animateTo(0,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut);
              },
              child: const Icon(Icons.arrow_upward_rounded),
            )
          : null,
    );
  }
}
