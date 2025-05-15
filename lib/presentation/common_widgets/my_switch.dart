import 'package:flutter/material.dart';

class MySwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;
  const MySwitch({super.key,required this.onChanged,required this.value});

  @override
  Widget build(BuildContext context) {
    return 
    Switch(value: value, onChanged: onChanged);
  }
}