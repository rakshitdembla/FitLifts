part of "settings_imports.dart";

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool gotInitialData = false;
  @override
  void didChangeDependencies() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!gotInitialData) {
        Provider.of<SettingsProvider>(context, listen: false).getUserData();
        gotInitialData = true;
      }
    });

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primaryCharcoal,
      body: Consumer<SettingsProvider>(
        builder: (context, state, child) {
          return state.isLoading
              ? Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                child: SafeArea(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                          vertical: 15.h,
                        ),
                        decoration: BoxDecoration(
                          color: MyColors.darkGrey,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                state.uploadProfileImage(context);
                              },
                              child: CircleAvatar(
                                radius: 35.r,
                                child:
                                    state.profileImage != null &&
                                            state.profileImage!.isNotEmpty
                                        ? ClipOval(
                                          child: Image.file(
                                            File(state.profileImage!),
                                            fit: BoxFit.cover,
                                            width: 70.w,
                                            height: 70.h,
                                          ),
                                        )
                                        : Icon(Icons.person, size: 32.5.r),
                              ),
                            ),
                            SizedBox(width: 20.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  state.userName ?? "User",
                                  style: TextStyle(
                                    color: MyColors.whiteText,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 18.sp,
                                  ),
                                ),
                                SizedBox(height: 3.h),
                                Text(
                                  state.userEmail.toString(),
                                  style: TextStyle(
                                    color: MyColors.greyText,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 13.sp,
                                  ),
                                ),
                                SizedBox(height: 1.h),
                                Text(
                                  "Current Body Weight - ${state.bodyWeight} kg",
                                  style: TextStyle(
                                    color: MyColors.greyText,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 13.sp,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10.h),

                      SettingsTile(
                        title: "Dark Theme",
                        trailingWidget: Switch.adaptive(
                          value: true,
                          onChanged: (value) {},
                        ),
                      ),
                      SettingsTile(
                        title: "Allow Notifications",
                        trailingWidget: Switch.adaptive(
                          value: true,
                          onChanged: (value) {},
                        ),
                      ),
                      SettingsTile(
                        onTapAction: () {
                          context.router.push(UnlockPremiumRoute());
                        },
                        title: "Go Ads Free",
                        trailingWidget: Icon(
                          Icons.diamond_outlined,
                          color: MyColors.graphBarCyan,
                          size: 30.r,
                        ),
                      ),
                      SettingsTile(
                        onTapAction: () {
                          context.router.push(AddCustomExerciseRoute());
                        },
                        title: "Add an exercise",
                        trailingWidget: Icon(
                          Icons.fitness_center,
                          color: MyColors.primaryWhite,
                          size: 28.r,
                        ),
                      ),
                      SettingsTile(
                        title: "Backup Data",
                        trailingWidget: Icon(
                          Icons.lock_outline,
                          color: MyColors.primaryWhite,
                          size: 30.r,
                        ),
                      ),
                      SettingsTile(
                        title: "Privacy Policy",
                        onTapAction: () {
                          context.router.push(PrivacyPolicyPageRoute());
                        },
                        trailingWidget: Icon(
                          Icons.privacy_tip_outlined,
                          color: MyColors.primaryWhite,
                          size: 30.r,
                        ),
                      ),
                      SettingsTile(
                        onTapAction: () {
                          context.router.push(AboutPageRoute());
                        },
                        title: "About FitLifts",
                        trailingWidget: Icon(
                          Icons.info_outline,
                          color: MyColors.primaryWhite,
                          size: 30.r,
                        ),
                      ),
                    ],
                  ),
                ),
              );
        },
      ),
    );
  }
}
