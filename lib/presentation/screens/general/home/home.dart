part of "home_imports.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    HomeProvider providerListener = Provider.of<HomeProvider>(
      context,
      listen: false,
    );
    final screenWidth = MediaQuery.of(context).size.width;
    final itemWidth = (screenWidth) / 2;
    final itemHeight = itemWidth * (86 / 113);
    return Scaffold(
      backgroundColor: MyColors.primaryCharcoal,
      body: RefreshBar(
        onRefresh: () async {
          if (providerListener.gotInitialData &&
              providerListener.stopTrackingSuccess &&
              !providerListener.isTracking) {
            return providerListener.refreshData();
          } else {
            return await Future.delayed(const Duration(seconds: 1));
          }
        },
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(15.w, 5.h, 15.w, 10.h),
          child: SafeArea(
            child: Column(
              children: [
                Consumer<HomeProvider>(
                  builder: (cntxt, homeProvider, child) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                TabControllerService.persistentTabController
                                    .jumpToTab(4);
                              },
                              child: CircleAvatar(
                                radius: 21.r,
                                child:
                                    homeProvider.profileImage != null &&
                                            homeProvider
                                                .profileImage!
                                                .isNotEmpty
                                        ? ClipOval(
                                          child: Image.file(
                                            File(homeProvider.profileImage!),
                                            fit: BoxFit.cover,
                                            width: 70.w,
                                            height: 70.h,
                                          ),
                                        )
                                        : Icon(Icons.person),
                              ),
                            ),
                            SizedBox(width: 10.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  Greetintgs.getGreetings(),
                                  style: TextStyle(
                                    color: MyColors.greyText,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  "Rakshit Dembla",
                                  style: TextStyle(
                                    color: MyColors.whiteText,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            IconButton(
                              onPressed: () {
                                context.router.push(UnlockPremiumRoute());
                              },
                              icon: Icon(
                                Icons.diamond,
                                color:
                                    Provider.of<CheckPremium>(
                                          cntxt,
                                        ).isUserPremium
                                        ? MyColors.electricBlue
                                        : MyColors.whiteText,
                                size: 28.r,
                              ),
                            ),
                            SizedBox(width: 5.w),
                            IconButton(
                              onPressed: () {
                                TabControllerService.persistentTabController
                                    .jumpToTab(4);
                              },
                              icon: Icon(
                                Icons.settings,
                                color: MyColors.whiteText,
                                size: 28.r,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        Card(
                          color: MyColors.darkGrey,
                          child: ListTile(
                            onTap: () {
                              if (homeProvider.isTracking) {
                                homeProvider.stopTracking();
                              } else {
                                if (homeProvider.gotInitialData &&
                                    homeProvider.stopTrackingSuccess) {
                                  homeProvider.startTracking();
                                } else {
                                  Utils.showCustomToast(
                                    "One moment, your session is being saved...",
                                  );
                                }
                              }
                            },
                            title: Text(
                              homeProvider.isTracking
                                  ? "Tap to stop tracking"
                                  : "Tap to start tracking",
                              style: TextStyle(
                                color: MyColors.whiteText,
                                fontWeight: FontWeight.w900,
                                fontSize: 15.sp,
                              ),
                            ),
                            subtitle: Text(
                              homeProvider.isTracking
                                  ? "Current Status : Tracking.."
                                  : homeProvider.isError
                                  ? "Current Status : Unknown"
                                  : "Current Status : Not Tracking",
                              style: TextStyle(color: MyColors.greyText),
                            ),
                            leading: Icon(
                              homeProvider.isTracking
                                  ? Icons.pause
                                  : Icons.play_arrow,
                              color: MyColors.whiteText,
                              size: 28.r,
                            ),
                          ),
                        ),

                        SizedBox(height: 8.h),

                        GridView.count(
                          padding: EdgeInsets.zero,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          crossAxisCount: 2,
                          childAspectRatio: itemWidth / itemHeight,
                          mainAxisSpacing: 10.h,
                          crossAxisSpacing: 10.w,
                          children: [
                            StatsCard(
                              containerColor: MyColors.tealGreen,
                              icon: Icon(
                                Icons.directions_walk,
                                color: MyColors.tealGreen,
                              ),
                              title: "Steps",
                              unit: "steps",
                              value:
                                  homeProvider.steps.toString().length > 5
                                      ? '${homeProvider.steps.toString().substring(0, 5)}+'
                                      : homeProvider.steps.toString(),
                            ),
                            StatsCard(
                              containerColor: MyColors.gold,
                              icon: Icon(Icons.route, color: MyColors.darkGold),
                              title: "Distance",
                              unit: "km",
                              value:
                                  (homeProvider.distance / 1000)
                                              .toStringAsFixed(2)
                                              .length >
                                          5
                                      ? '${(homeProvider.distance / 1000).toStringAsFixed(2).substring(0, 5)}+'
                                      : (homeProvider.distance / 1000)
                                          .toStringAsFixed(2),
                            ),
                            StatsCard(
                              containerColor: MyColors.fieryRed,
                              icon: Icon(
                                Icons.local_fire_department,
                                color: MyColors.fieryRed,
                              ),
                              title: "Calories",
                              unit: "kcal",
                              value:
                                  homeProvider.calories
                                              .toStringAsFixed(0)
                                              .length >
                                          4
                                      ? '${homeProvider.calories.toStringAsFixed(0).substring(0, 4)}+'
                                      : homeProvider.calories.toStringAsFixed(
                                        0,
                                      ),
                            ),
                            StatsCard(
                              containerColor: MyColors.electricBlue,
                              icon: Icon(
                                Icons.fitness_center,
                                color: MyColors.electricBlue,
                              ),
                              title: "Workout",
                              unit: "kg",
                              value:
                                  homeProvider.workoutVolume.toString().length >
                                          8
                                      ? "${homeProvider.workoutVolume.toStringAsFixed(1).substring(0, 8)}+"
                                      : homeProvider.workoutVolume
                                          .toStringAsFixed(1),
                            ),
                          ],
                        ),

                        SizedBox(height: 10.h),
                        DivideTitle(title: "Explore More"),
                        SizedBox(height: 10.h),
                        ExploreCard(
                          onPressed: () {
                            TabControllerService.persistentTabController
                                .jumpToTab(2);
                          },
                          imageAsset: Assets.assetsTrackProgress,
                          title: "Track your fitness journey",
                        ),
                        ExploreCard(
                          onPressed: () {
                            TabControllerService.persistentTabController
                                .jumpToTab(3);
                          },
                          imageAsset: Assets.assetsProgressOverload,
                          title: "Your past performances",
                        ),
                        ExploreCard(
                          onPressed: () {
                            context.router.push(AddCustomExerciseRoute());
                          },
                          imageAsset: Assets.assetsAbsExercise,
                          title: "Add custom exercise",
                        ),
                        ExploreCard(
                          onPressed: () {
                            TabControllerService.persistentTabController
                                .jumpToTab(1);
                          },
                          imageAsset: Assets.assetsRawWeights,
                          title: "Track Workouts",
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
