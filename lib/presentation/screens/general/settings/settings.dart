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

      Provider.of<AdsProvider>(
        context,
        listen: false,
      ).initializeSettingsAd(context);
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primaryCharcoal,
      body: Consumer<SettingsProvider>(
        builder: (context, state, child) {
          return RefreshBar(
            onRefresh: () {
              return state.getUserData();
            },
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
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
                      child:
                          state.isLoading
                              ? SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: 100.h,
                                child: CircularProgressLoading(),
                              )
                              : Container(
                                decoration: BoxDecoration(
                                  color: MyColors.darkGrey,
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                child: Stack(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 5.w,
                                        vertical: 4.h,
                                      ),
                                      child: Align(
                                        alignment: Alignment.topRight,
                                        child: Icon(
                                          Icons.edit_note,
                                          color: MyColors.whiteText,
                                          size: 18.r,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 25.w,
                                        vertical: 15.h,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          CircleAvatar(
                                            radius: 35.r,
                                            child: ClipOval(
                                              child:
                                                  state.profileImage != null &&
                                                          state
                                                              .profileImage!
                                                              .isNotEmpty
                                                      ? Image.network(
                                                        state.profileImage!,
                                                        fit: BoxFit.cover,
                                                        width: 70.w,
                                                        height: 70.h,
                                                      )
                                                      : Icon(
                                                        Icons.person,
                                                        size: 32.5.r,
                                                      ),
                                            ),
                                          ),
                                          SizedBox(width: 30.w),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
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
                                                  state.userEmail ??
                                                      "user@example.com",
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
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                    ),
                    SizedBox(height: 10.h),

                    // Consumer<ThemeProvider>(

                    //   builder: (context, state,child) {
                    //     return ListTile(
                    //       contentPadding: EdgeInsets.zero,
                    //       leading: Text(
                    //         "Dark Theme",
                    //         style: TextStyle(
                    //           color: MyColors.whiteText,
                    //           fontWeight: FontWeight.w700,
                    //           fontSize: 17.sp,
                    //         ),
                    //       ),
                    //       trailing: Switch.adaptive(
                    //         activeColor: MyColors.whiteText,
                    //         activeTrackColor: MyColors.electricBlue,
                    //         value: state.isDarkTheme,
                    //         onChanged: (value) {
                    //           state.toogleTheme(value);
                    //         },
                    //       ),
                    //     );
                    //   },
                    // ),
                    SettingsTile(
                      onTapAction: () {
                        context.router.push(UnlockPremiumRoute());
                      },
                      title: "Go Ads Free",
                      trailingWidget: Icon(
                        Icons.diamond_outlined,
                        color: MyColors.cyan,
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
                    Builder(
                      builder: (cntxt) {
                        UserInitialDetailsProvider userInitialDetailsProvider =
                            Provider.of<UserInitialDetailsProvider>(context);
                        ExportImportDbProvider dbProvider =
                            Provider.of<ExportImportDbProvider>(cntxt);
                        return Column(
                          children: [
                            SettingsTile(
                              title: "Export Data",
                              onTapAction: () {
                                userInitialDetailsProvider.isUserPremium
                                    ? dbProvider.showDialogBox(
                                      "Export Data Info!",
                                      """- Do not change anything in the exported file manually. Doing so may cause errors or data loss if you try to import it again.""",
                                      () {
                                        context.router.pop();
                                        dbProvider.exportDB();
                                      },
                                      context,
                                    )
                                    : Utils.showCustomToast(
                                      "Upgrade to Premium to export your workout data.",
                                    );
                              },
                              trailingWidget:
                                  dbProvider.isExportingDb
                                      ? SettingsLoading()
                                      : Icon(
                                        Icons.outbox_outlined,
                                        color: MyColors.primaryWhite,
                                        size: 29.r,
                                      ),
                            ),
                            SettingsTile(
                              title: "Import Data",
                              onTapAction: () {
                                userInitialDetailsProvider.isUserPremium
                                    ? dbProvider.showDialogBox(
                                      "Import Data Warning!",
                                      """- Importing data will erase all your current records, if any.\n
- Proceed only if you have backed up your data.""",
                                      () async {
                                        await dbProvider.importDB();
                                        if (context.mounted) {
                                          context.router.pop();
                                        }
                                      },
                                      context,
                                    )
                                    : Utils.showCustomToast(
                                      "Premium required to restore your saved data.",
                                    );
                              },
                              trailingWidget:
                                  dbProvider.isImportingDb
                                      ? SettingsLoading()
                                      : Icon(
                                        Icons.move_to_inbox_outlined,
                                        color: MyColors.primaryWhite,
                                        size: 29.r,
                                      ),
                            ),

                            SettingsTile(
                              title: "Delete Everything",
                              trailingWidget:
                                  dbProvider.isDeleteingData
                                      ? SettingsLoading()
                                      : Icon(
                                        Icons.delete_forever,
                                        color: MyColors.primaryWhite,
                                        size: 28.r,
                                      ),
                              onTapAction: () {
                                dbProvider.showDialogBox(
                                  "Delete Data Warning!",
                                  """- This action will permanently delete all your records.\n
- This cannot be undone. Proceed with caution.""",
                                  dbProvider.removeAllData,
                                  context,
                                );
                              },
                            ),
                          ],
                        );
                      },
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
                    SettingsTile(
                      title: "Logout",
                      trailingWidget:
                          state.isLoggingOutLoading
                              ? SettingsLoading()
                              : Icon(
                                Icons.logout,
                                color: MyColors.primaryWhite,
                                size: 28.r,
                              ),
                      onTapAction: () {
                        state.logout(context);
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
