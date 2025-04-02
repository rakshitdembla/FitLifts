import 'package:auto_route/auto_route.dart';
import 'package:fitlifts/core/constants/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

@RoutePage()
class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: MyColors.primaryCharcoal,
      body: Center(
        child:  LoadingAnimationWidget.inkDrop(
        color: Colors.white,
        size: 200,
      ),
      ),
    );
  }
}