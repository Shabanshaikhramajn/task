import 'package:flutter/material.dart';
import 'package:task/utils/app_colors.dart';
import 'package:task/utils/text_style.dart';

class RecipientScreen extends StatelessWidget {
  const RecipientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        automaticallyImplyLeading: false,
        title:Text('Recepient Screen', style: TextStyle(color: AppColors.whiteColor, fontSize: 20)),
        centerTitle: true,
        elevation: 6,
        backgroundColor: AppColors.primaryColor,
       ),


    
    );
  }
}