import 'package:flutter/material.dart';

void main() {
  runApp(const ParentWidget());
}

class ParentWidget extends StatefulWidget {
  const ParentWidget({super.key});

  @override
  ParentWidgetState createState() => ParentWidgetState();
}

class ParentWidgetState extends State<ParentWidget> {
  bool favorited = false;
  int favoriteCount = 10;
  GlobalKey<ChildWidgetState> childKey = GlobalKey();
  int childCount = 0;

  void toggleFavorite() {
    if (favorited) {
      favoriteCount -= 1;
      favorited = false;
    } else {
      favoriteCount += 1;
      favorited = true;
    }
    setState(() {});
  }

  void getChildData() {
    ChildWidgetState? childState = childKey.currentState;
    setState(() {
      childCount = childState?.childCount ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('State Test'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text('I am Parent, child count : $childCount'),
                ),
                ElevatedButton(
                  onPressed: getChildData,
                  child: const Text('get child data'),
                )
              ],
            ),
            ChildWidget(key: childKey),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 200,
                  height: 100,
                  color: Colors.pink,
                  child: const Text('Container'),
                ),
                Container(
                  width: 200,
                  height: 100,
                  color: Colors.pink,
                  child: const Text('Container'),
                ),
                // 다른 자식 위젯들을 추가할 수 있습니다.
              ],
            ),
            const IconWidget(),
            const ContentWidget()
          ],
        ),
      ),
    );
  }
}

class ChildWidget extends StatefulWidget {
  const ChildWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ChildWidgetState();
  }
}

class ChildWidgetState extends State<ChildWidget> {
  int childCount = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: Text('I am Child, $childCount'),
        ),
        ElevatedButton(
          child: const Text('increment'),
          onPressed: () {
            setState(() {
              childCount++;
            });
          },
        ),
      ],
    );
  }
}

class IconWidget extends StatelessWidget {
  const IconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    ParentWidgetState? state =
        context.findAncestorStateOfType<ParentWidgetState>();

    return Center(
      child: IconButton(
        icon: ((state?.favorited ?? false)
            ? const Icon(Icons.favorite)
            : const Icon(Icons.favorite_border)),
        color: Colors.blue,
        iconSize: 200,
        onPressed: () => state?.toggleFavorite(),
      ),
    );
  }
}

class ContentWidget extends StatelessWidget {
  const ContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    ParentWidgetState? state =
        context.findAncestorStateOfType<ParentWidgetState>();

    return Center(
      child: Text(
        'favoriteCount : ${state?.favoriteCount}',
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
