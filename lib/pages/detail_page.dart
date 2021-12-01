import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final _titleController = TextEditingController();
  final _bodyController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as List<String>;

    if (args[1].isNotEmpty) {
      _titleController.text = args[1];
    }

    if (args[2].isNotEmpty) {
      _bodyController.text = args[2];
    }

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
                    onPressed: () {},
                    child: Text('Edit Data'),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(onPressed: () {}, child: Text('Delete Data')),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
