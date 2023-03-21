import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<MyApp>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.pink,
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.orange, foregroundColor: Colors.black)),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Tab Title'),
          bottom: TabBar(
            controller: controller,
            tabs: const <Widget>[
              Tab(text: 'One'),
              Tab(text: 'Two'),
              Tab(text: 'Three'),
            ],
          ),
        ),
        //탭바
        body: TabBarView(
          controller: controller,
          children: const <Widget>[
            Center(
              child: Text(
                'One Screen',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            Center(
              child: Text(
                'Two Screen',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            Center(
              child: Text(
                'Three Screen',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
