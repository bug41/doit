import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const ParentWidget());
}

class ParentWidget extends StatefulWidget {
  const ParentWidget({super.key});

  @override
  State<ParentWidget> createState() => ParentWidgetState();
}

class ParentWidgetState extends State<ParentWidget> {
  bool favorited = false;
  int favoriteCount = 10;
  GlobalKey<ChildWidgetState> childKey = GlobalKey();
  int childCount = 0;

  void toggleFavorite() {
    setState(() {
      print('왜 여기 안와');
      if (favorited) {
        favoriteCount -= 1;
        favorited = false;
      } else {
        favoriteCount += 1;
        favorited = true;
      }
    });
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
                const IconWidget(),
                const ContentWidget()
              ],
            )));
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
    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: Text('I am Child, $childCount'),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              childCount++;
            });
          },
          child: const Text('increment'),
        ),
      ],
    );
  }
}

class IconWidget extends StatelessWidget {
  const IconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    ParentWidgetState? state =
        context.findAncestorStateOfType<ParentWidgetState>();

    return Center(
      child: IconButton(
        icon: ((state?.favorited ?? false)
            ? const Icon(Icons.favorite)
            : const Icon(Icons.favorite_border)),
        color: Colors.blue,
        iconSize: 100,
        onPressed: state?.toggleFavorite,
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
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        'favoriteCount : ${state?.favoriteCount}',
      ),
    );
  }
}
