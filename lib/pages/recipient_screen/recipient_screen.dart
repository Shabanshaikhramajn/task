import 'package:flutter/material.dart';
import 'package:task/utils/text_style.dart';

class RecipientScreen extends StatelessWidget {
  const RecipientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Recepient Screen', style: AppTextStyles.headline2,)),
    );
  }
}