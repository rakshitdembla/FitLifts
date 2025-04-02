part of "workouts_imports.dart";

class WorkoutsScreen extends StatefulWidget {
  const WorkoutsScreen({super.key});

  @override
  State<WorkoutsScreen> createState() => _WorkoutsScreenState();
}

class _WorkoutsScreenState extends State<WorkoutsScreen>
    with TickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    _controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SizedBox(
        height: 63.h,
        width: 63.w,
        child: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          backgroundColor: MyColors.darkGrey,
          onPressed: () {
            context.router.push(AddWorkoutRoute());
          },
          child: Icon(Icons.add, color: MyColors.primaryWhite, size: 25.sp),
        ),
      ),
      backgroundColor: MyColors.primaryCharcoal,
      appBar: AppBar(
        toolbarHeight: 10.h,
        backgroundColor: MyColors.primaryCharcoal,
        automaticallyImplyLeading: false,
        bottom: TabBar(
          indicatorColor: MyColors.electricBlue,
          overlayColor: WidgetStateProperty.all(
            Colors.blueAccent.withOpacity(0.1),
          ),
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(width: 2.0.w, color: MyColors.electricBlue),
            insets: EdgeInsets.zero,
          ),
          indicatorSize: TabBarIndicatorSize.tab,
          dividerColor: Colors.transparent,
          labelColor: MyColors.whiteText,
          unselectedLabelColor: const Color.fromARGB(212, 158, 158, 158),
          labelStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 14.sp),
          controller: _controller,
          tabs: [Tab(text: "Track Workouts"), Tab(text: "Explore Workouts")],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: [
          Consumer<FetchWorkoutsProvider>(
            builder: (context, state, child) {
              if (state.isError) {
                return Center(
                  child: Text(
                    "Error occurred. Please refresh and try again.",
                    style: TextStyle(color: MyColors.greyText),
                  ),
                );
              } else if (state.noDataAvailable) {
                return Center(
                  child: Text(
                    "No workouts recorded yet.",
                    style: TextStyle(color: MyColors.greyText),
                  ),
                );
              } else if (state.isLoading) {
                return Center(child: CircularProgressIndicator());
              } else {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.groupedList.length,
                  itemBuilder: (context, index) {
                    String date = state.groupedList[index].key;
                    List<WorkoutModel> dateWorkouts =
                        state.groupedList[index].value;
                    return ExpansionTile(
                      tilePadding: EdgeInsets.symmetric(
                        horizontal: 15.w,
                        vertical: 4.h,
                      ),
                      title: Text(
                        date,
                        style: TextStyle(
                          color: MyColors.primaryWhite,
                          fontWeight: FontWeight.w900,
                          fontSize: 15.sp,
                        ),
                      ),
                      iconColor: MyColors.primaryWhite,
                      collapsedIconColor: MyColors.primaryWhite,
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: dateWorkouts.length,
                          itemBuilder: (context, index) {
                            WorkoutModel workout = dateWorkouts[index];
                            return ListTile(
                              leading: Text(
                                "${index + 1}",
                                style: TextStyle(
                                  color: MyColors.whiteText,
                                  fontSize: 13.sp,
                                ),
                              ),
                              title: Text(
                                workout.exerciseName,
                                style: TextStyle(color: MyColors.primaryWhite),
                              ),
                              subtitle: Text(
                                "${workout.reps} reps * ${workout.weight} kg",
                                style: TextStyle(color: MyColors.greyText),
                              ),
                              trailing: Text(
                                DateFormat("hh:mm a").format(workout.date),
                                style: TextStyle(
                                  color: MyColors.greyText,
                                  fontSize: 11.sp,
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    );
                  },
                );
              }
            },
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 13.h),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      context.router.push(
                        ExercisesViewRoute(
                          appBarTitle: "Abs",
                          exercisesList: absExercises,
                        ),
                      );
                    },
                    child: ExploreCard(
                      imageAsset: Assets.assetsFullBody,
                      title: 'Abs',
                    ),
                  ),
                  SizedBox(height: 10.h),
                  InkWell(
                    onTap: () {
                      context.router.push(
                        ExercisesViewRoute(
                          appBarTitle: "Cardio",
                          exercisesList: cardioExercises,
                        ),
                      );
                    },
                    child: ExploreCard(
                      imageAsset: Assets.assetsGirlCardio,
                      title: "Cardio",
                    ),
                  ),
                  SizedBox(height: 10.h),
                  InkWell(
                    onTap: () {
                      context.router.push(
                        ExercisesViewRoute(
                          appBarTitle: "Chest",
                          exercisesList: chestExercises,
                        ),
                      );
                    },
                    child: ExploreCard(
                      imageAsset: Assets.assetsChest,
                      title: "Chest",
                    ),
                  ),
                  SizedBox(height: 10.h),
                  InkWell(
                    onTap: () {
                      context.router.push(
                        ExercisesViewRoute(
                          appBarTitle: "Arms",
                          exercisesList: armsExercises,
                        ),
                      );
                    },
                    child: ExploreCard(
                      imageAsset: Assets.assetsArms,
                      title: "Arms",
                    ),
                  ),
                  SizedBox(height: 10.h),
                  InkWell(
                    onTap: () {
                      context.router.push(
                        ExercisesViewRoute(
                          appBarTitle: "Shoulder",
                          exercisesList: shoulderExercises,
                        ),
                      );
                    },
                    child: ExploreCard(
                      imageAsset: Assets.assetsShoulder,
                      title: "Shoulder",
                    ),
                  ),
                  SizedBox(height: 10.h),
                  InkWell(
                    onTap: () {
                      context.router.push(
                        ExercisesViewRoute(
                          appBarTitle: "Back",
                          exercisesList: backExercises,
                        ),
                      );
                    },
                    child: ExploreCard(
                      imageAsset: Assets.assetsBack,
                      title: "Back",
                    ),
                  ),
                  SizedBox(height: 10.h),
                  InkWell(
                    onTap: () {
                      context.router.push(
                        ExercisesViewRoute(
                          appBarTitle: "Legs",
                          exercisesList: legExercises,
                        ),
                      );
                    },
                    child: ExploreCard(
                      imageAsset: Assets.assetsSquatsGirl,
                      title: "Legs",
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
