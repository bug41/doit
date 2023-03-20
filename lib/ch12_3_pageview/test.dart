import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  PageController controller =
      PageController(initialPage: 1, viewportFraction: 0.8);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('타이틀'),
        ),
        body: PageView(
          controller: controller,
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              color: Colors.red,
              child: const Center(
                child: Text(
                  'OnePage',
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              color: Colors.green,
              child: const Center(
                child: Text('TwoPage',
                    style: TextStyle(color: Colors.white, fontSize: 30)),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              color: Colors.blue,
              child: const Center(
                child: Text('ThreePage',
                    style: TextStyle(color: Colors.white, fontSize: 30)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
