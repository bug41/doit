import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  test() {
    print('icon button click..!!!');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('제목입니다.'),
        ),
        body: Column(
          children: [
            const Icon(
              Icons.alarm,
              size: 100,
              color: Colors.red,
            ),
            const FaIcon(
              FontAwesomeIcons.bell,
              size: 100,
            ),
            IconButton(
              onPressed: test,
              icon: const Icon(
                Icons.alarm,
                size: 100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
