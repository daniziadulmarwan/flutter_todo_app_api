import 'package:flutter/material.dart';
import 'package:todo_app/repositories/todo_repo.dart';

class Create extends StatefulWidget {
  const Create({Key? key}) : super(key: key);

  @override
  _CreateState createState() => _CreateState();
}

class _CreateState extends State<Create> {
  final _titleController = TextEditingController();
  final _bodyController = TextEditingController();

  TodoRepository todoRepository = TodoRepository();

  createData() async {
    bool res = await todoRepository.createData(
        _titleController.text, _bodyController.text);

    if (res) {
      Navigator.of(context).popAndPushNamed('/home');
    } else {
      print('failed to create data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Detail'),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            children: [
              TextField(
                  controller: _titleController,
                  decoration: InputDecoration(
                      hintText: 'title',
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black87)))),
              SizedBox(
                height: 20,
              ),
              TextField(
                  controller: _bodyController,
                  decoration: InputDecoration(
                      hintText: 'description',
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black87)))),
              SizedBox(
                height: 30,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: createData,
                    child: Text('Create Data'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
