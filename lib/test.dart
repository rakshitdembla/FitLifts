import 'package:fitlifts/core/constants/my_colors.dart';
import 'package:fitlifts/data/data_source/local/sqf%20database/db_helper.dart';
import 'package:fitlifts/data/models/step_model.dart';
import 'package:flutter/material.dart';

class TestDataScreen extends StatefulWidget {
  const TestDataScreen({super.key});

  @override
  State<TestDataScreen> createState() => _TestDataScreenState();
}

class _TestDataScreenState extends State<TestDataScreen> {
  List<StepModel> stepmodels = [];

  @override
  void initState() {
    getdata();
    super.initState();
  }

  Future<void> getdata() async {
    stepmodels = await DBHelper().getAllSteps(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darkGold,
      body: ListView.builder(
        itemCount: stepmodels.length,
        itemBuilder: (context, index) {
          StepModel step = stepmodels[index];
          return ListTile(
            title: Text(step.calories.toString()),
            subtitle: Text(step.date.toString()),
            leading: Text(step.distance.toString()),
            trailing: Text(step.stepCount.toString()),
          );
        },
      ),
    );
  }
}
