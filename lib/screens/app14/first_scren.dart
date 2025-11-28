import 'package:flutter/material.dart';
import 'package:flutter_basics/widgets/stateless_widgts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sliver_sticky_collapsable_panel/utils/sliver_sticky_collapsable_panel_controller.dart';
import 'package:sliver_sticky_collapsable_panel/widgets/sliver_sticky_collapsable_panel.dart';

import 'second_screen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final ScrollController _scrollController = ScrollController();
  final StickyCollapsablePanelController stickyCollapsablePanelController =
      StickyCollapsablePanelController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Part 1'),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.sizeOf(context).width * 0.05,
        ),
        child: SizedBox(
          width: double.infinity,
          height: MediaQuery.sizeOf(context).height,
          child: CustomScrollView(
            controller: _scrollController,
            slivers: <Widget>[
              // Note
              // SliverStickyCollapsablePanel widget can be used only inside RenderSliverStickyCollapsablePanel that is CustomScrollView. Otherwise below runtime error will appear.
              // Error - A RenderFlex expected a child of type RenderBox but received a child of type RenderSliverStickyCollapsablePanel.
              // SliverStickyCollapsablePanel requires two controllers 1) controller of CustomScrollView 2) controller of StickyCollapsablePanelController
              SliverStickyCollapsablePanel(
                scrollController: _scrollController,
                controller: stickyCollapsablePanelController,
                // headerBuilder is a widget, which is shown when SliverStickyCollapsablePanel widget is collapsed or expanded. It should have the expand arrow button.
                headerBuilder: (context, status) => SizedBox(
                  width: double.infinity,
                  height: 48,
                  // status is used to find whether the SliverStickyCollapsablePanel is expanded or collapsed.
                  child: Stack(
                    children: [
                      const Text("Sliver 1"),
                      Align(
                        // Align widget is used to align any widget as u want.
                        alignment: Alignment.centerRight,
                        child: AnimatedRotation(
                          // AnimatedRotation widget is used to rotate any widget within given duration and value for rotation.
                          duration: const Duration(milliseconds: 200),
                          turns: status.isExpanded
                              ? 0
                              : 0.5, // if true => rotated from 180deg to 0deg, and when false => rotated from 0deg to 180deg. i.e Rotates from Left side
                          child: const Icon(Icons.expand_more),
                        ),
                      ),
                    ],
                  ),
                ),
                sliverPanel: SliverList.list(
                  children: [
                    // Widgets which are shown when SliverStickyCollapsablePanel widget is expanded.
                    Container(
                      width: double.infinity,
                      height: 60,
                      color: Colors.blue,
                      child: const Text(
                        "Widgets - CustomScrollView, SliverStickyCollapsablePanel",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 60,
                      color: Colors.yellow,
                    ),
                    Container(
                      width: double.infinity,
                      height: 60,
                      color: Colors.green,
                      child: const Text(
                        "Widgets - Align, AnimatedRotation",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SliverStickyCollapsablePanel(
                scrollController: _scrollController,
                controller: stickyCollapsablePanelController,
                disableCollapsable:
                    true, // when true, the SliverStickyCollapsablePanel widget cannot be collapsed.
                headerBuilder: (context, status) => SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: Stack(
                    children: [
                      const Center(child: Text("Sliver 2")),
                      Align(
                        alignment: Alignment.centerRight,
                        child: AnimatedRotation(
                          duration: const Duration(milliseconds: 200),
                          turns: status.isExpanded ? 0 : 0.5,
                          child: const Icon(Icons.expand_more),
                        ),
                      ),
                    ],
                  ),
                ),
                sliverPanel: SliverList.list(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 60,
                      color: Colors.blue,
                    ),
                    Container(
                      width: double.infinity,
                      height: 60,
                      color: Colors.yellow,
                    ),
                    Container(
                      width: double.infinity,
                      height: 60,
                      color: Colors.green,
                    ),
                  ],
                ),
              ),
              SliverStickyCollapsablePanel(
                scrollController: _scrollController,
                controller: stickyCollapsablePanelController,
                headerBuilder: (context, status) => SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: Stack(
                    children: [
                      const Text("Sliver 3"),
                      Align(
                        alignment: Alignment.centerRight,
                        child: AnimatedRotation(
                          duration: const Duration(milliseconds: 200),
                          turns: status.isExpanded ? 0 : 0.5,
                          child: const Icon(Icons.expand_more),
                        ),
                      ),
                    ],
                  ),
                ),
                sliverPanel: SliverList.list(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 60,
                      color: Colors.blue,
                    ),
                    Container(
                      width: double.infinity,
                      height: 60,
                      color: Colors.yellow,
                    ),
                    Container(
                      width: double.infinity,
                      height: 60,
                      color: Colors.green,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const SecondScreen(),
                          ),
                        );
                      },
                      child: const Text("Second Screen"),
                    ),
                  ],
                ),
              ),
              SliverStickyCollapsablePanel(
                scrollController: _scrollController,
                controller: stickyCollapsablePanelController,
                headerBuilder: (context, status) => SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: Stack(
                    children: [
                      const Text("Sliver 4"),
                      Align(
                        alignment: Alignment.centerRight,
                        child: AnimatedRotation(
                          duration: const Duration(milliseconds: 0),
                          turns: status.isExpanded ? 0 : 0.5,
                          child: const Icon(Icons.expand_more),
                        ),
                      ),
                    ],
                  ),
                ),
                sliverPanel: SliverList.list(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 60,
                      color: Colors.blue,
                    ),
                    Container(
                      width: double.infinity,
                      height: 60,
                      color: Colors.yellow,
                    ),
                    Container(
                      width: double.infinity,
                      height: 60,
                      color: Colors.green,
                    ),
                  ],
                ),
              ),
              SliverStickyCollapsablePanel(
                scrollController: _scrollController,
                controller: stickyCollapsablePanelController,
                defaultExpanded: false,
                headerBuilder: (context, status) => SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: Stack(
                    children: [
                      const Text("Sliver 5"),
                      Align(
                        alignment: Alignment.centerRight,
                        child: AnimatedRotation(
                          duration: const Duration(milliseconds: 0),
                          turns: status.isExpanded ? 0 : 0.5,
                          child: const Icon(Icons.expand_more),
                        ),
                      ),
                    ],
                  ),
                ),
                sliverPanel: SliverList.list(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 60,
                      color: Colors.blue,
                    ),
                    Container(
                      width: double.infinity,
                      height: 60,
                      color: Colors.yellow,
                    ),
                    Container(
                      width: double.infinity,
                      height: 60,
                      color: Colors.green,
                    ),
                  ],
                ),
              ),
              SliverStickyCollapsablePanel(
                scrollController: _scrollController,
                controller: stickyCollapsablePanelController,
                defaultExpanded: false,
                headerBuilder: (context, status) => SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: Stack(
                    children: [
                      const Text("Sliver 6"),
                      Align(
                        alignment: Alignment.centerRight,
                        child: AnimatedRotation(
                          duration: const Duration(milliseconds: 0),
                          turns: status.isExpanded ? 0 : 0.5,
                          child: const Icon(Icons.expand_more),
                        ),
                      ),
                    ],
                  ),
                ),
                sliverPanel: SliverList.list(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 60,
                      color: Colors.blue,
                    ),
                    Container(
                      width: double.infinity,
                      height: 60,
                      color: Colors.yellow,
                    ),
                    Container(
                      width: double.infinity,
                      height: 60,
                      color: Colors.green,
                    ),
                  ],
                ),
              ),
              SliverStickyCollapsablePanel(
                scrollController: _scrollController,
                controller: stickyCollapsablePanelController,
                headerBuilder: (context, status) => SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: Stack(
                    children: [
                      const Text("Sliver 7"),
                      Align(
                        alignment: Alignment.centerRight,
                        child: AnimatedRotation(
                          duration: const Duration(milliseconds: 0),
                          turns: status.isExpanded ? 0 : 0.5,
                          child: const Icon(Icons.expand_more),
                        ),
                      ),
                    ],
                  ),
                ),
                sliverPanel: SliverList.list(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 60,
                      color: Colors.blue,
                    ),
                    Container(
                      width: double.infinity,
                      height: 60,
                      color: Colors.yellow,
                    ),
                    Container(
                      width: double.infinity,
                      height: 60,
                      color: Colors.green,
                    ),
                  ],
                ),
              ),
              SliverStickyCollapsablePanel(
                scrollController: _scrollController,
                controller: stickyCollapsablePanelController,
                defaultExpanded:
                    false, // when false, SliverStickyCollapsablePanel widget is not expanded by default.
                headerBuilder: (context, status) => Container(
                  width: double.infinity,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.green.shade600,
                    border: Border.all(color: Colors.black, width: 1),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.sizeOf(context).width * 0.01,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Backup",
                          style: GoogleFonts.amaranth(
                            textStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        AnimatedRotation(
                          duration: const Duration(milliseconds: 200),
                          turns: status.isExpanded ? 0 : 0.5,
                          child: const Icon(
                            Icons.expand_more,
                            color: Colors.black,
                            size: 35,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                sliverPanel: SliverList.list(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black, width: 1),
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.sizeOf(context).height * 0.02,
                          horizontal: MediaQuery.sizeOf(context).width * 0.01,
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Keep Backup Of :",
                                  style: GoogleFonts.amaranth(
                                    textStyle: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                // Add a dropdown widget
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Backup Location :",
                                  style: GoogleFonts.amaranth(
                                    textStyle: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                // Add a storage location picker widget
                              ],
                            ),
                            // Add two checkboxes
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SliverStickyCollapsablePanel(
                scrollController: _scrollController,
                controller: stickyCollapsablePanelController,
                defaultExpanded: false,
                headerBuilder: (context, status) => Container(
                  width: double.infinity,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    border: Border.all(color: Colors.black, width: 1),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.sizeOf(context).width * 0.01,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Clear All",
                          style: GoogleFonts.amaranth(
                            textStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        AnimatedRotation(
                          duration: const Duration(milliseconds: 200),
                          turns: status.isExpanded ? 0 : 0.5,
                          child: const Icon(
                            Icons.expand_more,
                            color: Colors.black,
                            size: 35,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                sliverPanel: SliverList.list(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black, width: 1),
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.sizeOf(context).height * 0.03,
                          ),
                          Text(
                            "Delete all backup files",
                            style: GoogleFonts.amaranth(
                              textStyle: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.sizeOf(context).height * 0.06,
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 30,
                              ),
                              side: const BorderSide(color: Colors.black),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(
                              "Delete",
                              style: GoogleFonts.amaranth(
                                textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.sizeOf(context).height * 0.03,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
