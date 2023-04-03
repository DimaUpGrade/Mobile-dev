import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Список элементов',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Список элементов'),
            ),
            body: ListView.builder(
                itemBuilder: (context, index) {
                  var val1 = BigInt.from(2);
                  BigInt val2 = val1.pow(index);
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          '2 ^ $index = $val2',
                          style: const TextStyle(fontSize: 15),
                      ),
                      const Divider(height: 30,),
                    ],
                  );
                }
            )
        )
    );
  }
}


