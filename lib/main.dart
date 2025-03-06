import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TODOリスト',
      theme: ThemeData(primarySwatch: Colors.green),
      home: Scaffold(
        appBar: AppBar(title: const Text('Home')),
        body: Text("Hello World"),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print('FABをタップしました');
          },
          child: Icon(Icons.add),
        ),
        persistentFooterButtons: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              print('ボタン1をタップしました');
            },
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              print('ボタン2をタップしました');
            },
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              print('ボタン3をタップしました');
            },
          ),
        ],
      ),
    );
  }
}
