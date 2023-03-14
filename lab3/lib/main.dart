import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Инкремент',
      theme: ThemeData(

        primarySwatch: Colors.deepPurple,
      ),
      home: const MyHomePage(title: 'Инкремент'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounterPlus() {
    setState(() {
      _counter++;
    });
  }

  void _incrementCounterMinus() {
    setState(() {
      _counter--;
    });
  }


  void _incrementCounterReset() {
    setState(() {
      _counter=0;
    });
  }

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
            const Text(
              'Значение инкремента:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: _incrementCounterMinus,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red
                    ),
                    child: const Icon(Icons.remove),
                  ),
                  ElevatedButton(
                    onPressed: _incrementCounterPlus,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green
                    ),
                    child: const Icon(Icons.add),
                  )
                ]
            ),
            TextButton(
                onPressed: _incrementCounterReset,
                style: TextButton.styleFrom(
                ),
                child: const Text(
                  "Сбросить",
                  style: TextStyle(
                      color: Colors.grey
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}
