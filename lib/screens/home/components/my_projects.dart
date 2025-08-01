import 'package:flutter/material.dart';
import 'package:portfolio/models/Project.dart';
import 'package:portfolio/responsive.dart';

import '../../../constants.dart';
import 'project_card.dart';

class MyProjects extends StatelessWidget {
  const MyProjects({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("My Projects", style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: defaultPadding),
        Responsive(
          mobile: ProjectsGridView(crossAxisCount: 1, childAspectRatio: 1.7),
          mobileLarge: ProjectsGridView(crossAxisCount: 2),
          tablet: ProjectsGridView(childAspectRatio: 1.1),
          desktop: ProjectsGridView(),
        ),
      ],
    );
  }
}

class ProjectsGridView extends StatelessWidget {
  const ProjectsGridView({
    super.key,
    this.crossAxisCount = 3,
    this.childAspectRatio = 1.3,
  });

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: demo_projects.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: childAspectRatio,
        crossAxisSpacing: defaultPadding,
        mainAxisSpacing: defaultPadding,
      ),
      itemBuilder:
          (context, index) => ProjectCard(project: demo_projects[index]),
    );
  }
}
