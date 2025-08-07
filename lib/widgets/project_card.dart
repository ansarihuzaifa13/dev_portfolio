import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectCard extends StatefulWidget {
  final String title, description, url, imageAsset;
  const ProjectCard({
    required this.title,
    required this.description,
    required this.url,
    required this.imageAsset,
    super.key,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth > 400;
        final isMobile = constraints.maxWidth < 600;
        final padding = isWide ? 20.0 : 12.0;
        final titleFontSize = isWide ? 20.0 : 16.0;
        final descFontSize = isWide ? 14.0 : 12.0;

        return MouseRegion(
          onEnter: (_) => setState(() => _hovering = true),
          onExit: (_) => setState(() => _hovering = false),
          child: GestureDetector(
            onTap: () => launchUrl(Uri.parse(widget.url)),
            child: Container(
              margin: const EdgeInsets.all(8),
              padding: EdgeInsets.all(padding),
              constraints: const BoxConstraints(
                minWidth: 250,
                maxWidth: 350,
                minHeight: 200,
                maxHeight: 320,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  color: isMobile
                      ? Colors.white
                      : Colors.black,
                  width: 1.2,
                ),
                gradient: _hovering
                    ? LinearGradient(
                        colors: isMobile
                            ? [Colors.white12, Colors.white10]
                            : [Colors.black, Colors.grey[900]!],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      )
                    : LinearGradient(
                        colors: isMobile
                            ? [Colors.black, Colors.black]
                            : [Colors.white, Colors.grey[100]!],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                boxShadow: [
                  BoxShadow(
                    color: isMobile
        ? Colors.white.withAlpha((0.04 * 255).toInt())
                        : Colors.black.withAlpha(_hovering ? 31 : 18),
                    blurRadius: 16,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Project image at the top
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      widget.imageAsset,
                      height: isMobile ? 120 : 100,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 14),
                  // Line before heading
                  Container(
                    height: 3,
                    width: 40,
                    margin: const EdgeInsets.only(bottom: 12),
                    color: _hovering
                        ? (isMobile ? Colors.black : Colors.white)
                        : (isMobile ? Colors.white : Colors.black),
                  ),
                  Text(
                    widget.title,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontSize: titleFontSize,
                          color: _hovering
                              ? (isMobile ? Colors.black : Colors.white)
                              : (isMobile ? Colors.white : Colors.black),
                        ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.description,
                    style: TextStyle(
                      color: _hovering
                          ? (isMobile ? Colors.black87 : Colors.white70)
                          : (isMobile ? Colors.white70 : Colors.black),
                      fontSize: descFontSize,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Spacer(),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Icon(
                      Icons.arrow_forward,
                      color: _hovering
                          ? (isMobile ? Colors.black : Colors.white)
                          : (isMobile ? Colors.white : Colors.black),
                      size: 28,
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