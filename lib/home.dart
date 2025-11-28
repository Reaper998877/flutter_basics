import 'package:flutter/material.dart';
import 'package:flutter_basics/models.dart';
import 'package:flutter_basics/screens/app01/first_screen.dart' as app01;
import 'package:flutter_basics/screens/app02/first_screen.dart' as app02;
import 'package:flutter_basics/screens/app03/first_screen.dart' as app03;
import 'package:flutter_basics/screens/app04/first_screen.dart' as app04;
import 'package:flutter_basics/screens/app05/first_screen.dart' as app05;
import 'package:flutter_basics/screens/app06/first_screen.dart' as app06;
import 'package:flutter_basics/screens/app07/first_screen.dart' as app07;
import 'package:flutter_basics/screens/app08/first_screen.dart' as app08;
import 'package:flutter_basics/screens/app09/first_screen.dart' as app09;
import 'package:flutter_basics/screens/app10/first_screen.dart' as app10;
import 'package:flutter_basics/screens/app11/first_screen.dart' as app11;
import 'package:flutter_basics/screens/app12/first_screen.dart' as app12;
import 'package:flutter_basics/screens/app13/first_screen.dart' as app13;
import 'package:flutter_basics/screens/app14/first_scren.dart' as app14;
import 'data/module_list.dart';
import 'app_theme.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.title});

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<ModuleData> _allItems = moduleList;
  List<ModuleData> _filteredItems = [];
  final TextEditingController _searchController = TextEditingController();
  final Set<String> _expandedItems = {};

  @override
  void initState() {
    super.initState();
    _filteredItems = _allItems;
    _searchController.addListener(_filterItems);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterItems() {
    String searchTerm = _searchController.text.toLowerCase();
    setState(() {
      _filteredItems = _allItems
          .where((item) => item.name.toLowerCase().contains(searchTerm))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title), centerTitle: true),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 30.0,
            ),
            child: TextField(
              controller: _searchController,
              style: TextStyle(fontSize: 16),
              decoration: AppTheme.getSearchInputDecoration(),
            ),
          ),
          Expanded(
            child: ListView.builder(
              key: const PageStorageKey<String>('appsList'),
              itemCount: _filteredItems.length,
              itemBuilder: (context, index) {
                final item = _filteredItems[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18.0,
                    vertical: 8.0,
                  ),
                  child: Card(
                    margin: EdgeInsets.zero,
                    child: Theme(
                      data: Theme.of(
                        context,
                      ).copyWith(dividerColor: Colors.transparent),
                      child: ExpansionTile(
                        maintainState: true,
                        key: PageStorageKey(item.name),
                        title: Text(
                          item.name,
                          style: TextStyle(
                            fontSize: 19,
                            height: 1.1,
                            letterSpacing: 0.4,
                            color: Colors.black,
                            fontFamily: 'capriola',
                          ),
                        ),
                        tilePadding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 0.0,
                        ),
                        trailing: Icon(
                          _expandedItems.contains(item.name)
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down,
                          color: AppTheme.primaryDarkBlue,
                        ),
                        initiallyExpanded: _expandedItems.contains(item.name),
                        onExpansionChanged: (expanded) {
                          setState(() {
                            if (expanded) {
                              _expandedItems.add(item.name);
                            } else {
                              _expandedItems.remove(item.name);
                            }
                          });
                        },
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 16.0,
                              right: 16.0,
                              bottom: 16.0,
                              top: 0.0,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Description:',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: AppTheme.primaryDarkBlue,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  item.description,
                                  style: TextStyle(
                                    fontSize: 16,
                                    height: 1.4,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Align(
                                  alignment: .centerRight,
                                  child: TextButton(
                                    onPressed: () => _handleAppSelection(item),
                                    style: TextButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0,
                                        vertical: 4.0,
                                      ),
                                    ),
                                    child: Text(
                                      'Example',
                                      style: TextStyle(
                                        color: AppTheme.primaryDarkBlue,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
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
              },
            ),
          ),
        ],
      ),
    );
  }

  void _handleAppSelection(ModuleData item) {
    switch (item.name) {
      case 'Module 01':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const app01.FirstScreen()),
        );
        break;
      case 'Module 02':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const app02.FirstScreen()),
        );
        break;
      case 'Module 03':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const app03.FirstScreen()),
        );
        break;
      case 'Module 04':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const app04.FirstScreen()),
        );
        break;
      case 'Module 05':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const app05.FirstScreen()),
        );
        break;
      case 'Module 06':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const app06.FirstScreen()),
        );
        break;
      case 'Module 07':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const app07.FirstScreen()),
        );
        break;
      case 'Module 08':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const app08.FirstScreen()),
        );
        break;
      case 'Module 09':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const app09.FirstScreen()),
        );
        break;
      case 'Module 10':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const app10.FirstScreen()),
        );
        break;
      case 'Module 11':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const app11.FirstScreen()),
        );
        break;
      case 'Module 12':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const app12.FirstScreen()),
        );
      case 'Module 13':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const app13.FirstScreen()),
        );
      case 'Module 14':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const app14.FirstScreen()),
        );
        break;
      default:
    }
  }
}
