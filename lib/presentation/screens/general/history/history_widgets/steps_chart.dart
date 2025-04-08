import 'package:fitlifts/core/constants/my_colors.dart';
import 'package:fitlifts/presentation/common_widgets/circular_progress.dart';
import 'package:fitlifts/presentation/screens/general/history/providers/chart_provider.dart';
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
        borderRadius: BorderRadius.circular(20.r),
        color: MyColors.electricBlue,
      ),

      padding: EdgeInsets.all(16.r),

      child: Consumer<ChartProvider>(
        builder: (context, chartProvider, child) {
          return chartProvider.isLoading
              ? CircularProgressLoading()
              : SfCartesianChart(
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
                  interval: chartProvider.interval,
                  maximum: chartProvider.maximum,
                  labelStyle:  TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: MediaQuery.of(context).size.width * 0.03,

                  ),
                ),

                series: [
                  ColumnSeries<GraphDataModel, String>(
                    dataSource: chartProvider.filteredList,
                    xValueMapper: (GraphDataModel data, _) => data.date,
                    borderRadius: BorderRadius.circular(30.r),
                    width: 0.2.w,
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
