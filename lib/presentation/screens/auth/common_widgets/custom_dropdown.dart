import 'package:fitlifts/core/constants/my_colors.dart';
import 'package:fitlifts/presentation/screens/auth/profile/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CustomDropdown extends StatefulWidget {
  final String hintText;
  final IconData icon;
  final List<String> items;
  final String label;

  const CustomDropdown({
    super.key,
    required this.hintText,
    required this.icon,
    required this.items,
    required this.label,
  });

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextStyle(
            color: MyColors.greyText,
            fontSize: 13.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 5.h),
        Consumer<ProfileProvider>(
          builder: (context, profileProvider, child) {
            return Container(
              height: 50.h,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
              decoration: BoxDecoration(
                color: MyColors.primaryCharcoal,
                borderRadius: BorderRadius.circular(5.r),
                border: Border.all(
                  color: Color.fromARGB(212, 158, 158, 158),
                  width: 1.0,
                ),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: profileProvider.selectedValue,
                  hint: Row(
                    children: [
                      Icon(
                        widget.icon,
                        color: Color.fromARGB(212, 158, 158, 158),
                      ),
                      SizedBox(width: 13.5.w),
                      Text(
                        widget.hintText,
                        style: GoogleFonts.poppins(
                          color: Color.fromARGB(157, 116, 118, 126),
                          fontSize: 15.2.sp,
                        ),
                      ),
                    ],
                  ),
                  dropdownColor: MyColors.primaryCharcoal,
                  isExpanded: true,
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Color.fromARGB(212, 158, 158, 158),
                  ),
                  style: GoogleFonts.poppins(
                    color: MyColors.whiteText,
                    fontSize: 15.sp,
                  ),
                  items:
                      widget.items
                          .map(
                            (value) => DropdownMenuItem(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(color: MyColors.whiteText),
                              ),
                            ),
                          )
                          .toList(),
                  onChanged:
                      (newValue) => setState(
                        () => profileProvider.selectedValue = newValue,
                      ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
