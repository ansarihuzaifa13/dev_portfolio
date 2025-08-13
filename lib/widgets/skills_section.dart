import 'package:flutter/material.dart';

class SkillsSection extends StatefulWidget {
  const SkillsSection({super.key});

  @override
  State<SkillsSection> createState() => _SkillsSectionState();
}

class _SkillsSectionState extends State<SkillsSection>
    with SingleTickerProviderStateMixin {
  final Map<String, List<String>> categorizedSkills = const {
    "Frontend": [
      "Flutter",
      "Dart",
      "UI/UX Design",
      "Figma",
      "User Interface Design",
      "User Experience Design",
      "HTML & CSS",
      "PHP"
    ],
    "Backend": [
      "Firebase",
      "REST APIs",
      "Clean Architecture",
      "API Development",
      "Node.js",
      "PHP",
      "SQL",
      "NoSQL",
      "Firestore",
    ],
    "Tools & Platforms": [
      "Git & GitHub",
      "GCP",
      "Google Cloud Platform",
      "Android Studio",
      "Xcode",
      "Agile Methodologies",
      "Version Control",
      "App Deployment",
      "Code Review",
      "Debugging",
      "Testing",
    ],
    "Soft Skills": [
      "Communication",
      "Teamwork",
      "Problem Solving",
      "Time Management",
      "Adaptability",
      "Attention to Detail",
      "Critical Thinking",
      "Creativity",
      "Leadership",
      "Conflict Resolution",
      "Client Communication",
      "Decision Making",
      "Presentation Skills",
      "Project Ownership",
    ],
  };

  final List<int> _visibleCategories = [];

  @override
  void initState() {
    super.initState();
    _animateCategories();
  }

  void _animateCategories() async {
    for (int i = 0; i < categorizedSkills.length; i++) {
      await Future.delayed(const Duration(milliseconds: 150));
      if (mounted) {
        setState(() {
          _visibleCategories.add(i);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 600;
        final double padding = isMobile ? 16.0 : 32.0;

        return Padding(
          padding: EdgeInsets.all(padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Section Header
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: isMobile ? Colors.white : Colors.black,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    "Skills",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: isMobile ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              Text(
                "A categorized view of my technical and soft skills.",
                style: TextStyle(
                  fontSize: isMobile ? 16 : 20,
                  fontWeight: FontWeight.bold,
                  color: isMobile ? Colors.white : Colors.black,
                ),
              ),
              const SizedBox(height: 20),

              // Skill Categories
              Column(
                children: List.generate(categorizedSkills.length, (index) {
                  String category = categorizedSkills.keys.elementAt(index);
                  List<String> skills = categorizedSkills[category]!;

                  return AnimatedOpacity(
                    opacity: _visibleCategories.contains(index) ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 400),
                    child: _SkillCategoryTile(
                      title: category,
                      skills: skills,
                      isMobile: isMobile,
                    ),
                  );
                }),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _SkillCategoryTile extends StatefulWidget {
  final String title;
  final List<String> skills;
  final bool isMobile;

  const _SkillCategoryTile({
    required this.title,
    required this.skills,
    required this.isMobile,
  });

  @override
  State<_SkillCategoryTile> createState() => _SkillCategoryTileState();
}

class _SkillCategoryTileState extends State<_SkillCategoryTile> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: _hovering
              ? Colors.black
              : (widget.isMobile ? Colors.black.withValues(alpha: 0.7) : Colors.grey[100]),
          border: Border.all(
            color: widget.isMobile ? Colors.white : Colors.black,
          ),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Category title
            Text(
              widget.title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: _hovering
                    ? Colors.white
                    : (widget.isMobile ? Colors.white : Colors.black),
              ),
            ),
            const SizedBox(height: 8),
            // Skills list
            Text(
              widget.skills.join(" • "),
              style: TextStyle(
                fontSize: 16,
                color: _hovering
                    ? Colors.white
                    : (widget.isMobile ? Colors.white70 : Colors.black87),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
