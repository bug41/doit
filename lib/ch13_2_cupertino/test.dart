import 'dart:io';

import 'package:flutter/cupertino.dart';

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
      return;
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp();
  }
}
