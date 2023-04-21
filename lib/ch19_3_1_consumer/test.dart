import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyDataModel1 with ChangeNotifier {
  int data = 0;

  void changeData() {
    data++;
    notifyListeners();
  }
}

class MyDataModel2 with ChangeNotifier {
  String data = "hello";

  void changeData() {
    if (data == "hello") {
      data = "world";
    } else {
      data = "hello";
      notifyListeners();
    }
  }
}

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Consumer Test'),
        ),
        body: MultiProvider(
          providers: [
            ChangeNotifierProvider<MyDataModel1>.value(value: MyDataModel1()),
            ChangeNotifierProvider<MyDataModel2>.value(value: MyDataModel2()),
          ],
          child: const HomeWidget(),
        ),
      ),
    );
  }
}

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Consumer2<MyDataModel1, MyDataModel2>(
              builder: (context, model1, model2, child) {
                return SubWidget1(model1, model2, child);
              },
              child: const SubWidget2(),
            ),
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    var model1 =
                        Provider.of<MyDataModel1>(context, listen: false);
                    model1.changeData();
                  },
                  child: const Text('model1 change'),
                ),
                ElevatedButton(
                  onPressed: () {
                    var model2 =
                        Provider.of<MyDataModel2>(context, listen: false);
                    model2.changeData();
                  },
                  child: const Text('model2 change'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class SubWidget1 extends StatelessWidget {
  MyDataModel1 model1;
  MyDataModel2 model2;
  Widget? child;

  SubWidget1(this.model1, this.model2, this.child, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.green,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              'I am Subwidget1, ${model1.data}, ${model2.data}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            child!
          ],
        ));
  }
}

class SubWidget2 extends StatelessWidget {
  const SubWidget2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurpleAccent,
      padding: const EdgeInsets.all(20),
      child: const Text(
        'I am SubWidget2',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}