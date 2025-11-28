import 'package:flutter/material.dart';
import 'package:flutter_basics/models.dart';
import 'package:flutter_basics/app_theme.dart';
import 'package:flutter_basics/widgets/build_data_table.dart';
import 'package:flutter_basics/widgets/build_dialog.dart';
import 'package:flutter_basics/widgets/chart_dialog.dart';
import 'package:flutter_basics/widgets/stateless_widgts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sliver_sticky_collapsable_panel/utils/sliver_sticky_collapsable_panel_controller.dart';
import 'package:sliver_sticky_collapsable_panel/widgets/sliver_sticky_collapsable_panel.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  final ScrollController _scrollController = ScrollController();
  final StickyCollapsablePanelController stickyCollapsablePanelController =
      StickyCollapsablePanelController();
  final incomeCols = ['Income Source', 'Amount'],
      expenseCols = ['Description', 'Amount'];

  List<Income> incomeList = [
        Income(incomeSource: "IMMO", amount: 42000),
        Income(incomeSource: "Mutual Funds", amount: 0),
        Income(incomeSource: "Room Rent", amount: 8000),
        Income(incomeSource: "Fixed Deposit", amount: 4000),
        Income(incomeSource: "fFiposit", amount: 4000),
        Income(incomeSource: "fShent", amount: 8000),
      ],
      incomeSearched = [];
  List<Expense> fixedExpenses = [
        Expense(expDescription: "Mobile Recharge", amount: 1600),
        Expense(expDescription: "TV Recharge", amount: 253),
        Expense(expDescription: "Wifi Recharge", amount: 999),
        Expense(expDescription: "qwerty", amount: 300),
        Expense(expDescription: "asdfgh", amount: 600),
        Expense(expDescription: "Car EMI", amount: 8000),
      ],
      fixedExpSearched = [];
  List<Expense> variableExpenses = [
        Expense(expDescription: "Electricity Bill", amount: 800),
        Expense(expDescription: "Water Bill", amount: 100),
        Expense(expDescription: "Car Petrol", amount: 2300),
        Expense(expDescription: "Activa Petrol", amount: 200),
        Expense(expDescription: "Fruits", amount: 500),
        Expense(expDescription: "qwerty", amount: 300),
      ],
      variableExpSearched = [];

  int? incomeSortIndex, fixedExpSortIndex, variableExpSortIndex;
  bool incomeIsAscending = false,
      fixedExpIsAscending = false,
      variableExpIsAscending = false;

  String _searchQuery1 = '', _searchQuery2 = '', _searchQuery3 = '';

  double _scaleFactor = 1.0;
  double _translateX = 0.0;
  double _translateY = 0.0;
  double _startX = 0.0;
  double _startY = 0.0;

  final double _maxScale = 4.0;
  final double _minScale = 1.0;

  @override
  Widget build(BuildContext context) {
    incomeSearched = incomeList
        .where(
          (Income s) => s.incomeSource.toLowerCase().contains(
            _searchQuery1.toLowerCase(),
          ),
        )
        .toList();
    fixedExpSearched = fixedExpenses
        .where(
          (Expense s) => s.expDescription.toLowerCase().contains(
            _searchQuery2.toLowerCase(),
          ),
        )
        .toList();
    variableExpSearched = variableExpenses
        .where(
          (Expense s) => s.expDescription.toLowerCase().contains(
            _searchQuery3.toLowerCase(),
          ),
        )
        .toList();
    return Scaffold(
      appBar: CustomAppBar(title: 'Part 2'),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                  width: double.infinity,
                  child: const Text(
                    "Part 2 : Widgets - DataTable, DataColumn, DataRow, DataCell\nFeatures - Add, Delete and Edit DataTable rows, Sort DataTable columns in ascending and descending order, Search in DataTable",
                    style: TextStyle(
                      color: Colors.lightBlue,
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                      letterSpacing: 0.4,
                      shadows: [
                        BoxShadow(
                          color: Colors.black,
                          spreadRadius: 2,
                          blurStyle: BlurStyle.outer,
                          blurRadius: 2,
                        ),
                      ],
                    ),
                    softWrap: true,
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
              GestureDetector(
                onDoubleTap: () {
                  setState(() {
                    // _scaleFactor = _scaleFactor == 1.0 ? _maxScale : _minScale;: This line checks the current value of _scaleFactor.
                    // If _scaleFactor is equal to 1.0 ( means the image is at its normal size), it sets _scaleFactor to _maxScale (the maximum zoom level).
                    // If _scaleFactor is not 1.0, it sets it back to _minScale (the minimum zoom level).
                    _scaleFactor = _scaleFactor == 1.0 ? _maxScale : _minScale;
                    _translateX = 0.0;
                    // _translateX = 0.0 This line resets the horizontal translation of the image to 0.0. This means that when the user zooms in, the image will be centered in the view (i.e., it won't be offset to the left or right).
                    _translateY = 0.0;
                    // _translateY = 0.0 Similarly, this line resets the vertical translation to 0.0. This means that the image will also be vertically centered in the view when zoomed.
                  });
                },
                onPanStart: (DragStartDetails details) {
                  // Callback that will be triggered when the user begins dragging finger on the image).
                  // (DragStartDetails details): Defines the parameters of the callback. DragStartDetails contains information about the drag gesture, including the starting position of the touch. The details variable will hold this information.
                  _startX = details.localPosition.dx - _translateX;
                  // _startX = details.localPosition.dx - _translateX;: Calculates the starting X position of the user's drag relative to the current position of the image.
                  // details.localPosition.dx: Retrieves the X coordinate of the touch point in the local coordinate system of the widget (i.e., the container where the image is).
                  // - _translateX: This subtracts the current horizontal translation of the image (_translateX). This adjustment helps determine where the user started dragging relative to the current position of the image, which is important for smooth panning.
                  _startY = details.localPosition.dy - _translateY;
                  // _startY = details.localPosition.dy - _translateY;: Similarly, this line calculates the starting Y position of the user's drag.
                  // details.localPosition.dy: This retrieves the Y coordinate of the touch point in the local coordinate system.
                  // - _translateY: This subtracts the current vertical translation of the image (_translateY), allowing you to find the vertical position relative to the image’s current position.
                },
                onPanUpdate: (DragUpdateDetails details) {
                  // Callback that will be triggered continuously as the user drags finger on the screen.
                  // DragUpdateDetails contains information about the drag gesture, including the current position of the touch. The details variable holds this information.
                  setState(() {
                    _translateX = details.localPosition.dx - _startX;
                    // _translateX = details.localPosition.dx - _startX;: This line calculates the new horizontal translation of the image based on the current drag position.
                    // details.localPosition.dx: This retrieves the current X coordinate of the touch point in the local coordinate system of the widget (i.e., the container).
                    // - _startX: This subtracts the initial X position captured during the onPanStart gesture. The result is the current translation needed to position the image correctly based on how far the user has dragged.
                    _translateY = details.localPosition.dy - _startY;
                    // _translateY = details.localPosition.dy - _startY;: Similarly, this line calculates the new vertical translation of the image.
                    // details.localPosition.dy: This retrieves the current Y coordinate of the touch point in the local coordinate system.
                    // - _startY: This subtracts the initial Y position captured during the onPanStart gesture, allowing for the correct positioning of the image based on the user's vertical drag.
                  });
                },
                child: ClipRect(
                  child: SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.90,
                    height: MediaQuery.sizeOf(context).height * 0.40,
                    child: Transform(
                      transform: Matrix4.identity()
                        ..translate(_translateX, _translateY)
                        ..scale(_scaleFactor),
                      alignment: FractionalOffset.center,
                      child: Image.asset(
                        'res/img/expense_chart.png',
                        width: MediaQuery.sizeOf(context).width * 0.88,
                        height: MediaQuery.sizeOf(context).height * 0.38,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 270,
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.all(
                    MediaQuery.sizeOf(context).height * 0.02,
                  ),
                  child: CustomScrollView(
                    controller: _scrollController,
                    slivers: <Widget>[
                      buildSliverStickyCollapsablePanel(
                        dataList: incomeSearched,
                        headingList: incomeCols,
                        income: true,
                        isAscending: incomeIsAscending,
                        type: 'income',
                        sortIndex: incomeSortIndex,
                      ),
                      buildSliverStickyCollapsablePanel(
                        dataList: fixedExpSearched,
                        headingList: expenseCols,
                        income: false,
                        isAscending: fixedExpIsAscending,
                        type: 'fixedExp',
                        sortIndex: fixedExpSortIndex,
                      ),
                      buildSliverStickyCollapsablePanel(
                        dataList: variableExpSearched,
                        headingList: expenseCols,
                        income: false,
                        isAscending: variableExpIsAscending,
                        type: 'variableExp',
                        sortIndex: variableExpSortIndex,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSliverStickyCollapsablePanel({
    required String type,
    required dataList,
    required headingList,
    required income,
    required isAscending,
    required sortIndex,
  }) {
    return SliverStickyCollapsablePanel(
      scrollController: _scrollController,
      controller: stickyCollapsablePanelController,
      defaultExpanded: false,
      paddingBeforeCollapse: const EdgeInsets.only(bottom: 15),
      paddingAfterCollapse: const EdgeInsets.only(bottom: 15),
      headerBuilder: (context, status) => Container(
        width: double.infinity,
        height: 45,
        decoration: const BoxDecoration(
          color: Color(0xff223eff),
          border: Border(
            left: BorderSide(color: Colors.black, width: 2.0),
            right: BorderSide(color: Colors.black, width: 2.0),
            top: BorderSide(color: Colors.black, width: 2.0),
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5),
            topRight: Radius.circular(5),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            right: MediaQuery.sizeOf(context).width * 0.01,
            left: MediaQuery.sizeOf(context).width * 0.02,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                type == "income"
                    ? "Income Sources"
                    : type == "fixedExp"
                    ? "Fixed Monthly Expenses"
                    : "Variable Monthly Expenses",
                style: GoogleFonts.amaranth(
                  textStyle: const TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              Row(
                children: [
                  AppTheme.iconButton(
                    // To add row in DataTable click on + icon
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return BuildDialog(
                            onSubmitted: (List<String> value) {
                              // When clicked on Add button in dialog, the values taken from user are added in List of type String.
                              setState(() {
                                // The 1st value in List is accessed by value[0] and 2nd by value[1].
                                // Both values are taken and made an object of type Income. Income is defined at last.
                                // Then the object is added in List of type Income.
                                switch (type) {
                                  case "income":
                                    incomeList.add(
                                      Income(
                                        incomeSource: value[0],
                                        amount: double.parse(value[1]),
                                      ),
                                    );
                                    break;
                                  case "fixedExp":
                                    fixedExpenses.add(
                                      Expense(
                                        expDescription: value[0],
                                        amount: double.parse(value[1]),
                                      ),
                                    );
                                    break;
                                  default:
                                    variableExpenses.add(
                                      Expense(
                                        expDescription: value[0],
                                        amount: double.parse(value[1]),
                                      ),
                                    );
                                }
                              });
                            },
                            formCheck: true,
                            edit: false,
                          );
                        },
                      );
                    },
                    icon: Icons.add,
                    context: context,
                  ),
                  AppTheme.iconButton(
                    // To show bar chart click on chart icon, bar chart will be shown in dialog.
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return type == "income"
                              ? ChartDialog(type: type, list: incomeList)
                              : type == "fixedExp"
                              ? ChartDialog(type: type, list: fixedExpenses)
                              : ChartDialog(type: type, list: variableExpenses);
                        },
                      );
                    },
                    icon: Icons.bar_chart_sharp,
                    context: context,
                  ),
                  AnimatedRotation(
                    duration: const Duration(milliseconds: 200),
                    turns: status.isExpanded ? 0 : 0.5,
                    child: const Icon(
                      Icons.expand_more,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      sliverPanel: SliverList.list(
        children: [
          dataList.isEmpty
              ? Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5),
                    ),
                    border: Border(
                      left: BorderSide(color: Colors.black, width: 2.0),
                      right: BorderSide(color: Colors.black, width: 2.0),
                      top: BorderSide.none,
                      bottom: BorderSide(color: Colors.black, width: 2.0),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Center(
                      child: Text(
                        "No Data",
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    ),
                  ),
                )
              : Column(
                  children: [
                    TextFormField(
                      initialValue: type == "income"
                          ? _searchQuery1
                          : type == "fixedExp"
                          ? _searchQuery2
                          : _searchQuery3,
                      onChanged: (value) {
                        setState(() {
                          type == "income"
                              ? _searchQuery1 = value
                              : type == "fixedExp"
                              ? _searchQuery2 = value
                              : _searchQuery3 = value;
                        });
                      },
                      keyboardType: TextInputType.text,
                      style: const TextStyle(color: Colors.black, fontSize: 20),
                      decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        labelText: "Search",
                        labelStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 19,
                        ),
                        suffixIcon: const Icon(Icons.search, size: 25),
                        isDense: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0),
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: 2,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0),
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: 2,
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10.0,
                          vertical: 5.0,
                        ),
                      ),
                      cursorHeight: 20,
                      cursorWidth: 3,
                      cursorRadius: const Radius.circular(5),
                      cursorColor: Colors.blue.shade900,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: BuildDataTable(
                        dataList: dataList,
                        headingList: headingList,
                        income: income,
                        isAscending: isAscending,
                        type: type,
                        sortIndex: sortIndex,
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
