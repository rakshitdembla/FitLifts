part of "unlock_premium_imports.dart";

@RoutePage()
class UnlockPremium extends StatefulWidget {
  const UnlockPremium({super.key});

  @override
  State<UnlockPremium> createState() => _UnlockPremiumState();
}

class _UnlockPremiumState extends State<UnlockPremium> {
  late UnlockPremiumProvider provider;
  @override
  void initState() {
    super.initState();
    provider = Provider.of<UnlockPremiumProvider>(context, listen: false);
    Provider.of<UnlockPremiumProvider>(context, listen: false).initStateFN();
  }

  @override
  void dispose() {
    provider.disposeFN();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primaryCharcoal,

      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 14.w),
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.bottomRight,
                  child: IconButton(
                    onPressed: () {
                      context.router.pop();
                    },
                    icon: Icon(Icons.cancel, size: 27.5.r),
                  ),
                ).animate().fadeIn(
                  delay: 2400.ms,
                  duration: 600.ms,
                  curve: Curves.easeOut,
                ),
                Text(
                  "Upgrade to Pro Fitness",
                  style: TextStyle(
                    color: MyColors.whiteText,

                    fontWeight: FontWeight.w900,
                    fontSize: 25.sp,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  "Exclusive features to push your fitness journey to the next level—100% Ad-Free!",
                  style: TextStyle(
                    color: MyColors.greyText,

                    fontWeight: FontWeight.w900,
                    fontSize: 15.sp,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20.h),
                Advantages(
                  h1: "Ad-Free Experience",
                  h2: "No more distractions—enjoy the app without ads.",
                  icon: Icon(Icons.block, color: Colors.redAccent, size: 35.r),
                ).animate().slideX(
                  begin: -1.0,
                  duration: 600.ms,
                  curve: Curves.easeOut,
                ),

                SizedBox(height: 14.h),
                Advantages(
                  h1: "Backup Your Data",
                  h2: "Never lose your progress, securely restore anytime.",
                  icon: Icon(
                    Icons.cloud,
                    color: MyColors.primaryWhite,
                    size: 35.r,
                  ),
                ).animate().slideX(
                  begin: -1.0,
                  delay: 600.ms,
                  duration: 600.ms,
                  curve: Curves.easeOut,
                ),
                SizedBox(height: 14.h),
                Advantages(
                  h1: "One-Time Payment",
                  h2: "Lifetime access for just ₹199—no recurring fees!",
                  icon: Icon(
                    Icons.attach_money,
                    color: MyColors.vibrantGreen,
                    size: 35.r,
                  ),
                ).animate().slideX(
                  begin: -1.0,
                  delay: 1200.ms,
                  duration: 600.ms,
                  curve: Curves.easeOut,
                ),
                SizedBox(height: 14.h),
                Advantages(
                  h1: "Exclusive Premium Perks",
                  h2: "Access future updates and special features.",
                  icon: Icon(
                    Icons.diamond,
                    color: MyColors.cyan,
                    size: 35.r,
                  ),
                ).animate().slideX(
                  begin: -1.0,
                  delay: 1800.ms,
                  duration: 600.ms,
                  curve: Curves.easeOut,
                ),

                Spacer(),
                BottomWidget().animate().fadeIn(
                  delay: 2400.ms,
                  duration: 600.ms,
                  curve: Curves.easeOut,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
