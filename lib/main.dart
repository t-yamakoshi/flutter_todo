import 'package:flutter/material.dart';

void main() {
  runApp(MyTodoApp());
}

class MyTodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Todo App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: TodoListPage(),
    );
  }
}

class TodoListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Card(child: ListTile(title: Text('にんじんを買う'))),
          Card(child: ListTile(title: Text('玉ねぎを買う'))),
          Card(child: ListTile(title: Text('じゃがいもを買う'))),
          Card(child: ListTile(title: Text('カレールーを買う'))),
        ],
      ),
      appBar: AppBar(title: Text('リスト一覧')),
      floatingActionButton: FloatingActionButton(
        onPressed:
            () => {
              // pushで新しい画面に遷移
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return TodoAddPage();
                  },
                ),
              ),
            },
        child: Icon(Icons.add),
      ),
    );
  }
}

class TodoAddPage extends StatefulWidget {
  @override
  _TodoAddPageState createState() => _TodoAddPageState();
}

class _TodoAddPageState extends State<TodoAddPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('リスト追加')),
      body: Container(
        padding: EdgeInsets.all(64),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //  テキスト入力
            TextField(),
            const SizedBox(height: 8),
            Container(
              // 横幅いっぱいに広げる
              width: double.infinity,
              // リストボタンを追加
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: () => {},
                child: Text('リストを追加', style: TextStyle(color: Colors.white)),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              // 横幅いっぱいに広げる
              width: double.infinity,
              // キャンセルボタンを追加
              child: TextButton(
                onPressed: () => {Navigator.of(context).pop()},
                child: Text("キャンセル"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
