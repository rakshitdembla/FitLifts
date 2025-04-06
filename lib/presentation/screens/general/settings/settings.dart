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
              ? CircularProgressLoading()
              : SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 15.h),
                child: SafeArea(
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          context.router.push(
                            UpdateProfilePageRoute(
                              previousName: state.userName,
                              previousBodyWeight: state.bodyWeight,
                            ),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 30.w,
                            vertical: 15.h,
                          ),
                          decoration: BoxDecoration(
                            color: MyColors.darkGrey,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 35.r,
                                child: ClipOval(
                                  child:
                                      state.profileImage != null &&
                                              state.profileImage!.isNotEmpty
                                          ? Image.network(
                                            state.profileImage!,
                                            fit: BoxFit.cover,
                                            width: 70.w,
                                            height: 70.h,
                                          )
                                          : Icon(Icons.person, size: 32.5.r),
                                ),
                              ),

                              Spacer(),
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
                                    state.userEmail ?? "user@example.com",
                                    style: TextStyle(
                                      color: MyColors.greyText,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 13.sp,
                                    ),
                                  ),
                                  SizedBox(height: 1.h),
                                  Text(
                                    "Body Weight - ${state.bodyWeight} kg",
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
                      ),
                      SizedBox(height: 10.h),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: Text(
                          "Dark Theme",
                          style: TextStyle(
                            color: MyColors.whiteText,
                            fontWeight: FontWeight.w700,
                            fontSize: 17.sp,
                          ),
                        ),
                        trailing: Switch.adaptive(
                          activeColor: MyColors.whiteText,
                          activeTrackColor: MyColors.electricBlue,
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
                        onTapAction: () {
                          context.router.push(TrackingAccuracyPageRoute());
                        },
                        title: "Tracking Accuracy",
                        trailingWidget: Icon(
                          Icons.android,
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
