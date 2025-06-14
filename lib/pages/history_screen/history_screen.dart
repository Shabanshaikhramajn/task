import 'package:flutter/material.dart';
import 'package:task/utils/text_style.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('History Screen', style: AppTextStyles.headline2,)),
    );
  }
}