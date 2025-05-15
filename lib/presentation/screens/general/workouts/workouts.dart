part of "workouts_imports.dart";

class WorkoutsScreen extends StatefulWidget {
  const WorkoutsScreen({super.key});

  @override
  State<WorkoutsScreen> createState() => _WorkoutsScreenState();
}

class _WorkoutsScreenState extends State<WorkoutsScreen>
    with TickerProviderStateMixin {
  late TabController _controller;
  bool isWorkoutsFetched = false;

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
  void didChangeDependencies() {
    if (!isWorkoutsFetched) {
      isWorkoutsFetched = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Provider.of<FetchWorkoutsProvider>(
          context,
          listen: false,
        ).getWorkouts();
      });
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SizedBox(
        height: 55.h,
        width: 60.w,
        child: FloatingActionButton(
          heroTag: "addworkout_hero",
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          backgroundColor: MyColors.darkGrey,
          onPressed: () {
            context.router.push(AddWorkoutRoute());
          },
          child: Icon(Icons.add, color: MyColors.whiteText, size: 25.sp),
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
            const Color(0x1A448AFF)

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
          RefreshBar(
            onRefresh: () {
              return Provider.of<FetchWorkoutsProvider>(
                context,
                listen: false,
              ).refreshWorkouts();
            },
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Consumer<FetchWorkoutsProvider>(
                builder: (context, state, child) {
                  if (state.isError) {
                    return Center(
                      child: SizedBox(
                        height:
                            MediaQuery.of(context).size.height -
                            kToolbarHeight -
                            kTextTabBarHeight,
                        child: Text(
                          "Error occurred. Please refresh and try again.",
                          style: TextStyle(color: MyColors.greyText),
                        ),
                      ),
                    );
                  } else if (state.noDataAvailable) {
                    return SizedBox(
                      height:
                          MediaQuery.of(context).size.height -
                          kToolbarHeight -
                          kTextTabBarHeight -
                          kBottomNavigationBarHeight,
                      child: Center(
                        child: Text(
                          "No workouts recorded yet.",
                          style: TextStyle(color: MyColors.greyText),
                        ),
                      ),
                    );
                  } else if (state.isLoading) {
                    return SizedBox(
                      height:
                          MediaQuery.of(context).size.height -
                          kToolbarHeight -
                          kTextTabBarHeight -
                          kBottomNavigationBarHeight,
                      child: CircularProgressLoading()
                    );
                  } else {
                    return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
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
                              color: MyColors.whiteText,
                              fontWeight: FontWeight.w900,
                              fontSize: 15.sp,
                            ),
                          ),
                          iconColor: MyColors.whiteText,
                          collapsedIconColor: MyColors.whiteText,
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
                                    style: TextStyle(
                                      color: MyColors.whiteText,
                                    ),
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
            ),
          ),
       ExploreWorkouts()
        ],
      ),
    );
  }
}
