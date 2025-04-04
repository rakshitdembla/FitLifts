part of "home_imports.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primaryCharcoal,
      body: RefreshBar(
        onRefresh: () {
          return Provider.of<HomeProvider>(
            context,
            listen: false,
          ).refreshData();
        },
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(15.w, 5.h, 15.w, 10.h),
                  child: Consumer<HomeProvider>(
                    builder: (cntxt, homeProvider, child) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
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
                                onPressed:
                                   () {},
                                icon: Icon(
                                  Icons.diamond,
                                  color: MyColors.whiteText,
                                  size: 28.r,
                                ),
                              ),
                              SizedBox(width: 15.w),
                              Icon(
                                Icons.settings,
                                color: MyColors.whiteText,
                                size: 28.r,
                              ),
                            ],
                          ),
                          SizedBox(height: 20.h),
                          Column(
                            children: [
                              Card(
                                color: MyColors.darkGrey,
                                child: ListTile(
                                  onTap: () {
                                    if (homeProvider.isTracking) {
                                      homeProvider.stopTracking();
                                    } else {
                                      homeProvider.startTracking();
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
                                        : homeProvider.isError
                                        ? Icons.block
                                        : Icons.play_arrow,
                                    color: MyColors.whiteText,
                                    size: 28.r,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8.h),

                          SizedBox(
                            width: double.infinity,
                            child: GridView.count(
                              padding: EdgeInsets.zero,
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              crossAxisCount: 2,
                              childAspectRatio: (113.w / 84.h),
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
                                  value: homeProvider.steps.toString(),
                                ),
                                StatsCard(
                                  containerColor: MyColors.gold,
                                  icon: Icon(
                                    Icons.route,
                                    color: MyColors.darkGold,
                                  ),
                                  title: "Distance",
                                  unit: "km",
                                  value: (homeProvider.distance / 1000)
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
                                  value: homeProvider.calories.toStringAsFixed(
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
                                      homeProvider.workoutVolume
                                                  .toString()
                                                  .length >
                                              8
                                          ? "${homeProvider.workoutVolume.toStringAsFixed(1).substring(0, 8)}..."
                                          : homeProvider.workoutVolume
                                              .toStringAsFixed(1),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10.h),
                          DivideTitle(title: "Explore More"),
                          SizedBox(height: 10.h),
                          ExploreCard(
                            imageAsset: Assets.assetsTrackProgress,
                            title: "Track your fitness journey",
                          ),
                          SizedBox(height: 10.h),
                          ExploreCard(
                            imageAsset: Assets.assetsAbsExercise,
                            title: "Explore new exercises",
                          ),
                          SizedBox(height: 10.h),
                          ExploreCard(
                            imageAsset: Assets.assetsProgressOverload,
                            title: "Your past performances",
                          ),
                          SizedBox(height: 10.h),
                          ExploreCard(
                            imageAsset: Assets.assetsRawWeights,
                            title: "Track Workouts",
                          ),
                          SizedBox(height: 10.h),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
