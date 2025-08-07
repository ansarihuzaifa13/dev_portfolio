import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth > 900;
        final isMobile = constraints.maxWidth < 600;
        final imageWidth = isWide ? 320.0 : isMobile ? double.infinity : 200.0;
        final textFontSize = isWide ? 20.0 : isMobile ? 15.0 : 16.0;
        final padding = isWide ? 32.0 : isMobile ? 8.0 : 16.0;

        Widget left = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!isMobile) const SizedBox(height: 30),
            Text(
              "Coding has always been more than\njust a job - it's my passion",
              style: TextStyle(
                color: isMobile ? Colors.black : Colors.white,
                fontSize: textFontSize + (isMobile ? 1 : 0),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            ClipRRect(
              borderRadius: BorderRadius.circular(isMobile ? 16 : 12),
              child: Image.asset(
                'images/about_image.jpeg',
                width: imageWidth,
                height: isMobile ? 180 : null,
                fit: BoxFit.cover,
              ),
            ),
          ],
        );

        Widget right = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!isMobile) const SizedBox(height: 80),
            Text(
              "Hi, I'm a passionate Flutter developer who loves building smooth, pixel-perfect mobile apps. With a focus on clean architecture and performance, I enjoy turning complex ideas into elegant user experiences. I'm always curious, always learning, and always ready to take on exciting new challenges.",
              style: TextStyle(
                color: isMobile ? Colors.black87 : Colors.white,
                fontSize: textFontSize,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "I’m a self-taught app developer based in Mumbai, India. I can develop responsive websites and apps from scratch and raise them into modern user-friendly app experiences.",
              style: TextStyle(
                color: isMobile ? Colors.black87 : Colors.white,
                fontSize: textFontSize,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "Transforming my creativity and knowledge into an app/website has been my passion for over a year. I have been helping various clients to establish their presence online. I always strive to learn about the newest technologies and frameworks.",
              style: TextStyle(
                color: isMobile ? Colors.black87 : Colors.white,
                fontSize: textFontSize,
                height: 1.5,
              ),
            ),
          ],
        );

        return Container(
          color: Colors.white,
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.all(padding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // "About Me" outside the container
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      "About Me",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    color: isMobile ? Colors.white : Colors.black,
                    border: Border.all(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(isMobile ? 16 : 8),
                    boxShadow: isMobile
                        ? [
                            BoxShadow(
          color: Colors.black.withAlpha((0.06 * 255).toInt()), // replaced withAlpha
                              blurRadius: 12,
                              offset: const Offset(0, 4),
                            ),
                          ]
                        : [],
                  ),
                  padding: EdgeInsets.all(isWide ? 32 : isMobile ? 12 : 16),
                  child: isWide
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            left,
                            const SizedBox(width: 32),
                            Expanded(child: right),
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            left,
                            const SizedBox(height: 20),
                            right,
                          ],
                        ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}