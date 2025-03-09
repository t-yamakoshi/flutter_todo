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

class TodoListPage extends StatefulWidget {
  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  // Todoリストのデータ
  List<String> todoList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return Card(child: ListTile(title: Text(todoList[index])));
        },
      ),
      // body: ListView(
      // children: <Widget>[
      // Card(child: ListTile(title: Text('にんじんを買う'))),
      // Card(child: ListTile(title: Text('玉ねぎを買う'))),
      // Card(child: ListTile(title: Text('じゃがいもを買う'))),
      // Card(child: ListTile(title: Text('カレールーを買う'))),
      // ],
      // ),
      appBar: AppBar(title: Text('リスト一覧')),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // pushで新しい画面に遷移
          // リスト追加画面から渡される値を受け取る
          final newListText = await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return TodoAddPage();
              },
            ),
          );
          if (newListText != null) {
            setState(() {
              // リストを追加
              todoList.add(newListText);
            });
          } else {
            AlertDialog(
              title: Text('エラー'),
              content: Text('リストが存在しませんでした。'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('OK'),
                ),
              ],
            );
          }
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
  // 入力されたテキストをデータとして持つ
  String _text = '';

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
            TextField(
              onChanged:
                  (String value) => {
                    setState(() {
                      // データを変更
                      _text = value;
                    }),
                  },
            ),
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
                onPressed: () => {Navigator.of(context).pop(_text)},
                child: Text("キャンセル"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
