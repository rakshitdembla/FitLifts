import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/constants/my_colors.dart';

class SortBar extends StatelessWidget {
  final List<DropdownMenuItem<String>>? items;
  final Function(String?)? onChanged;
  final String? value;

  final String title;
  final bool showDropdown;
  const SortBar({
    super.key,
    required this.showDropdown,
    required this.title,
    this.items,
    this.onChanged,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 4.w),
      child: Row(
        //title row
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: MyColors.whiteText,
              fontWeight: FontWeight.w900,
              fontSize: 20.sp,
            ),
          ),

          showDropdown
              ? Row(
                //sortby & dropdown row
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Sort By",
                    style: TextStyle(
                      color: MyColors.greyText,
                      fontWeight: FontWeight.w900,
                      fontSize: 15.sp,
                    ),
                  ),
                  DropdownButton(
                    items: items,
                    onChanged: onChanged,
                    value: value,
                    dropdownColor: MyColors.primaryCharcoal,
                    underline: SizedBox(),
                    style: GoogleFonts.poppins(
                      color: MyColors.whiteText,
                      fontSize: 15.sp,
                    ),
                  ),
                ],
              )
              : SizedBox(),
        ],
      ),
    );
  }
}
