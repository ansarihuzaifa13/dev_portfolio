import 'package:flutter/material.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isMobile = constraints.maxWidth < 600;

          return Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Heading
                Text(
                  "Let's Connect Now",
                  style: TextStyle(
                    fontSize: isMobile ? 20 : 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: 18),
                // Contact Info
                isMobile
                    ? const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _ContactRow(
                            label: "Address",
                            value: "Mumbai Central(400008), Mumbai, Maharashtra, India",
                          ),
                          SizedBox(height: 8),
                          _ContactRow(
                            label: "Email Address",
                            value: "ansarihuzaifa1310@gmail.com",
                          ),
                          SizedBox(height: 8),
                          _ContactRow(
                            label: "Phone Number",
                            value: "+91 9619566787",
                          ),
                        ],
                      )
                    : const Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: _ContactRow(
                              label: "Address",
                              value: "Mumbai Central(400008), Mumbai, Maharashtra, India",
                            ),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: _ContactRow(
                              label: "Email Address",
                              value: "ansarihuzaifa1310@gmail.com",
                            ),
                          ),
                          Expanded(
                            child: _ContactRow(
                              label: "Phone Number",
                              value: "+91 9619566787",
                            ),
                          ),
                        ],
                      ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _ContactRow extends StatelessWidget {
  final String label;
  final String value;
  const _ContactRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.white70,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}