import 'package:flutter/material.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  final List<Map<String, String>> experiences = const [
    {
      'title': 'Flutter Developer at WealthRight',
      'year': 'Oct 2024 - Present',
      'description':
          'Developed a robust investment portfolio app in Flutter (WealthRight Customer), enabling users to track mutual funds, insurance, and assets in real-time. Integrated APIs for data and performance metrics, implemented real-time updates with Firebase, and created interactive data visualizations. Ensured secure authentication and data encryption for sensitive financial information.',
    },
    {
      'title': 'Full Stack Flutter Developer at Alphaneon Studioz',
      'year': 'May 2024 - Oct 2024',
      'description':
          'Launched 3 mobile apps on Play Store and App Store (Alphaneon Studioz, Ticketmart, ABS). Designed adaptive UIs with Flutter, collaborated with designers, and used Provider/Bloc for state management. Integrated PHP/MySQL/Firebase backends, managed real-time data with WebSockets, and implemented video playback. Enhanced app performance, offline caching, and integrated third-party services for a seamless user experience.',
    },
    {
      'title': 'Flutter Developer at Mavonic Technology',
      'year': 'Jun 2022 - Apr 2024',
      'description':
          'Launched Dashfit app on Play Store and App Store, optimizing for performance and device compatibility. Developed insurance and fitness apps in Flutter, backend in Node.js. Used Git for version control, FlutterFlow for rapid UI, and Figma for design. Integrated Firestore for real-time data and documented best practices. Proficient in JavaScript, Node.js, and SQL.',
    },
    {
      'title': 'Quality Assurance Engineer at Livquik',
      'year': 'Sept 2019 - May 2022',
      'description':
          'Worked on gift card, acquiring, auditor, and merchant gateway projects. Created test plans, cases, and reports; performed manual, regression, smoke, and sanity testing. Followed SDLC/STLC for web and mobile apps, managed backend/database tasks, and used Jira/Confluence for bug tracking.',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 600;
        return Container(
          color: Colors.black,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: Colors.white, width: 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    "Experience",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                isMobile
                    ? const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "A yearly snapshot of my\ncreative growth",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 12),
                          Text(
                            "An annual summary that summarizes my\ncreative journey and development throughout\nthe year.",
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      )
                    : const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            flex: 2,
                            child: Text(
                              "A yearly snapshot of my\ncreative growth",
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(width: 24),
                          Flexible(
                            flex: 3,
                            child: Text(
                              "An annual summary that summarizes my\ncreative journey and development throughout\nthe year.",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ],
                      ),
                const SizedBox(height: 32),
                ...experiences.map((exp) => _ExperienceTile(exp: exp, isMobile: isMobile)),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _ExperienceTile extends StatefulWidget {
  final Map<String, String> exp;
  final bool isMobile;
  const _ExperienceTile({required this.exp, required this.isMobile});

  @override
  State<_ExperienceTile> createState() => _ExperienceTileState();
}

class _ExperienceTileState extends State<_ExperienceTile> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 600;
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.only(bottom: 32),
        padding: EdgeInsets.symmetric(
          vertical: widget.isMobile ? 18 : 28,
          horizontal: widget.isMobile ? 12 : (isWide ? 36 : 18),
        ),
        decoration: BoxDecoration(
          color: _hovering
              ? Colors.white.withAlpha((0.08 * 255).toInt())
              : Colors.transparent,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widget.isMobile
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.exp['title'] ?? '',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        widget.exp['year'] ?? '',
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        widget.exp['description'] ?? '',
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.white70,
                        ),
                        maxLines: null,
                        overflow: TextOverflow.visible,
                      ),
                    ],
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title and description
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.exp['title'] ?? '',
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              widget.exp['description'] ?? '',
                              style: const TextStyle(
                                fontSize: 17,
                                color: Colors.white70,
                              ),
                              maxLines: null,
                              overflow: TextOverflow.visible,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 32),
                      // Year to extreme right
                      Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          widget.exp['year'] ?? '',
                          style: const TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  ),
            const SizedBox(height: 22),
            // White line
            Container(
              height: 3,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}