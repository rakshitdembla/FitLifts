import 'package:fitlifts/core/constants/my_colors.dart';
import 'package:flutter/material.dart';

class CircularProgressLoading extends StatefulWidget {
  const CircularProgressLoading({super.key});

  @override
  State<CircularProgressLoading> createState() => _CircularProgressLoadingState();
}

class _CircularProgressLoadingState extends State<CircularProgressLoading> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color:  MyColors.whiteText,
       
      ),
    );
  }
}