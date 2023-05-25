import 'package:lab12/Classes/Enums.dart';
import 'package:lab12/Classes/ICoffee.dart';
import 'Classes/Coffee.dart';
import 'Classes/Machine.dart' as mach;
import 'Classes/Resources.dart';
import 'package:flutter/material.dart';
import 'package:lab12/Classes/Pages/Settings.dart';
import 'package:lab12/Classes/Pages/Display.dart';

import 'classes/Machine.dart';
import 'dart:developer' as developer;

void main() {
  runApp(const MyTabBarApp());
  
}

class MyTabBarApp extends StatelessWidget {
  const MyTabBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: MyTabBarBuild(),
    );
  }
}

class MyTabBarBuild extends StatefulWidget {
  const MyTabBarBuild({Key? key}) : super(key: key);

  @override
  _MyTabBarBuildState createState() => _MyTabBarBuildState();

}

class _MyTabBarBuildState extends State<MyTabBarBuild> {
  mach.CoffeeMachine machine = mach.CoffeeMachine(Resources(0, 0, 0, 0), 0);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
              'Coffee Machine',
              style: TextStyle(
                color: Colors.white,
              )
          ),
          backgroundColor: Colors.brown,
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.coffee, color: Colors.white),
              ),
              Tab(
                icon: Icon(Icons.settings, color: Colors.white),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Display(machine: machine),
            Settings(machine: machine),
          ],
        ),
      ),
    );
  }
  
}