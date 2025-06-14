import 'package:flutter/material.dart';
import 'package:task/utils/text_style.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Profile Screen', style: AppTextStyles.headline2,)),
    );
  }
}