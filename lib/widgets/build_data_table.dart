import 'package:flutter/material.dart';
import 'package:flutter_basics/models.dart';
import 'package:flutter_basics/app_theme.dart';

import 'build_dialog.dart';

class BuildDataTable extends StatefulWidget {
  final List<dynamic> dataList;
  final List<String> headingList;
  final bool income;
  final String type;
  int? sortIndex;
  bool isAscending;

  BuildDataTable(
      {super.key,
      required this.dataList,
      required this.headingList,
      required this.income,
      required this.isAscending,
      required this.type,
      required this.sortIndex});

  @override
  State<BuildDataTable> createState() => _BuildDataTableState();
}

class _BuildDataTableState extends State<BuildDataTable> {
  @override
  Widget build(BuildContext context) {
    return DataTable(
      headingTextStyle: AppTheme.headingTextStyle,
      dataTextStyle: AppTheme.dataTextStyle,
      dividerThickness: 2, headingRowHeight: 50.0, horizontalMargin: 20,
      border: AppTheme.tableBorder,
      decoration: AppTheme.boxDecoration,

      columns: getColumns(widget.headingList, widget.type, widget.sortIndex,
          widget.isAscending),
      rows: getRows(widget.dataList, widget.income, widget.type),

      // sortColumnIndex and sortAscending is necessary when u want to add sort functionality.
      sortColumnIndex: widget.sortIndex, sortAscending: widget.isAscending,
    );
  }

  // getColumns method is used to create columns of DataTable, it returns a List of type DataColumn.
  // List<String> columns => names of columns,
  // String type, int? sortIndex, bool isAscending for sort functionality
  List<DataColumn> getColumns(List<String> columns, String type, int? sortIndex,
          bool isAscending) =>
      columns
          .map((String columnName) => DataColumn(
                label: Text(columnName),
                // Columns will be made of each value inside List<String> columns by using map method.
                // After making all the columns, a list will be made of those columns and returned.
                // onSort property of DataColumn takes a void function.
                // onSort function is defined below, which takes type, sortIndex, isAscending.
                onSort: (sortIndex, isAscending) =>
                    onSort(type, sortIndex, isAscending),
              ))
          .toList();

  // getRows method is used to create rows of DataTable, it returns a List of type DataRow.
  // List<dynamic> rows => data list of Type - Income or Expense, that's why it is set dynamic
  // bool income is used to check whether i is an object of type Income or Expense
  List<DataRow> getRows(List<dynamic> rows, bool income, String type) =>
      rows.map((dynamic i) {
        dynamic element =
            i; // element is the object of type Income or Expense, but written dynamic to support both.
        final cell =
            income ? [i.incomeSource, i.amount] : [i.expDescription, i.amount];
        // cell is a dynamic List which has two values incomeSource and amount when bool income is true.
        // when bool income is false, it has two values expDescription and amount.
        // Rows will be made of each object inside List<dynamic> rows by using map method.
        // dynamic i is the iterator, which iterates on each object in List<dynamic> rows, and makes a dynamic List by taking all values from an object, that list is named as cell.
        // DataRow widget gets cells by calling getCells method, after getting cells of a row, a row is made.
        // After making all the rows, a list will be made of those rows and returned.
        return DataRow(
          color: WidgetStateProperty.all(Colors.white),
          cells: getCells(cell, type, element),
        );
      }).toList();

  // List<dynamic> cell is the list created in getRows method (name = cell)
  // dynamic element is an object, which is kept for Edit and Delete row feature
  // getCells method is used to create cells of row of DataTable, it returns a List of type DataCell.
  // List cell contains 2 values, so two cells will be created by using map method.
  // After creating those 2 cells, a list will be made of those cells and returned.
  List<DataCell> getCells(List<dynamic> cell, String type, dynamic element) =>
      cell
          .map((data) =>
              DataCell(SizedBox(child: Text('$data')), onDoubleTap: () {
                // To edit row a dialog will be shown on Double Tap
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return BuildDialog(
                        formCheck: true,
                        edit: true,
                        elementToEdit: cell,
                        onSubmitted: (List<String> editedValues) {
                          // Here the element is used to get the index of that element.
                          // When dialog will be closed by clicking on Edit button, a List<String> editedValues will give the new values entered by user.
                          int elementIndex = widget.dataList.indexOf(element);
                          setState(() {
                            switch (type) {
                              case "income":
                                // Here the element is edited
                                widget.dataList[elementIndex] = Income(
                                    incomeSource: editedValues[0],
                                    amount: double.parse(editedValues[1]));
                                break;
                              case "fixedExp":
                                widget.dataList[elementIndex] = Expense(
                                    expDescription: editedValues[0],
                                    amount: double.parse(editedValues[1]));
                                break;
                              default:
                                widget.dataList[elementIndex] = Expense(
                                    expDescription: editedValues[0],
                                    amount: double.parse(editedValues[1]));
                            }
                          });
                        },
                      );
                    });
              }, onLongPress: () async {
                // To delete row a dialog will be shown on Long Press
                await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return BuildDialog(
                        formCheck: false,
                        edit: false,
                        onDelete: () {
                          // Here the element is used to remove it from list.
                          widget.dataList.remove(element);
                        },
                      );
                    });
                setState(() {});
              }))
          .toList();

  // compareString method compares two strings.
  // bool ascending true => Sort in ascending(A-Z) order // bool ascending false => Sort in descending(Z-A) order.
  // lexicographically - comparison is done based on ASCII code of alphabets. Example - [Apple, zebra, Cat] ASCII code A(65) , z(122), C(67) so in ascending [Apple, Cat, zebra]. When both strings have same alphabets then they will be together(one after other).
  // compareTo method returns
  // -ve integer if S1 is lexicographically less than S2
  // ve integer if S1 is lexicographically greater than S2
  // 0 if S1 is equal to S2
  int compareString(
          bool ascending, String? incomeSource1, String? incomeSource2) =>
      ascending
          ? incomeSource1!.compareTo(incomeSource2!)
          : incomeSource2!.compareTo(incomeSource1!);

  // compareInt method compares two integers.
  int compareInt(bool ascending, int amount1, int amount2) {
    if (ascending) {
      if (amount1 < amount2) return -1; // amount1 is less than amount2
      if (amount1 > amount2) return 1; // amount1 is greater than amount2
    } else {
      if (amount1 < amount2) return 1; // amount1 is less than amount2
      if (amount1 > amount2) return -1; // amount1 is greater than amount2
    }
    return 0; // amount1 is equal to amount2
  }

  void onSort(String type, int columnIndex, bool ascending) {
    // columnIndex keeps the track of column which is clicked or column which has vertical arrow on it.
    // A negative value if the first argument (r1) should come before the second argument (r2).
    // Zero if r1 and r2 are considered equal (their order doesn’t change relative to each other).
    // A positive value if r1 should come after r2.
    // +ve or -ve or 0 is returned by compareString and compareInt method based on comparison code.
    // The sort method works by repeatedly comparing pairs of elements in the list to determine their order.
    if (type == "income") {
      widget.dataList.sort((r1, r2) => columnIndex == 0
          ? compareString(ascending, r1.incomeSource, r2.incomeSource)
          : compareInt(ascending, r1.amount, r2.amount));
    } else if (type == "fixedExp" || type == "variableExp") {
      widget.dataList.sort((r1, r2) => columnIndex == 0
          ? compareString(ascending, r1.expDescription, r2.expDescription)
          : compareInt(ascending, r1.amount, r2.amount));
    }
    setState(() {
      widget.sortIndex = columnIndex;
      widget.isAscending = ascending;
    });
  }
}
