import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                leading: IconButton(
                  icon: const Icon(Icons.expand),
                  onPressed: () {},
                ),
                expandedHeight: 200,
                floating: true,
                pinned: false,
                snap: true,
                elevation: 50,
                backgroundColor: Colors.pink,
                flexibleSpace: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/big.jpeg'),
                    ),
                  ),
                ),
                title: const Text('AppBar Title'),
                actions: <Widget>[
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.add_alert),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.phone),
                  ),
                ],
              ),
              SliverFixedExtentList(
                itemExtent: 50.0,
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return ListTile(
                      title: Text('Hello World Item $index'),
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
