import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:personal_portfolio/responsive.dart';

import '../../../constants.dart';
import '../../../models/my_services.dart';

class MyServices extends StatelessWidget {
  const MyServices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("My Services", style: Theme.of(context).textTheme.headline6),
          const SizedBox(height: defaultPadding),
          const MyServicesGridView(),
        ],
      ),
    );
  }
}

class MyServicesGridView extends StatelessWidget {
  const MyServicesGridView({Key? key}) : super(key: key);

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
            children: List.generate(demo_my_services.length, (index) {
              MyServicesModel myServices = demo_my_services[index];
              return SizedBox(
                width: Responsive.isMobile(context) ||
                        Responsive.isMobileLarge(context)
                    ? (boxConstraints.maxWidth)
                    : Responsive.isTablet(context)
                        ? (boxConstraints.maxWidth - defaultPadding) / 2
                        : (boxConstraints.maxWidth - defaultPadding * 2) / 3,
                child: ServiceCard(myServices: myServices),
              );
            }),
          ),
        );
      },
    );
  }
}

class ServiceCard extends StatefulWidget {
  final MyServicesModel myServices;
  const ServiceCard({Key? key, required this.myServices}) : super(key: key);

  @override
  State<ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
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
            Container(
              width: 60,
              height: 60,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: ishover ? const Color(0xffFFFFFF) : primaryColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    widget.myServices.imagePath.toString(),
                    width: 40,
                    height: 40,
                    color: ishover ? primaryColor : const Color(0xffFFFFFF),
                  ),
                ],
              ),
            ),
            const SizedBox(height: defaultPadding),
            Text(
              widget.myServices.title.toString(),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.subtitle2,
            ),
            const SizedBox(height: defaultPadding / 2),
            Text(
              widget.myServices.description.toString(),
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
