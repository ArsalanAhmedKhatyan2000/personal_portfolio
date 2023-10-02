class MyServicesModel {
  final String? title, description, imagePath;

  MyServicesModel({this.title, this.description, this.imagePath});
}

List<MyServicesModel> demo_my_services = [
  MyServicesModel(
    title: "Mobile App Development",
    imagePath: "assets/icons/mobile_icon.svg",
    description:
        "Developing responsive and high quality cross-platform (Android/iOS) Apps using a single code base with Flutter.",
  ),
  MyServicesModel(
    title: "Desktop App Development",
    imagePath: "assets/icons/desktop_icon.svg",
    description:
        "Developing high quality cross-platform (Windows/MacOS) Apps using a single code base with Flutter.",
  ),
  MyServicesModel(
    title: "Web App Development",
    imagePath: "assets/icons/desktop_icon.svg",
    description:
        "Developing responsive and high quality web Apps using a single code base with Flutter.",
  ),
];
