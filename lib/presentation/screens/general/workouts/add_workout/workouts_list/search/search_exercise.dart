import 'package:auto_route/auto_route.dart';
import 'package:fitlifts/core/constants/my_colors.dart';
import 'package:fitlifts/data/models/exercise.dart';
import 'package:fitlifts/presentation/common_widgets/circular_progress.dart';
import 'package:fitlifts/presentation/screens/general/workouts/add_workout/workouts_list/search/search_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

@RoutePage()
class SearchExercise extends StatefulWidget {
  final List<List<Exercise>> allExercises;
  const SearchExercise({super.key, required this.allExercises});

  @override
  State<SearchExercise> createState() => _SearchExerciseState();
}

class _SearchExerciseState extends State<SearchExercise> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primaryCharcoal,
      appBar: AppBar(
         scrolledUnderElevation: 0.0,
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(color: MyColors.whiteText),
        backgroundColor: MyColors.primaryCharcoal,
        title: TextField(
          cursorColor: MyColors.electricBlue,
          style: TextStyle(color: MyColors.whiteText, fontSize: 17.sp),
          onChanged: (value) {
            Provider.of<SearchProvider>(
              context,
              listen: false,
            ).searchExercise(value, widget.allExercises);
          },
          decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: MyColors.electricBlue),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: MyColors.electricBlue),
            ),
            prefixIcon: Icon(Icons.search, color: MyColors.whiteText),
            hintText: "Search any exercise",
            hintStyle: TextStyle(fontSize: 16.sp),
          ),
        ),
      ),
      body: Consumer<SearchProvider>(
        builder: (context, searchProvider, child) {
          return searchProvider.isLoading
              ? CircularProgressLoading()
              : ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 12.h),
                itemCount: searchProvider.filteredList.length,
                itemBuilder: (context, index) {
                  Exercise exercise = searchProvider.filteredList[index];
                  return Card(
                    child: InkWell(
                      onTap: () {
                        context.router.pop();
                        context.router.pop(exercise.name);
                      },
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        tileColor: MyColors.darkGrey,
                        title: Text(
                          exercise.name,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,

                          style: TextStyle(
                            color: MyColors.whiteText,
                            fontWeight: FontWeight.w900,
                            fontSize: 15.sp,
                          ),
                        ),
                        subtitle: Text(
                          exercise.equipment,
                          style: TextStyle(color: MyColors.greyText),
                        ),
                        trailing: Icon(
                          Icons.arrow_right,
                          color: MyColors.whiteText,
                          size: 25.r,
                        ),
                      ),
                    ),
                  );
                },
              );
        },
      ),
    );
  }
}
