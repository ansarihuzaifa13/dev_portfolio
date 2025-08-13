import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  final List<Map<String, String>> experiences = const [
    {
      'title': 'Flutter Developer at WealthRight',
      'year': 'Oct 2024 - Present',
      'description':
          '• Published WealthRight Customer app on Play Store and App Store \n• Built a robust investment portfolio app in Flutter for real-time asset tracking (mutual funds, insurance,etc.) \n• Developed Flutter web app for lead generation in mutual fund domain \n• Integrated APIs to fetch financial data & compute portfolio performance \n• Enabled real-time updates using Firebase Firestore, Google Analytics & Crashlytics \n• Designed interactive data visualizations using Flutter Charts & CustomPainter \n• Secured user data via 3rd-party APIs, encryption, and authentication systems',
    },
    {
      'title': 'Full Stack Flutter Developer at Alphaneon Studioz',
      'year': 'May 2024 - Oct 2024',
      'description':
          '• Launched 3 apps (Alphaneon Studioz, ABS, Ticketmart) on Play Store & App Store \n• Built responsive, adaptive UIs using Flutter’s widget system \n• Collaborated with designers for clean and intuitive UI/UX \n• Used Bloc and Provider for efficient state management \n• Integrated Firebase, PHP & MySQL for backend services \n• Enabled real-time updates using WebSockets \n• Added video playback & streaming via video_player plugin \n• Implemented secure auth using OAuth, JWT & Firebase \n• Optimized performance for load speed & memory usage \n• Built offline support with caching & sync features \n• Integrated OTP login, analytics, and social media SDKs \n• Wrote unit, widget & integration tests for quality assurance \n• Managed staging & production deployments seamlessly',
    },
    {
      'title': 'Flutter Developer at Mavonic Technology',
      'year': 'Jun 2022 - Apr 2024',
      'description':
          '• Published Dashfit – Workout Challenge on Play Store & App Store \n• Built cross-platform apps in fitness & insurance domains using Flutter \n• Developed backend services & e-commerce site using Node.js & Express.js for https://prajav.com/ \n• Followed clean code practices, Git version control & test-driven dev \n• Ensured smooth performance across devices & screen sizes \n• Rapidly prototyped UIs using FlutterFlow & Figma collaboration \n• Integrated Firestore for real-time data sync and dynamic updates \n• Documented best practices for FlutterFlow & Firestore usage \n• Proficient in JavaScript, Node.js, SQL & RESTful API integration \n• Experienced with MySQL and backend architecture design \n• Applied software testing principles for robust app delivery \n• Effective team collaborator with strong independent ownership',
    },
    {
      'title': 'Quality Assurance Engineer at Livquik',
      'year': 'Sept 2019 - May 2022',
      'description':
          '• Worked on different projects for Issuing of Giftcards, Acquiring platform, Auditor Dashboard, Merchant payment gateway. \n• Creating test cases, test strategies & scenarios, use cases, test planning, test reports, testing tools & techniques. \n• Performing manual testing, regression testing, smoke, sanity. \n• Following SDLC & STLC on websites and mobile applications. \n• Handling of database/ back end. Hands-on experience in bug tracking tools i.e Jira and Confluence.',
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

  Future<void> _onOpen(LinkableElement link) async {
    final Uri url = Uri.parse(link.url);
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }

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
                      Linkify(
                        onOpen: _onOpen,
                        text: widget.exp['description'] ?? '',
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.white70,
                        ),
                        linkStyle: const TextStyle(
                          color: Colors.blueAccent,
                          decoration: TextDecoration.underline,
                        ),
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
                            Linkify(
                              onOpen: _onOpen,
                              text: widget.exp['description'] ?? '',
                              style: const TextStyle(
                                fontSize: 17,
                                color: Colors.white70,
                              ),
                              linkStyle: const TextStyle(
                                color: Colors.blueAccent,
                                decoration: TextDecoration.underline,
                              ),
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
