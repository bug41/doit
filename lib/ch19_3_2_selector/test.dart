import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyDataModel with ChangeNotifier {
  int data1 = 0;
  int data2 = 10;

  void chnageData1() {
    data1++;
    notifyListeners();
  }

  void chnageData2() {
    data2++;
    notifyListeners();
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
          title: const Text('Selector Test'),
        ),
        body: MultiProvider(
          providers: [
            ChangeNotifierProvider<MyDataModel>.value(value: MyDataModel())
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
            Consumer<MyDataModel>(
              builder: (context, model, child) {
                return Container(
                  color: Colors.green,
                  padding: const EdgeInsets.all(20),
                  child: Center(
                    child: Text(
                      'consumer, data1: ${model.data1}, data2: ${model.data2}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              },
            ),
            Selector<MyDataModel, int>(
              builder: (context, data, child) {
                return Container(
                  color: Colors.cyan,
                  padding: const EdgeInsets.all(20),
                  child: Center(
                    child: Text(
                      'selector, data:$data',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              },
              selector: (context, model) => model.data2,
            ),
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    var model1 =
                        Provider.of<MyDataModel>(context, listen: false);
                    model1.chnageData1();
                  },
                  child: const Text('mdoel data1 change'),
                ),
                ElevatedButton(
                  onPressed: () {
                    var model1 =
                        Provider.of<MyDataModel>(context, listen: false);
                    model1.chnageData2();
                  },
                  child: const Text('mdoel data2 change'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
