import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Widget platformUI() {
    if (Platform.isIOS) {
      return CupertinoApp(
        debugShowCheckedModeBanner: false,
        theme: const CupertinoThemeData(
          brightness: Brightness.light,
        ),
        home: CupertinoPageScaffold(
          navigationBar: const CupertinoNavigationBar(
            middle: Text('Cupertino Title'),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CupertinoButton(child: const Text('Click'), onPressed: () {}),
              const Center(
                child: Text('Hello World'),
              ),
            ],
          ),
        ),
      );
    } else if (Platform.isAndroid) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Material Title'),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(onPressed: () {}, child: const Text('click')),
              const Center(
                child: Text('Hello World'),
              ),
            ],
          ),
        ),
      );
    } else {
      return const Text(
        'unKnown Device',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return platformUI();
  }
}
