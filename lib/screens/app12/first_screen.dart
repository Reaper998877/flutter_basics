import 'package:flutter/material.dart';
import 'package:flutter_basics/data/git_links.dart';
import 'package:flutter_basics/widgets/stateless_widgts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';

import 'second_screen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  // Selected day
  DateTime _selectedDay = DateTime.now();
  // Focused day / Current Month
  DateTime _focusedDay = DateTime.now();
  final Map<DateTime, List<String>> _notes = {};
  final ScrollController controller = ScrollController();

  // Fetch notes for a particular day
  List<String> _getNotesForDay(DateTime day) {
    return _notes[day] ?? [];
  }

  void scrollToBottom() {
    controller.animateTo(
      controller.position.maxScrollExtent, // Scroll to the end
      duration: const Duration(seconds: 1), // Animation duration
      curve: Curves.easeInOut, // Scroll curve
    );
  }

  // Add new note function (show dialog)
  void addNote(BuildContext context, DateTime selectedDate) {
    TextEditingController noteController = TextEditingController();
    final calNoteFormKey = GlobalKey<FormState>();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            width: MediaQuery.sizeOf(context).width * 0.70,
            padding: const EdgeInsets.all(20.0),
            height: MediaQuery.sizeOf(context).height * 0.22,
            child: Column(
              children: [
                Text(
                  'Add Note',
                  style: GoogleFonts.merriweather(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                Form(
                  key: calNoteFormKey,
                  child: TextFormField(
                    controller: noteController,
                    style: GoogleFonts.breeSerif(
                      color: Colors.black,
                      fontSize: 25,
                    ),
                    cursorHeight: 20,
                    cursorWidth: 3,
                    cursorRadius: const Radius.circular(5),
                    cursorColor: Colors.blue.shade900,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      isDense: true,
                      hintText: 'Enter Note',
                      contentPadding: const EdgeInsets.only(
                        left: 10.0,
                        right: 10.0,
                        top: 5.0,
                      ),
                      enabledBorder: enabled(),
                      focusedBorder: focused(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a Note';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 18,
                          fontFamily: 'autourOne',
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // If user enters a non-empty event, update the map
                        if (calNoteFormKey.currentState!.validate()) {
                          setState(() {
                            if (_notes[selectedDate] == null) {
                              _notes[selectedDate] = [];
                            }
                            _notes[selectedDate]!.add(noteController.text);
                          });
                          Navigator.of(context).pop();
                          scrollToBottom();
                        }
                      },
                      child: Text(
                        'Add Note',
                        style: GoogleFonts.autourOne(
                          color: Colors.blue,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Edit note function (show dialog)
  void editNote(String oldNote) {
    TextEditingController noteController = TextEditingController(text: oldNote);
    final editNoteFormKey = GlobalKey<FormState>();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            width: MediaQuery.sizeOf(context).width * 0.70,
            padding: const EdgeInsets.all(20.0),
            height: MediaQuery.sizeOf(context).height * 0.22,
            child: Column(
              children: [
                Text(
                  'Edit Note',
                  style: GoogleFonts.merriweather(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                Form(
                  key: editNoteFormKey,
                  child: TextFormField(
                    controller: noteController,
                    style: GoogleFonts.breeSerif(
                      color: Colors.black,
                      fontSize: 25,
                    ),
                    cursorHeight: 20,
                    cursorWidth: 3,
                    cursorRadius: const Radius.circular(5),
                    cursorColor: Colors.blue.shade900,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      isDense: true,
                      hintText: 'Enter Note',
                      contentPadding: const EdgeInsets.only(
                        left: 10.0,
                        right: 10.0,
                        top: 5.0,
                      ),
                      enabledBorder: enabled(),
                      focusedBorder: focused(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a Note';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Cancel',
                        style: GoogleFonts.autourOne(
                          color: Colors.blue,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          // Find the index of the note in the list for the selected date
                          List<String>? notesForDay = _notes[_selectedDay];
                          if (notesForDay != null) {
                            int index = notesForDay.indexOf(oldNote);
                            if (index != -1) {
                              // Replace the old note with the new text
                              notesForDay[index] = noteController.text;
                            }
                          }
                        });
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Save',
                        style: GoogleFonts.autourOne(
                          color: Colors.blue,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Delete note function (show dialog)
  void deleteNote(String note) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            width: MediaQuery.sizeOf(context).width * 0.70,
            padding: const EdgeInsets.all(20.0),
            height: MediaQuery.sizeOf(context).height * 0.22,
            child: Column(
              children: [
                Text(
                  'Are you sure you want to delete this note?',
                  style: GoogleFonts.merriweather(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Cancel',
                        style: GoogleFonts.autourOne(
                          color: Colors.blue,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          // Find the list of notes for the selected date
                          List<String>? notesForDay = _notes[_selectedDay];

                          if (notesForDay != null) {
                            // Remove the note from the list
                            notesForDay.remove(note);

                            // If there are no notes left for that date, you can remove the date entry entirely
                            if (notesForDay.isEmpty) {
                              _notes.remove(_selectedDay);
                            }
                          }
                        });
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Delete',
                        style: GoogleFonts.autourOne(
                          color: Colors.blue,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Part 1', gitLink: gitLinks["app12a"].toString(),),
      body: SingleChildScrollView(
        controller: controller,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TableCalendar(
                rowHeight: MediaQuery.sizeOf(context).height / 10,
                daysOfWeekHeight: MediaQuery.sizeOf(context).height / 20,
                focusedDay: _focusedDay,
                pageJumpingEnabled: true,
                selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });
                  // Open dialog to add an event on the selected day
                  addNote(context, selectedDay);
                },
                eventLoader: (day) {
                  return _getNotesForDay(day); // Return events for the day
                },
                onPageChanged: (focusedDay) {
                  setState(() {
                    _focusedDay = focusedDay;
                  });
                },
                firstDay: DateTime.utc(2000, 01, 01),
                lastDay: DateTime.utc(_selectedDay.year + 75, 12, 31),
                calendarFormat: CalendarFormat.month,
                daysOfWeekStyle: DaysOfWeekStyle(
                  weekdayStyle: const TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  weekendStyle: const TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    border: Border.all(color: Colors.black),
                  ),
                ),
                calendarStyle: CalendarStyle(
                  outsideTextStyle: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  todayTextStyle: const TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  selectedTextStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  defaultTextStyle: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  weekendTextStyle: const TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  markerSize: 18,
                  markerDecoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  defaultDecoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    border: Border.all(color: Colors.grey),
                  ),
                  weekendDecoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    border: Border.all(color: Colors.grey),
                  ),
                  todayDecoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    border: Border.all(color: Colors.blue, width: 3),
                  ),
                  selectedDecoration: const BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.rectangle,
                  ),
                ),
                headerStyle: const HeaderStyle(
                  titleCentered: true,
                  titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                    fontSize: 22,
                  ),
                  formatButtonVisible: false,
                ),
                onHeaderTapped: (DateTime d) async {
                  final DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: _selectedDay,
                    firstDate: DateTime.utc(2000, 01, 01),
                    lastDate: DateTime.utc(d.year + 75, 12, 31),
                  );

                  if (picked != null && picked != _selectedDay) {
                    setState(() {
                      _selectedDay = picked;
                      _focusedDay =
                          picked; // Optional: Update focused day as well
                    });
                  }
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SecondScreen()),
                );
              },
              child: Text("Next Screen"),
            ),
            if (_getNotesForDay(_selectedDay).isNotEmpty)
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Notes',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            SizedBox(
              height: 400,
              child: ListView(
                children: _getNotesForDay(_selectedDay)
                    .map(
                      (event) => Card(
                        elevation: 4.0,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        margin: const EdgeInsets.all(10),
                        child: Container(
                          height: MediaQuery.sizeOf(context).height * 0.06,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                          child: Center(
                            child: ListTile(
                              title: Text(
                                event,
                                overflow: TextOverflow.ellipsis,
                              ),
                              trailing: IconButton(
                                onPressed: () {
                                  // To Edit
                                  editNote(event);
                                },
                                icon: const Icon(
                                  Icons.edit,
                                  color: Colors.black,
                                  size: 25,
                                ),
                              ),
                              onLongPress: () {
                                deleteNote(event);
                              },
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

OutlineInputBorder focused() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(color: Color(0xff0037cc), width: 3),
  );
}

OutlineInputBorder enabled() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(color: Color(0xff797979), width: 2),
  );
}
