import 'package:doit/ch14_1_navigation/user.dart';
import 'package:flutter/material.dart';

class OneScreen extends StatelessWidget {
  const OneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('OneScreen'),
        ),
        body: Container(
          color: Colors.red,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'OneScreen',
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
                ElevatedButton(
                  onPressed: () async {
                    final result = await Navigator.pushNamed(
                      context,
                      '/two',
                      arguments: {
                        "arg1": 10,
                        "arg2": "hello",
                        "arg3": User('LeeTaeUng', 'Seoul'),
                      },
                    );
                  },
                  child: const Text('Go Two'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
