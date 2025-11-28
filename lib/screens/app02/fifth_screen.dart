import 'package:flutter/material.dart';
import 'package:flutter_basics/widgets/stateless_widgts.dart';

class FifthScreen extends StatefulWidget{
  const FifthScreen({super.key});

  @override
  State<FifthScreen> createState() => _FifthScreenState();
}

class _FifthScreenState extends State<FifthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: CustomAppBar(title: 'Part 5'),

      body: Column(
        children: const [
          // This are Custom Widgets designed below
          CircularItems(), ContactItems(),

          // This are Custom Widgets designed in separate dart file and then imported
          RectangularItems(), SquareItems()
        ],
      ),
    );
  }
}

// Custom Widgets created
class CircularItems extends StatelessWidget{
  const CircularItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(flex: 1, child: Container(height: 200, color: Colors.amber,
      child: ListView.builder(itemBuilder: (context, index) => const SizedBox(width: 100,
        child: Padding( padding: EdgeInsets.all(10),
          child: CircleAvatar(backgroundColor: Colors.white,),
        ),
      ), scrollDirection: Axis.horizontal, itemCount: 10,),
    ));
  }
}

class ContactItems extends StatelessWidget{
  const ContactItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(flex: 4, child: Container(height: 200, color: Colors.deepOrangeAccent,
      child: ListView.builder(itemCount: 10, itemBuilder: (context, index) => const ListTile(
        leading: CircleAvatar(backgroundColor: Colors.blue,),
        title: Text('Name'),
        subtitle: Text('Mob. No.'),
        trailing: Icon(Icons.delete, color: Colors.black,),
      )),
    ));
  }
}