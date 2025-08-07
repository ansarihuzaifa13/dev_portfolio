// views/home_page.dart
import 'package:dev_portfolio/widgets/experience_section.dart';
import 'package:dev_portfolio/widgets/skills_section.dart';
import 'package:flutter/material.dart';
import '../widgets/app_bar.dart';
import '../widgets/intro_section.dart';
import '../widgets/about_section.dart';
import '../widgets/contact_section.dart';
import '../data/projects.dart';
import '../widgets/project_card.dart';

final aboutKey = GlobalKey();
final skillsKey = GlobalKey();
final experienceKey = GlobalKey();
final projectsKey = GlobalKey();
final contactKey = GlobalKey();
final ScrollController scrollController = ScrollController();

void _scrollToSection(GlobalKey key) {
  final context = key.currentContext;
  if (context != null) {
    Scrollable.ensureVisible(
      context,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [
            CustomAppBar(
              onNav: (section) {
                _scrollToSection(section);
              },
            ),
            const IntroSection(),
            Container(key: aboutKey, child: const AboutSection()),
            Container(key: skillsKey, child: const SkillsSection()),
            Padding(
              key: experienceKey,
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ExperienceSection(),
                  const SizedBox(height: 16),
                  Container(
                    key: projectsKey,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      "Projects",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    children: projects
                        .map((p) => ProjectCard(
                              title: p['title']!,
                              description: p['description']!,
                              url: p['url']!,
                              imageAsset: p['imageAsset']!,
                            ))
                        .toList(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 100),
            Container(
              key: contactKey,
              child: const ContactSection(),
            ),
          ],
        ),
      ),
    );
  }
}
