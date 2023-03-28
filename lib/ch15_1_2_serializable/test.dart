import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'test.g.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  // 왜 책에서는 MyApp 이 아니라 StatefulWidget 이라고나오지 ?
  State<MyApp> createState() => _MyAppState();
}

@JsonSerializable()
class Location {
  String latitude;
  String longitude;

  Location(this.latitude, this.longitude);
  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Todo {
  @JsonKey(name: "id")
  int todoId;
  String title;
  bool completed;

  Location location;
  Todo(this.todoId, this.title, this.completed, this.location);
  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);
  Map<String, dynamic> toJson() => _$TodoToJson(this);
}

class _MyAppState extends State<MyApp> {
  String jsonStr =
      '{"id":1, "title":"HELLO", "completed":false, "location":{"latitude":"37.5", "longitude":"127.1"}}';

  Todo? todo;
  String result = '';

  onPressDecode() {
    Map<String, dynamic> map = jsonDecode(jsonStr);
    todo = Todo.fromJson(map);
    print(todo?.toJson());
    setState(() {
      result = "decode : ${todo?.toJson()}";
    });
  }

  onPressEncode() {
    setState(() {
      result = "encode : ${jsonEncode(todo)}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Test'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(result),
              ElevatedButton(
                onPressed: onPressDecode,
                child: const Text('Decode'),
              ),
              ElevatedButton(
                onPressed: onPressEncode,
                child: const Text('Encode'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
