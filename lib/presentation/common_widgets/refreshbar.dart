import 'package:flutter/material.dart';

class RefreshBar extends StatelessWidget {
  final Widget child;
  final Future<void> Function() onRefresh;

  const RefreshBar({super.key, required this.child, required this.onRefresh});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: child,
    );
  }
}