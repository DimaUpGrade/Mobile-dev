import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'classes/Machine.dart';
import 'dart:developer' as developer;

void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Кофемашина',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: const MyTestWidget(title: 'Кофемашина'),
    );
  }
}


class MyTestWidget extends StatefulWidget {
  const MyTestWidget({super.key, required this.title});

  final String title;

  @override
  State<MyTestWidget> createState() => _MyTestWidgetState();
}

class _MyTestWidgetState extends State<MyTestWidget> {
  String _output = "100";
  CoffeeMachine machine = CoffeeMachine(300, 500, 600, 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text (
              '$_output',
              style: TextStyle(
                fontSize: 24,
              )

            ),
            ElevatedButton(
              onPressed: () {
                machine.water += 100;
                setState(() {_output = 'Добавлено 100 мл воды!';});
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown
              ),
              child: const Text("Добавить 100 мл воды")
            ),
            ElevatedButton(
                onPressed: () {
                  machine.coffeeBeans += 50;
                  setState(() {_output = 'Добавлено 50 г кофе!';});
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown
                ),
                child: const Text("Добавить 50 г кофе")
            ),
            ElevatedButton(
                onPressed: () {
                  if (machine.makingCoffee()) {
                    setState(() {_output = 'Ваш кофе готов!';});
                  }
                  else {
                    setState(() {_output = "Недостаточно ингредиентов!";});
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown
                ),
                child: const Text("Приготовить чашку кофе")
            )
          ],
        ),
      ),
    );
  }
}

