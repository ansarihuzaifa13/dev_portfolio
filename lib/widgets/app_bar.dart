// widgets/app_bar.dart
import 'package:dev_portfolio/views/home_page.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final void Function(GlobalKey sectionKey) onNav;

  const CustomAppBar({super.key, required this.onNav});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth > 700;
        return Container(
          color: Colors.white, // White background
          padding: EdgeInsets.symmetric(
            horizontal: isWide ? 32 : 16,
            vertical: isWide ? 12 : 8,
          ),
          child: Row(
            children: [
              // Left: Logo/Name
              Text(
                'Dev Portfolio',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Colors.black, // Black text
                      fontFamily: 'SourceCodePro',
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
              ),
              const Spacer(),
              if (isWide)
                Row(
                  children: [
                    _NavButton(label: '#Home', onTap: () {/* Scroll to Home */}),
                    const SizedBox(width: 24),
                    _NavButton(label: '#About Me', onTap: () => onNav(aboutKey)),
                    const SizedBox(width: 24),
                    _NavButton(label: '#Skills', onTap: () => onNav(skillsKey)),
                    const SizedBox(width: 24),
                    _NavButton(label: '#Experience', onTap: () => onNav(experienceKey)),
                    const SizedBox(width: 24),
                    _NavButton(label: '#Projects', onTap: () => onNav(projectsKey)),
                    const SizedBox(width: 24),
                    _NavButton(label: '#Contact Us', onTap: () => onNav(contactKey)),
                  ],
                )
              else
                PopupMenuButton<int>(
                  icon: const Icon(Icons.menu, color: Colors.black), // Black icon
                  color: Colors.white, // White popup background
                  itemBuilder: (context) => [
                    const PopupMenuItem(
                      value: 0,
                      child: Text('#Home', style: TextStyle(color: Colors.black)),
                    ),
                    const PopupMenuItem(
                      value: 1,
                      child: Text('#About Me', style: TextStyle(color: Colors.black)),
                    ),
                    const PopupMenuItem(
                      value: 2,
                      child: Text('#Skills', style: TextStyle(color: Colors.black)),
                    ),
                    const PopupMenuItem(
                      value: 3,
                      child: Text('#Experience', style: TextStyle(color: Colors.black)),
                    ),
                    const PopupMenuItem(
                      value: 4,
                      child: Text('#Projects', style: TextStyle(color: Colors.black)),
                    ),
                    const PopupMenuItem(
                      value: 5,
                      child: Text('#Contact Us', style: TextStyle(color: Colors.black)),
                    ),
                  ],
                  onSelected: (value) {
                    // Handle navigation here
                  },
                ),
            ],
          ),
        );
      },
    );
  }
}

class _NavButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const _NavButton({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.all(Colors.black), // Black text
        textStyle: WidgetStateProperty.all(
          Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontFamily: 'SourceCodePro',
                fontWeight: FontWeight.w600,
                letterSpacing: 1.2,
              ),
        ),
        overlayColor: WidgetStateProperty.resolveWith(
          (states) => Colors.black26,
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      child: Text(label),
    );
  }
}