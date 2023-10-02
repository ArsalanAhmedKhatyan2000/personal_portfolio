import 'package:flutter/material.dart';
import 'package:personal_portfolio/models/project.dart';
import 'package:personal_portfolio/screens/home/components/recommendations.dart';
import 'package:personal_portfolio/screens/main/main_screen.dart';
import '../../constants.dart';
import '../../responsive.dart';
import 'components/education_and_certifications.dart';
import 'components/high_light_info.dart';
import 'components/home_banner.dart';
import 'components/my_projects.dart';
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
              Project myProject = demo_projects[index];
              return SizedBox(
                width: Responsive.isMobile(context) ||
                        Responsive.isMobileLarge(context)
                    ? (boxConstraints.maxWidth)
                    : Responsive.isTablet(context)
                        ? (boxConstraints.maxWidth - defaultPadding) / 2
                        : (boxConstraints.maxWidth - defaultPadding * 2) / 3,
                child: ProjectSectionCard(myProject: myProject),
              );
            }),
          ),
        );
      },
    );
  }
}

class ProjectSectionCard extends StatefulWidget {
  final Project myProject;
  const ProjectSectionCard({Key? key, required this.myProject})
      : super(key: key);

  @override
  State<ProjectSectionCard> createState() => _ProjectSectionCardState();
}

class _ProjectSectionCardState extends State<ProjectSectionCard> {
  bool ishover = false;
  @override
  Widget build(BuildContext context) {
    var cardBorderRadius = const BorderRadius.all(Radius.circular(10));
    return InkWell(
      onTap: () {},
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
              "assets/images/neurocare_project_image.png",
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: defaultPadding / 2),
            Text(
              widget.myProject.title.toString(),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.subtitle2,
            ),
            const SizedBox(height: defaultPadding / 2),
            Text(
              widget.myProject.description.toString(),
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
