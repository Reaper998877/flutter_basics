import 'dart:math' show max;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartDialog extends StatefulWidget {
  final List<dynamic> list;
  final String type;
  const ChartDialog({super.key, required this.list, required this.type});

  @override
  State<ChartDialog> createState() => _ChartDialogState();
}

class _ChartDialogState extends State<ChartDialog> {
  late SortingOrder currentSortingOrder;
  late IconData currentIcon;
  late List<dynamic> sortedList;

  @override
  void initState() {
    super.initState();
    currentSortingOrder = SortingOrder.ascending;
    currentIcon = Icons.arrow_upward;
    sortedList = List.from(widget.list); // Initialize with the original list
    sortList(); // Ensure the list is sorted initially
  }

  void toggleSorting() {
    setState(() {
      if (currentSortingOrder == SortingOrder.ascending) {
        currentSortingOrder = SortingOrder.descending;
        currentIcon = Icons.arrow_downward;
      } else {
        currentSortingOrder = SortingOrder.ascending;
        currentIcon = Icons.arrow_upward;
      }
      sortList(); // Sort the list whenever the sort order is toggled
    });
  }

  void sortList() {
    setState(() {
      sortedList.sort((a, b) {
        // Sort by amount instead of description/source
        final aValue = a.amount;
        final bValue = b.amount;

        // For ascending order: smaller values come first
        // For descending order: larger values come first
        return currentSortingOrder == SortingOrder.ascending
            ? aValue.compareTo(bValue) // ascending: small to large
            : bValue.compareTo(aValue); // descending: large to small
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Dialog(
      child: widget.list.isEmpty
          ? Container(
              height: screenHeight * 0.20,
              width: screenWidth * 0.8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
              child: Center(
                child: Text(
                  "No Data Found",
                  style:
                      GoogleFonts.amaranth(color: Colors.black, fontSize: 20),
                ),
              ),
            )
          : Container(
              height: screenHeight * 0.50,
              width: screenWidth * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.type == "income"
                            ? "Income Chart"
                            : widget.type == "fixedExp"
                                ? "Fixed Expenses Chart"
                                : "Variable Expenses Chart",
                        style: GoogleFonts.amaranth(
                            color: Colors.black, fontSize: 20),
                      ),
                      IconButton(
                        onPressed: toggleSorting,
                        icon: Icon(
                          currentIcon,
                          color: Colors.black,
                          size: 25,
                        ),
                      ),
                    ],
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SizedBox(
                        width: max(800, sortedList.length * 100.0),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 30.0),
                          child: _buildTrackerColumnChart(),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "Total amount earned : Rs 80000",
                    style:
                        GoogleFonts.amaranth(color: Colors.black, fontSize: 20),
                  ),
                ],
              ),
            ),
    );
  }

  SfCartesianChart _buildTrackerColumnChart() {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      zoomPanBehavior:
          ZoomPanBehavior(zoomMode: ZoomMode.x, enablePinching: true),
      primaryXAxis: CategoryAxis(
        majorGridLines: const MajorGridLines(width: 0),
        labelRotation: 45,
        plotOffset: 20,
      ),
      primaryYAxis: NumericAxis(
        title: const AxisTitle(
            text: 'Amount (Rs)', textStyle: TextStyle(color: Colors.black)),
        maximum: getMax(sortedList),
        interval: getInterval(sortedList),
        axisLine: const AxisLine(width: 0),
        majorGridLines: const MajorGridLines(width: 0),
        majorTickLines: const MajorTickLines(size: 0),
      ),
      series: _getTracker(),
      tooltipBehavior: TooltipBehavior(
        enable: true,
        canShowMarker: false,
        header: '',
        format: 'point.x : point.y',
      ),
    );
  }

  List<ColumnSeries<dynamic, String>> _getTracker() {
    return <ColumnSeries<dynamic, String>>[
      ColumnSeries<dynamic, String>(
        dataSource: sortedList,
        isTrackVisible: true,
        width: 0.5,
        spacing: 0.2,
        color: Colors.blue,
        trackColor: const Color.fromRGBO(198, 201, 207, 1),
        borderRadius: BorderRadius.circular(5),
        xValueMapper: (dynamic i, _) =>
            widget.type == "income" ? i.incomeSource : i.expDescription,
        yValueMapper: (dynamic i, _) => i.amount,
        dataLabelSettings: const DataLabelSettings(
          isVisible: true,
          labelAlignment: ChartDataLabelAlignment.top,
          textStyle: TextStyle(fontSize: 10, color: Colors.white),
        ),
      ),
    ];
  }

  double getMax(List<dynamic> list) {
    if (list.isEmpty) return 0;
    return list.map((item) => item.amount).reduce((a, b) => a > b ? a : b);
  }

  double getInterval(List<dynamic> list) {
    if (list.isEmpty) return 0;

    final max = getMax(list);
    // Round up to the nearest nice number
    if (max <= 100) return 20;
    if (max <= 500) return 100;
    if (max <= 1000) return 200;
    if (max <= 5000) return 1000;
    if (max <= 10000) return 2000;
    if (max <= 50000) return 10000;
    if (max <= 100000) return 20000;

    // For very large numbers, divide into 5 parts and round up
    return (max / 5).ceil().toDouble();
  }
}
