import 'package:fitlifts/core/utils/utils.dart';
import 'package:fitlifts/presentation/screens/auth/common_widgets/custom_dropdown.dart';
import 'package:fitlifts/presentation/screens/auth/profile/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../core/constants/my_colors.dart';
import '../../../common_widgets/elevated_cta.dart';
import '../../../common_widgets/unit_num_field.dart';
import '../common_widgets/credentials_text_field.dart';

class ProfileForm extends StatefulWidget {
  const ProfileForm({super.key});

  @override
  State<ProfileForm> createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController bodyWeightController = TextEditingController();

  FocusNode nameNode = FocusNode();
  FocusNode ageNode = FocusNode();
  FocusNode heightNode = FocusNode();
  FocusNode bodyWeightNode = FocusNode();

  @override
  void dispose() {
    nameController.dispose();
    ageController.dispose();
    heightController.dispose();
    bodyWeightController.dispose();

    nameNode.dispose();
    ageNode.dispose();
    heightNode.dispose();
    bodyWeightNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomDropdown(
          hintText: "Your gender",
          icon: Icons.wc,
          items: ["Male", "Female"],
          label: "Gender",
        ),
        SizedBox(height: 12.h),
        CredentialsField(
          label: "Name",
          focusNode: nameNode,
          hinttext: "Your full name",
          maxLength: 50,
          onSubmitted: (_) {
            FocusScope.of(context).requestFocus(ageNode);
          },
          prefixIcon: Icon(Icons.person, color: MyColors.greyText),
          isPassword: false,
          controller: nameController,
        ),
        SizedBox(height: 12.h),
        UnitNumField(
          label: "Age",
          focusNode: ageNode,
          hinttext: "Your age",
          maxLength: 2,
          onSubmitted: (_) {
            FocusScope.of(context).requestFocus(heightNode);
          },
          prefixIcon: Icon(
            Icons.calendar_month_rounded,
            color: MyColors.greyText,
          ),
          isPassword: false,
          controller: ageController,
          unit: "yrs",
        ),
        SizedBox(height: 12.h),
        UnitNumField(
          label: "Height",
          focusNode: heightNode,
          hinttext: "Your height",
          maxLength: 3,
          onSubmitted: (_) {
            FocusScope.of(context).requestFocus(bodyWeightNode);
          },
          prefixIcon: Icon(Icons.accessibility, color: MyColors.greyText),
          isPassword: false,
          controller: heightController,
          unit: "cm",
        ),
        SizedBox(height: 12.h),

        UnitNumField(
          label: "Body Weight",
          focusNode: bodyWeightNode,
          hinttext: "Your current weight",
          maxLength: 5,
          onSubmitted: (_) {
            FocusScope.of(context).unfocus();
          },
          prefixIcon: Icon(Icons.scale_outlined, color: MyColors.greyText),
          isPassword: false,
          controller: bodyWeightController,
          unit: "kg",
        ),
        SizedBox(height: 20.h),
        Consumer<ProfileProvider>(
          builder: (context, profileProvider, child) {
            return profileProvider.isLoading
                ? Center(
                  child: CircularProgressIndicator(color: MyColors.whiteText),
                )
                : ElevatedCTA(
                  title: "Complete",
                  onPressed: () {
                    profileProvider.createUserProfile(
                      context,
                      Utils.getUserEmail()!,
                      nameController.text.trim(),
                      ageController.text.trim(),
                      heightController.text.trim(),
                      bodyWeightController.text.trim(),
                      profileProvider.selectedValue,
                    );
                  },
                );
          },
        ),
      ],
    );
  }
}
