import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  final Person person;

  const SecondPage({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Name: ${person.name}'),
            Text('Age: ${person.age}'),
          ],
        ),
      ),
    );
  }
}

class Person {
  String name;
  int age;

  Person({required this.name, required this.age});
}
