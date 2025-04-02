part of "history_imports.dart";

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primaryCharcoal,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(8.w, 8.h, 8.w, 0),
          child: SafeArea(
            child: Column(
              children: [
                SortBar(title: "Weekly Steps Insights", showDropdown: false),
                SizedBox(height: 15.h),
                StepBarChart(),
                SizedBox(height: 13.h),
                SortBar(title: "Your Past Performances", showDropdown: false),
                SizedBox(height: 10.h),
                Consumer<HistoryDataProvider>(
                  builder: (context, dataProvider, child) {
                    return dataProvider.isLoading
                        ? SizedBox()
                        : dataProvider.historyDataList.isEmpty
                        ? SizedBox(
                          height: MediaQuery.of(context).size.height *0.18,
                          child: Center(
                            child: Text(
                              "No Data Available",
                              style: TextStyle(
                                color: MyColors.greyText,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        )
                        : ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: dataProvider.historyDataList.length,
                          itemBuilder: (context, index) {
                            HistoryDataModel data =
                                dataProvider.historyDataList[index];
                            return PerformanceCard(historyDataModel: data);
                          },
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
