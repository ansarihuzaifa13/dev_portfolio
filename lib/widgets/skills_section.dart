import 'package:flutter/material.dart';

class SkillsSection extends StatefulWidget {
  const SkillsSection({super.key});

  @override
  State<SkillsSection> createState() => _SkillsSectionState();
}

class _SkillsSectionState extends State<SkillsSection> with SingleTickerProviderStateMixin {
  final List<String> skills = const [
    'Flutter',
    'Dart',
    'Firebase',
    'REST APIs',
    'Clean Architecture',
    'Git & GitHub',
    'SQL & NoSQL',
    'UI/UX Design',
    'Coding',
    'Software Product Development',
    'Web app development',
    'Backend',
    'API development',
    'Node js',
    'Android Studio',
    'Xcode',
    'Firestore',
    'SQL',
    'PHP',
    'GCP',
    'Google Cloud Platform',
    'Figma',
    'Agile Methodologies',
    'Debugging',
    'Testing',
    'Version Control',
    'App Deployment',
    'Code Review',
    'User Interface Design',
    'User Experience Design',
  ];

  final List<int> _visibleChips = [];

  @override
  void initState() {
    super.initState();
    _animateChips();
  }

  void _animateChips() async {
    for (int i = 0; i < skills.length; i++) {
      await Future.delayed(const Duration(milliseconds: 60));
      if (mounted) {
        setState(() {
          _visibleChips.add(i);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth > 700;
        final isMobile = constraints.maxWidth < 600;
        final double padding = isWide ? 32.0 : 16.0;
        final double chipFontSize = isWide ? 18.0 : 14.0;
        final double chipPadding = isWide ? 16.0 : 10.0;
        final double spacing = isWide ? 16.0 : 8.0;

        return Padding(
          padding: EdgeInsets.all(padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: isMobile ? Colors.white : Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    "Skills",
                    style: TextStyle(
                      color: isMobile ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "A comprehensive list of my technical skills and expertise that showcase my capabilities in software development.",
                style: TextStyle(
                  fontSize: isMobile ? 16 : 20,
                  fontWeight: FontWeight.bold,
                  color: isMobile ? Colors.white : Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              Wrap(
                spacing: spacing,
                runSpacing: spacing,
                children: List.generate(skills.length, (i) {
                  return AnimatedOpacity(
                    opacity: _visibleChips.contains(i) ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeIn,
                    child: _SkillChip(
                      label: skills[i],
                      fontSize: chipFontSize,
                      padding: chipPadding,
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

class _SkillChip extends StatefulWidget {
  final String label;
  final double fontSize;
  final double padding;
  final bool isMobile;

  const _SkillChip({
    required this.label,
    this.fontSize = 12.0,
    this.padding = 10.0,
    this.isMobile = false,
  });

  @override
  State<_SkillChip> createState() => _SkillChipState();
}

class _SkillChipState extends State<_SkillChip> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: Tooltip(
        message: 'Skill: ${widget.label}',
        child: Chip(
          avatar: Icon(Icons.code,
              size: widget.fontSize,
              color: _hovering ? Colors.white : (widget.isMobile ? Colors.white : Colors.black)),
          label: Padding(
            padding: EdgeInsets.symmetric(horizontal: widget.padding, vertical: 4),
            child: Text(
              widget.label,
              style: TextStyle(
                color: _hovering ? Colors.white : (widget.isMobile ? Colors.white : Colors.black),
                fontSize: widget.fontSize,
              ),
            ),
          ),
          backgroundColor: _hovering
              ? Colors.black
              : (widget.isMobile ? Colors.black.withAlpha((0.7 * 255).toInt()) : Colors.grey[100]),
          side: BorderSide(color: widget.isMobile ? Colors.white : Colors.black),
          elevation: 2,
          shadowColor: Colors.grey[300],
        ),
      ),
    );
  }
}