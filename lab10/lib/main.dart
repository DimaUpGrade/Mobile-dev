import 'Classes/Coffee.dart';
import 'Classes/Machine.dart' as mach;
import 'Classes/Resources.dart';
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
      title: 'Coffee machine',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: const MyTestWidget(title: 'Coffee machine'),
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
  String _output = "Make your choice, please!";
  mach.CoffeeMachine machine = mach.CoffeeMachine(Resources(1000, 1000, 1000, 1000));

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
                _output,
                style: const TextStyle(
                  fontSize: 24,
                )
            ),

            // Пока что отложены кнопки добавления ресурсов, но их легко сделать
            // если это потребуется
            // (здесь код из девятой лабы для кнопок добавки ресурсов)
            //
            // ElevatedButton(
            //     onPressed: () {
            //       //machine.water += 100;
            //       setState(() {_output = 'Добавлено 100 мл воды!';});
            //     },
            //     style: ElevatedButton.styleFrom(
            //         backgroundColor: Colors.brown
            //     ),
            //     child: const Text("Добавить 100 мл воды")
            // ),
            // ElevatedButton(
            //     onPressed: () {
            //       //machine.coffeeBeans += 50;
            //       setState(() {_output = 'Добавлено 50 г кофе!';});
            //     },
            //     style: ElevatedButton.styleFrom(
            //         backgroundColor: Colors.brown
            //     ),
            //     child: const Text("Добавить 50 г кофе")
            // ),

            ElevatedButton(
                onPressed: () {
                  Espresso espresso = Espresso();
                  if (machine.makingCoffee(espresso)) {
                    setState(() {_output = 'Your espresso is done!';});
                  }
                  else {
                    setState(() {_output = "Not enough resources!";});
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown
                ),
                child: const Text("Make espresso")
            ),
            ElevatedButton(
                onPressed: () {
                  Latte latte = Latte();
                  if (machine.makingCoffee(latte)) {
                    setState(() {_output = 'Your latte is done!';});
                  }
                  else {
                    setState(() {_output = "Not enough resources!";});
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown
                ),
                child: const Text("Make latte")
            ),
            ElevatedButton(
                onPressed: () {
                  Cappuccino cappuccino = Cappuccino();
                  if (machine.makingCoffee(cappuccino)) {
                    setState(() {_output = 'Your cappuccino is done!';});
                  }
                  else {
                    setState(() {_output = "Not enough resources!";});
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown
                ),
                child: const Text("Make espresso")
            ),
            ElevatedButton(
                onPressed: () {
                  Americano americano = Americano();
                  if (machine.makingCoffee(americano)) {
                    setState(() {_output = 'Your americano is done!';});
                  }
                  else {
                    setState(() {_output = "Not enough resources!";});
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown
                ),
                child: const Text("Make americano")
            ),
          ],
        ),
      ),
    );
  }
}
