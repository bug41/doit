import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class Todo {
  int id;
  String title;
  bool completed;

  Todo(this.id, this.title, this.completed);

  Todo.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      title = json['title'],
      completed = json['completed'],
  
  Map<String , dynamic> toJson() => {
    'id': id, 'title' : title, 'completed': completed
  };
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
