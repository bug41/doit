import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class User {
  String name;
  String phone;
  String email;

  User(this.name, this.phone, this.email);
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  List<User> users = [
    User('홍길동', '010001', 'a@a.com'),
    User('김길동', '010002', 'b@a.com'),
    User('홍길동1', '010003', 'a@a.com'),
    User('김길동4', '010004', 'b@a.com'),
    User('홍길동2', '010001', 'a@a.com'),
    User('김길동5', '010002', 'b@a.com'),
    User('홍길동3', '010001', 'a@a.com'),
    User('김길동6', '010002', 'b@a.com'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Test'),
        ),
        body: ListView.separated(
          itemCount: users.length,
          itemBuilder: ((context, index) {
            return ListTile(
              leading: const CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage('images/big.jpeg'),
              ),
              title: Text(users[index].name),
              subtitle: Text(users[index].phone),
              trailing: const Icon(Icons.more_vert),
              onTap: () {
                print(users[index].name);
              },
            );
          }),
          separatorBuilder: (BuildContext context, int index) {
            return const Divider(
              height: 2,
              color: Colors.black,
            );
          },
        ),
      ),
    );
  }
}
