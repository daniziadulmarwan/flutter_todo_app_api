import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/pages/create.dart';
import 'package:todo_app/pages/detail_page.dart';
import 'package:todo_app/repositories/todo_repo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/home': (context) => MyHomeApp(),
        '/detail': (context) => DetailPage(),
        '/create': (context) => Create()
      },
      home: MyHomeApp(),
    );
  }
}

class MyHomeApp extends StatefulWidget {
  const MyHomeApp({Key? key}) : super(key: key);

  @override
  _MyHomeAppState createState() => _MyHomeAppState();
}

class _MyHomeAppState extends State<MyHomeApp> {
  // api running
  List<Todo> todoList = [];
  TodoRepository todoRepository = TodoRepository();

  getAllData() async {
    todoList = await todoRepository.getAllData();
    setState(() {});
  }

  @override
  void initState() {
    getAllData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/create');
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.green[400],
      ),
      appBar: AppBar(
        title: Text('Todo App'),
      ),
      body: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (context, i) {
            return GestureDetector(
              onTap: () => Navigator.of(context).pushNamed('/detail',
                  arguments: [
                    todoList[i].id,
                    todoList[i].title,
                    todoList[i].body
                  ]),
              child: Container(
                margin: EdgeInsets.only(top: 7, left: 10, right: 10),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black54),
                    borderRadius: BorderRadius.circular(7)),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${todoList[i].title}'),
                        Text('${todoList[i].body}'),
                      ],
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () async {
                        bool res =
                            await todoRepository.destroyData(todoList[i].id);

                        if (res) {
                          getAllData();
                        } else {
                          print('failed to delete data');
                        }
                      },
                      icon: Icon(
                        Icons.delete,
                        color: Colors.pink[400],
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
