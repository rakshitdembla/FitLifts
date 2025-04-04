part of "history_imports.dart";

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  bool isInitialDataLoaded = false;

  @override
  void didChangeDependencies() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!isInitialDataLoaded) {
        Provider.of<GraphProvider>(context, listen: false).getWeekSteps();
        Provider.of<HistoryDataProvider>(
          context,
          listen: false,
        ).getHistoryData();
        isInitialDataLoaded = true;
      }
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.primaryCharcoal,
        automaticallyImplyLeading: false,
        title: Text(
          "Past Performances",
          style: TextStyle(
            color: MyColors.whiteText,
            fontWeight: FontWeight.w900,
            fontSize: 19.sp,
          ),
        ),
        actions: [
          CustomDropDown(
            style: GoogleFonts.poppins(color: MyColors.greyText, fontSize: 13),
            hintText: "Sort by",
            items: [
              DropdownMenuItem<String>(value: "latest", child: Text("Latest")),
              DropdownMenuItem<String>(value: "oldest", child: Text("Oldest")),
            ],
            value:
                Provider.of<HistoryDataProvider>(
                  context,
                  listen: false,
                ).currentDropdownValue,
                onChanged: (value) {
              if (value != null) {
                Provider.of<HistoryDataProvider>(context,listen: false).updateSort(value);
              }} ,
          ),
        ],
      ),
      backgroundColor: MyColors.primaryCharcoal,
      body: RefreshBar(
        onRefresh: () {
          return Provider.of<HistoryDataProvider>(
            context,
            listen: false,
          ).refresh(context);
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(8.w, 2.h, 8.w, 5.h),
            child: SafeArea(
              child: Column(
                children: [
                  StepBarChart(),
                  SizedBox(height: 10.h),
                  Consumer<HistoryDataProvider>(
                    builder: (context, dataProvider, child) {
                      return dataProvider.isLoading
                          ? SizedBox()
                          : dataProvider.historyDataList.isEmpty
                          ? SizedBox(
                            height: MediaQuery.of(context).size.height - (350.h + kBottomNavigationBarHeight),
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
      ),
    );
  }
}
