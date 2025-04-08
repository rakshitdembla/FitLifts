import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/constants/my_colors.dart';

class CustomDropDown extends StatelessWidget {
  final List<DropdownMenuItem<String>>? items;
  final Function(String?)? onChanged;
  final String? value;
  final bool isExpanded;
  final String hintText;
  final TextStyle style;

  const CustomDropDown({
    super.key,
    this.items,
    this.onChanged,
    this.value,
    this.isExpanded = false,
    required this.hintText,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      alignment: Alignment.centerLeft,
      isExpanded: isExpanded,
      isDense: true,
      iconDisabledColor: MyColors.greyText,
      iconEnabledColor: const Color.fromARGB(255, 198, 199, 200),
      items: items,
      onChanged: onChanged,
      value: value,
      dropdownColor: MyColors.primaryCharcoal,
      underline: SizedBox(),
      style: style,
      hint: Text(hintText, style: style),
    );
  }
}
