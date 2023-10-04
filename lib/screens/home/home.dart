import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:personal_portfolio/models/project.dart';
import 'package:personal_portfolio/screens/home/components/recommendations.dart';
import 'package:personal_portfolio/screens/main/main_screen.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../constants.dart';
import '../../responsive.dart';
import 'components/education_and_certifications.dart';
import 'components/high_light_info.dart';
import 'components/home_banner.dart';
import 'components/my_services.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MainScreen(
      children: [
        HomeBanner(),
        SizedBox(height: defaultPadding),
        HighLightInfo(),
        SizedBox(height: defaultPadding),
        EducationAndCertifications(),
        SizedBox(height: defaultPadding),
        MyServices(),
        SizedBox(height: defaultPadding),
        MyProjectsSection(),
        // SizedBox(height: defaultPadding),
        // MyProjects(),
        SizedBox(height: defaultPadding),
        Recommendations(),
        SizedBox(height: defaultPadding),
      ],
    );
  }
}

// My Project Section
class MyProjectsSection extends StatelessWidget {
  const MyProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("My Projects", style: Theme.of(context).textTheme.headline6),
          const SizedBox(height: defaultPadding),
          const MyProjectsSectionGridView(),
        ],
      ),
    );
  }
}

class MyProjectsSectionGridView extends StatelessWidget {
  const MyProjectsSectionGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, boxConstraints) {
        return SizedBox(
          width: double.infinity,
          child: Wrap(
            direction: Axis.horizontal,
            spacing: defaultPadding,
            runSpacing: defaultPadding,
            children: List.generate(demo_projects.length, (index) {
              Project project = demo_projects[index];
              return SizedBox(
                width: Responsive.isMobile(context) ||
                        Responsive.isMobileLarge(context)
                    ? (boxConstraints.maxWidth)
                    : Responsive.isTablet(context)
                        ? (boxConstraints.maxWidth - defaultPadding) / 2
                        : (boxConstraints.maxWidth - defaultPadding * 2) / 3,
                child: ProjectSectionCard(project: project),
              );
            }),
          ),
        );
      },
    );
  }
}

class ProjectSectionCard extends StatefulWidget {
  final Project project;
  const ProjectSectionCard({Key? key, required this.project}) : super(key: key);

  @override
  State<ProjectSectionCard> createState() => _ProjectSectionCardState();
}

class _ProjectSectionCardState extends State<ProjectSectionCard> {
  bool ishover = false;
  @override
  Widget build(BuildContext context) {
    var cardBorderRadius = const BorderRadius.all(Radius.circular(10));
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return ProjectDetailsDialog(project: widget.project);
          },
        );
      },
      onHover: (value) => setState(() => ishover = value),
      borderRadius: cardBorderRadius,
      child: AnimatedContainer(
        curve: Curves.linear,
        duration: const Duration(milliseconds: 500),
        padding: const EdgeInsets.all(defaultPadding),
        decoration: BoxDecoration(
          color: ishover ? primaryColor : secondaryColor,
          borderRadius: cardBorderRadius,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              widget.project.imageUrlList![0].toString(),
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: defaultPadding / 2),
            Text(
              widget.project.title.toString(),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.subtitle2,
            ),
            const SizedBox(height: defaultPadding / 2),
            Text(
              widget.project.description.toString(),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  height: 1.5, color: ishover ? const Color(0xffFFFFFF) : null),
            ),
          ],
        ),
      ),
    );
  }
}

class ProjectDetailsDialog extends StatefulWidget {
  final Project project;
  const ProjectDetailsDialog({Key? key, required this.project})
      : super(key: key);

  @override
  State<ProjectDetailsDialog> createState() => _ProjectDetailsDialogState();
}

class _ProjectDetailsDialogState extends State<ProjectDetailsDialog> {
  int imageSliderPage = 0;

  void changeImageSliderPage({required int imageSliderNewPage}) {
    setState(() => imageSliderPage = imageSliderNewPage);
  }

  @override
  Widget build(BuildContext context) {
    double dialogWidth = MediaQuery.of(context).size.width * 0.5;
    return LayoutBuilder(
      builder: (context, boxConstraints) {
        var dialogBorderRadius = const BorderRadius.all(Radius.circular(10));
        return Dialog(
          backgroundColor: secondaryColor,
          shape: RoundedRectangleBorder(borderRadius: dialogBorderRadius),
          child: SingleChildScrollView(
            child: Container(
              width: boxConstraints.maxWidth * 0.5,
              padding: const EdgeInsets.all(defaultPadding),
              decoration: BoxDecoration(
                borderRadius: dialogBorderRadius,
              ),
              child: Stack(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // AspectRatio(
                      //   aspectRatio: 1.9, // 2.5
                      //   child: Image.asset(project.imageURL.toString(),
                      //       fit: BoxFit.cover),
                      // ),
                      CarouselSlider(
                          items: widget.project.imageUrlList?.map((imageURL) {
                            return Image.asset(imageURL.toString());
                          }).toList(),
                          options: CarouselOptions(
                            height: 250,
                            aspectRatio: 16 / 9,
                            viewportFraction: 0.8,
                            initialPage: 0,
                            enableInfiniteScroll: true,
                            reverse: false,
                            autoPlay: true,
                            autoPlayInterval: const Duration(seconds: 3),
                            autoPlayAnimationDuration:
                                const Duration(milliseconds: 800),
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enlargeCenterPage: true,
                            enlargeFactor: 0.3,
                            onPageChanged: (index, reason) =>
                                changeImageSliderPage(
                                    imageSliderNewPage: index),
                            scrollDirection: Axis.horizontal,
                          )),
                      const SizedBox(height: defaultPadding / 2),
                      SizedBox(
                        height: 10,
                        child: ListView.separated(
                          itemCount: widget.project.imageUrlList!.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (context, index) =>
                              const SizedBox(width: 5),
                          itemBuilder: (context, index) {
                            return imageSliderPage == index
                                ? const Icon(Icons.radio_button_checked_rounded,
                                    size: 10, color: primaryColor)
                                : const Icon(Icons.radio_button_off_rounded,
                                    size: 10, color: Color(0xffFFFFFF));
                          },
                        ),
                      ),
                      const SizedBox(height: defaultPadding / 2),
                      Text(
                        widget.project.title.toString(),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.subtitle2!.copyWith(
                            fontSize: Responsive.isDesktop(context) ? 24 : 20),
                      ),
                      const SizedBox(height: defaultPadding / 2),
                      Text(
                        widget.project.description.toString(),
                        style: const TextStyle(height: 1.5),
                      ),
                      const SizedBox(height: defaultPadding / 2),
                      QrImage(
                        data:
                            'https://drive.google.com/file/d/1SgZIupzSlibYt1r19yi0ULFWmydPDrip/view?usp=sharing',
                        version: QrVersions.auto,
                        size: 100,
                        gapless: false,
                        backgroundColor: bgColor,
                        foregroundColor: const Color(0xffFFFFFF),
                      ),
                    ],
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: IconButton(
                      splashRadius: Material.defaultSplashRadius / 2,
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.cancel),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
