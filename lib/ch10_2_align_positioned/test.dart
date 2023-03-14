import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Test'),
          ),
          body: Stack(
            children: [
              Align(
                alignment: const Alignment(0.0, 0.0),
                child: Container(
                  width: 150,
                  height: 150,
                  color: Colors.yellow,
                ),
              ),
              Align(
                alignment: const FractionalOffset(1.0, 0.0),
                child: Container(
                  width: 150,
                  height: 150,
                  color: Colors.deepOrangeAccent,
                ),
              ),
              Positioned(
                left: 40.0,
                top: 40,
                child: Container(
                  width: 150,
                  height: 150,
                  color: Colors.pink,
                ),
              )
            ],
          )),
    );
  }
}
