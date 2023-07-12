import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dismissable Demo',
      home: Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Dismissable Demo'),
            backgroundColor: Colors.black, // Set the background color of the AppBar
          ),
          body: DismissableWidget(),
        ),
      ),
    );
  }
}

class DismissableWidget extends StatefulWidget {
  const DismissableWidget({Key? key}) : super(key: key);

  @override
  _DismissableWidgetState createState() => _DismissableWidgetState();
}

class _DismissableWidgetState extends State<DismissableWidget> {
  List<String> items = List.generate(15, (index) => 'Item ${index + 1}');

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(items[index]),
            direction: DismissDirection.horizontal,
            background: Container(
              color: Color.fromARGB(255, 83, 16, 11),
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 19.0),
              child: const Icon(Icons.delete),
            ),
            onDismissed: (direction) {
              setState(() {
                items.removeAt(index);
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('Item dismissed'),
                ),
              );
            },
            child: ListTile(
              title: Text(items[index]),
            ),
          );
        },
      ),
    );
  }
}
