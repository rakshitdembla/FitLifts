part of "settings_imports.dart";

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primaryCharcoal,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),

              decoration: BoxDecoration(
                color: MyColors.darkGrey,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Row(
                children: [
                  CircleAvatar(radius: 35.r, child: Icon(Icons.person)),
                  SizedBox(width: 20.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Rakshit Dembla",
                        style: TextStyle(
                          color: MyColors.whiteText,
                          fontWeight: FontWeight.w900,
                          fontSize: 19.sp,
                        ),
                      ),
                      Text(
                        "rakshitdembla@gmail.com",
                        style: TextStyle(
                          color: MyColors.greyText,
                          fontWeight: FontWeight.w700,
                          fontSize: 14.sp,
                        ),
                      ),
                      Text(
                        "Current Body Weight -> 77.9 kg",
                        style: TextStyle(
                          color: MyColors.greyText,
                          fontWeight: FontWeight.w900,
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

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
                size: 30,
              ),
            ),

            SettingsTile(
              title: "Backup Data",
              trailingWidget: Icon(
                Icons.lock_outline,
                color: MyColors.primaryWhite,
                size: 30,
              ),
            ),
            SettingsTile(
              title: "Privacy Policy",
              trailingWidget: Icon(
                Icons.privacy_tip_outlined,
                color: MyColors.primaryWhite,
                size: 30,
              ),
            ),
            SettingsTile(
              title: "About FitLifts",
              trailingWidget: Icon(
                Icons.info_outline,
                color: MyColors.primaryWhite,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
