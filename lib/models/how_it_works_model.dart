import 'package:flutter/material.dart';

class HowItWorksModel {
  IconData icon;
  String title;
  String description;

  HowItWorksModel({
    required this.icon,
    required this.title,
    required this.description,
  });

  static List<HowItWorksModel> items = [
    HowItWorksModel(
      icon: Icons.paste,
      title: 'Paste Resume',
      description:
          'Copy and paste your plain text resume or upload a PDF. Our engine supports any format.',
    ),
    HowItWorksModel(
      icon: Icons.auto_awesome,
      title: 'AI Processing',
      description:
          'Our AI analyzes your skills and background to generate a stunning, responsive layout automatically.',
    ),
    HowItWorksModel(
      icon: Icons.rocket_launch,
      title: 'Go Live',
      description:
          'Receive a custom URL for your portfolio. Share it with recruiters and watch your conversion grow.',
    ),
  ];
}
