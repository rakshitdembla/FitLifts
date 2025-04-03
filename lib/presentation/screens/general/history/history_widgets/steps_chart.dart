import 'package:fitlifts/core/constants/my_colors.dart';
import 'package:fitlifts/presentation/screens/general/history/providers/graph_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../../../../data/models/graph_model.dart';

class StepBarChart extends StatefulWidget {
  const StepBarChart({super.key});

  @override
  State<StepBarChart> createState() => _StepBarChartState();
}

class _StepBarChartState extends State<StepBarChart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350.h,
      width: double.infinity.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: MyColors.electricBlue,
      ),

      padding: const EdgeInsets.all(16),

      child: Consumer<GraphProvider>(
        builder: (context, graphProvider, child) {
          return
          
              graphProvider.isLoading
                    ? Center(
                      child: CircularProgressIndicator(color: MyColors.whiteText,)
                    )
                    :
              SfCartesianChart(
                title: ChartTitle(
                  text: "Last 7 Days Steps",
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 10.sp,
                  ),
                  alignment: ChartAlignment.center,
                ),
                margin: EdgeInsets.zero,
                enableAxisAnimation: true,
                //sync fusion widget
                borderColor: Colors.transparent,
                plotAreaBorderColor: Colors.transparent,

                primaryXAxis: CategoryAxis(
                  //x axis settings
                  majorGridLines: const MajorGridLines(width: 0),
                  axisLine: const AxisLine(width: 0),
                  labelStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                primaryYAxis: NumericAxis(
                  //y axis settings
                  majorGridLines: const MajorGridLines(width: 0),
                  axisLine: const AxisLine(width: 0), // Remove X-axis line
                  minimum: 0,
                  interval: graphProvider.interval,
                  maximum: graphProvider.maximum,
                  labelStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                  ),
                ),

                series: [
                  //data defined in series all details about chart
                  ColumnSeries<GraphDataModel, String>(
                    //column serier bar chart
                    dataSource: graphProvider.filteredList,
                    xValueMapper: (GraphDataModel data, _) => data.date,
                    borderRadius: BorderRadius.circular(30),
                    width: 0.3.r,
                    animationDuration: 1000,
                    yValueMapper: (GraphDataModel data, _) => data.steps,
                    color: Colors.white,
                    dataLabelSettings: const DataLabelSettings(
                      isVisible: true,
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ],
              );
        },
      ),
    );
  }
}
