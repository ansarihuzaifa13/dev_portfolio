import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth > 900;
        final isMobile = constraints.maxWidth < 600;

        return Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 12 : 24,
            vertical: 32,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // About Me title
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  "About Me",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Card with Image & Text
              Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha((0.1 * 255).toInt()),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    )
                  ],
                ),
                child: isWide
                    ? Row(
                        children: [
                          // Image side
                          Expanded(
                            flex: 1,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.horizontal(
                                left: Radius.circular(12),
                              ),
                              child: Image.asset(
                                'images/about_image.jpeg',
                                fit: BoxFit.cover,
                                height: 450,
                              ),
                            ),
                          ),

                          // Text side
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.all(24),
                              child: _aboutText(true),
                            ),
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          // Image
                          ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(12),
                            ),
                            child: Image.asset(
                              'images/about_image.jpeg',
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: 300,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: _aboutText(false),
                          ),
                        ],
                      ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _aboutText(bool isWide) {
    final textColor = Colors.white;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Coding has always been more than just a job - its my passion",
          style: TextStyle(
            fontSize: isWide ? 22 : 20,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          "Hi, I'm a passionate Flutter developer who loves building smooth, pixel-perfect mobile apps. "
          "With a focus on clean architecture and performance, I enjoy turning complex ideas into elegant user experiences.",
          style: TextStyle(
            fontSize: 16,
            height: 1.5,
            color: textColor.withAlpha(220),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          "Based in Mumbai, India, I create responsive websites and apps from scratch, "
          "bringing modern, user-friendly experiences to life.",
          style: TextStyle(
            fontSize: 16,
            height: 1.5,
            color: textColor.withAlpha(220),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          "For more than 6 years, I’ve been helping clients establish their online presence, "
          "constantly learning the latest technologies and frameworks.",
          style: TextStyle(
            fontSize: 16,
            height: 1.5,
            color: textColor.withAlpha(220),
          ),
        ),
      ],
    );
  }
}
