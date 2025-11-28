import 'package:flutter/material.dart';
import 'package:flutter_basics/widgets/stateless_widgts.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  DateTime _todaysDate = DateTime.now();
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: CustomAppBar(title: 'Part 2'),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: CalendarCarousel(
            // selectedDateTime: This is the date that will be marked as selected. It is used to highlight a particular day.
            // onDayPressed: This callback is triggered when a day is pressed. You can use this to update the selected date or show events related to that day.
            // thisMonthDayBorderColor: Sets the border color for days in the current month.
            // weekDayFormat: Defines how the weekdays are displayed (e.g., short or full names).
            // daysTextStyle: Controls the text style for the days.
            // headerTextStyle: Controls the text style for the calendar's header (the month and year).
            // selectedDayButtonColor: Changes the background color for the selected day.
            // todayTextStyle: Controls the text style of the current day (today).
            // childAspectRatio = 1.0: The day boxes will be square (equal width and height).
            // childAspectRatio > 1.0: The day boxes will become wider (landscape-like).
            // childAspectRatio < 1.0: The day boxes will become taller (portrait-like).
            // childAspectRatio = screenWidth / screenHeight;
            width: size.width - 16,
            height: size.height - 100,
            childAspectRatio: 0.6,
            dayPadding: 5.0,
            onDayPressed: (date, events) {
              setState(() {
                _selectedDate = date;
              });
            },
            minSelectedDate: DateTime.utc(2000, 01, 01), // Set the start date
            maxSelectedDate: DateTime.utc(_todaysDate.year + 75, 12, 31),
            thisMonthDayBorderColor: Colors.grey,
            todayBorderColor: Colors.blue,
            selectedDayButtonColor: Colors.blue,
            todayButtonColor: Colors.white,
            daysHaveCircularBorder: false,
            showHeader: true,
            weekDayFormat: WeekdayFormat.short,
            selectedDateTime: _selectedDate,
            headerTextStyle: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
              fontSize: 20,
            ),
            todayTextStyle: const TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            prevDaysTextStyle: const TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            selectedDayTextStyle: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            daysTextStyle: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            weekendTextStyle: const TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            weekdayTextStyle: const TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            headerTitleTouchable: true,
            onHeaderTitlePressed: () async {
              final DateTime? picked = await showDatePicker(
                context: context,
                initialDate: _todaysDate,
                firstDate: DateTime.utc(2000, 01, 01),
                lastDate: DateTime.utc(_todaysDate.year + 75, 12, 31),
              );

              if (picked != null && picked != _todaysDate) {
                setState(() {
                  _todaysDate = picked;
                  _selectedDate = picked;
                });
              }
            },
          ),
        ),
      ),
    );
  }
}
