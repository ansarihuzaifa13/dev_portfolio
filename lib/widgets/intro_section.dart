import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:url_launcher/url_launcher.dart';

class IntroSection extends StatefulWidget {
  const IntroSection({super.key});

  @override
  State<IntroSection> createState() => _IntroSectionState();
}

class _IntroSectionState extends State<IntroSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..forward();
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth > 800;
        final isMobile = constraints.maxWidth < 600;
        final double padding = isWide ? 50 : 16;
        final double imageWidth = isWide ? 200 : 120;
        final double titleFontSize = isWide ? 100 : 48;

        Widget leftSection = Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: isWide ? 150 : 32),
            if (!isMobile) const SizedBox(height: 150),
            AnimatedTextKit(
              animatedTexts: [
                TyperAnimatedText(
                  "Flutter\nDeveloper",
                  textStyle: TextStyle(
                    fontSize: titleFontSize,
                    fontWeight: FontWeight.bold,
                    color: isMobile ? Colors.white : Colors.black,
                  ),
                  speed: const Duration(milliseconds: 80),
                ),
              ],
              isRepeatingAnimation: false,
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.resolveWith<Color>(
                  (Set<WidgetState> states) {
                    if (states.contains(WidgetState.hovered)) {
                      return isMobile ? Colors.white : Colors.black;
                    }
                    return isMobile ? Colors.black : Colors.white;
                  },
                ),
                foregroundColor: WidgetStateProperty.resolveWith<Color>(
                  (Set<WidgetState> states) {
                    if (states.contains(WidgetState.hovered)) {
                      return isMobile ? Colors.black : Colors.white;
                    }
                    return isMobile ? Colors.white : Colors.black;
                  },
                ),
                textStyle: WidgetStateProperty.all(const TextStyle(
                  fontFamily: 'SourceCodePro',
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                )),
                padding: WidgetStateProperty.all(
                  const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                ),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(
                        color: isMobile ? Colors.white : Colors.black,
                        width: 1),
                  ),
                ),
              ),
              icon: const Icon(Icons.download),
              label: const Text('Download Resume'),
              onPressed: () {
                launchUrl(Uri.parse('Huzaifa_Flutter_Dev_Resume.pdf'));
              },
            ),
          ],
        );

        Widget rightSection = Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment:
              isWide ? CrossAxisAlignment.end : CrossAxisAlignment.center,
          children: [
            Align(
              alignment: isWide ? Alignment.centerRight : Alignment.center,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  'images/intro_image.jpeg',
                  width: imageWidth,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: isWide ? 150 : 20),
            AnimatedTextKit(
              animatedTexts: [
                TyperAnimatedText(
                  "Hi, I'm Huzaifa 👨‍💻",
                  textStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: isMobile ? Colors.white : Colors.black,
                      ),
                  speed: const Duration(milliseconds: 80),
                ),
              ],
              isRepeatingAnimation: false,
            ),
            const SizedBox(height: 5),
            AnimatedTextKit(
              animatedTexts: [
                TyperAnimatedText(
                  "Flutter Developer | Full Stack Developer",
                  textStyle: TextStyle(
                    color: isMobile ? Colors.white : Colors.black,
                  ),
                  speed: const Duration(milliseconds: 50),
                ),
              ],
              isRepeatingAnimation: false,
            ),
            const SizedBox(height: 5),
            AnimatedTextKit(
              animatedTexts: [
                TyperAnimatedText(
                  "Crafting seamless digital experiences📱",
                  textStyle: TextStyle(
                    color: isMobile ? Colors.white : Colors.black,
                  ),
                  speed: const Duration(milliseconds: 50),
                ),
              ],
              isRepeatingAnimation: false,
            ),
          ],
        );

        return FadeTransition(
          opacity: _animation,
          child: Stack(
            children: [

              Container(
                width: double.infinity,
                color: isMobile ? Colors.black : Colors.white,
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.all(padding),
                  child: isWide
                      ? Row(
                          children: [
                            Expanded(flex: 1, child: leftSection),
                            const SizedBox(width: 32),
                            Expanded(flex: 1, child: rightSection),
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            leftSection,
                            const SizedBox(height: 32),
                            rightSection,
                          ],
                        ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
