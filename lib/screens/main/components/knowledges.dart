import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'knowledge_text.dart';

class Knowledges extends StatelessWidget {
  const Knowledges({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(),
        Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: Text("Knowledges",
                style: Theme.of(context).textTheme.headline6)),
        const KnowledgeText(text: "Flutter & Dart"),
        const KnowledgeText(text: "Android & iOS"),
        const KnowledgeText(text: "Windows & MacOs"),
        const KnowledgeText(text: "RESTful API's & Sockets"),
        const KnowledgeText(text: "Provider & Riverpod State Management"),
        const KnowledgeText(text: "MVVM Architecture"),
        const KnowledgeText(text: "Git - Version Control System"),
        const KnowledgeText(text: "Figma, Canva & Adobe Illustrator"),
      ],
    );
  }
}
