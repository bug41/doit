import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterController extends GetxController {
  int count = 0;
  /*
  @override
  onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  } 
  */

  void increment() {
    count++;
    update();
  }

  void decrement() {
    count--;
    update();
  }
}

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('GetX Test'),
        ),
        body: GetBuilder(
          init: CounterController(),
          builder: (_) {
            return const MyWidget();
          },
        ),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CounterController>(
      builder: (controller) {
        return Container(
          color: Colors.deepOrange,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'GetX: ${controller.count}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.increment();
                  },
                  child: const Text('increment'),
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.decrement();
                  },
                  child: const Text('decrement'),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
