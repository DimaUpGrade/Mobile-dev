import 'package:lab12/Classes/Machine.dart';
import 'package:lab12/Classes/Resources.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  final CoffeeMachine machine;

  const Settings({Key? key, required this.machine}) : super(key: key);

  @override
  State<Settings> createState() => _Settings();
}

class _Settings extends State<Settings> {
  final _formKey = GlobalKey<FormState>();
  var _beansInput = TextEditingController();
  var _waterInput = TextEditingController();
  var _milkInput = TextEditingController();
  var _cashInput = TextEditingController();

  void _changeResources(String value) {
    int beans = int.parse(_beansInput.text);
    int water = int.parse(_waterInput.text);
    int milk = int.parse(_milkInput.text);
    int cash = int.parse(_cashInput.text);

    if (value == 'add') {
      Resources resources = Resources(beans, water, milk, cash);
      widget.machine.changeResources(resources);
      setState(() {});
    }
    if (value == 'take') {
      if (widget.machine.resources.coffeeBeans - beans >= 0) {
        beans = -beans;
      }
      else {
        beans = 0;
        widget.machine.zeroResource('beans');
      }
      if (widget.machine.resources.water - water >= 0) {
        water = -water;
      }
      else {
        water = 0;
        widget.machine.zeroResource('water');
      }
      if (widget.machine.resources.milk - milk >= 0) {
        milk = -milk;
      }
      else {
        milk = 0;
        widget.machine.zeroResource('milk');
      }
      if (widget.machine.resources.cash - cash >= 0) {
        cash = -cash;
      }
      else {
        cash = 0;
        widget.machine.zeroResource('cash');
      }

      Resources resources = Resources(beans, water, milk, cash);
      widget.machine.changeResources(resources);
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    _beansInput = TextEditingController(text: '0');
    _waterInput = TextEditingController(text: '0');
    _milkInput = TextEditingController(text: '0');
    _cashInput = TextEditingController(text: '0');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Container(
              color: Colors.green,
              child: Column(
                children: [
                  const SizedBox(
                    height: 35,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                    child: Container(
                      height: 150,
                      width: 400,
                      decoration: const BoxDecoration(
                        color: Colors.deepPurpleAccent,
                        border: Border(
                            top: BorderSide(color: Colors.deepPurple, width: 4.0),
                            left: BorderSide(color: Colors.deepPurple, width: 4.0),
                            right: BorderSide(color: Colors.deepPurple, width: 4.0),
                            bottom: BorderSide(color: Colors.deepPurple, width: 4.0)
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            'Current resources:',
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              // fontWeight: FontWeight.bold,
                                fontFamily: 'Minecraft'
                            ),
                          ),
                          Text(
                            'Coffee: ${widget.machine.resources.coffeeBeans}',
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                                fontFamily: 'Minecraft'
                            ),
                          ),
                          Text(
                            'Water: ${widget.machine.resources.water}',
                            style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              fontFamily: 'Minecraft'
                            ),
                          ),
                          Text(
                            'Milk: ${widget.machine.resources.milk}',
                            style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontFamily: 'Minecraft'),
                          ),
                          Text(
                            'Cash: ${widget.machine.resources.cash}',
                            style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontFamily: 'Minecraft'
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              height: 2,
              color: Colors.black,
            ),
            TextFormField(
              controller: _beansInput,
              validator: (beans) {
                if (int.tryParse(beans!) == null) {
                  return 'Enter the correct data!';
                }
                return null;
              },
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: 'Coffee'),
            ),
            TextFormField(
              controller: _waterInput,
              validator: (water) {
                if (int.tryParse(water!) == null) {
                  return 'Enter the correct data!';
                }
                return null;
              },
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: 'Water'),
            ),
            TextFormField(
              controller: _milkInput,
              validator: (milk) {
                if (int.tryParse(milk!) == null) {
                  return 'Enter the correct data!';
                }
                return null;
              },
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: 'Milk'),
            ),
            TextFormField(
              controller: _cashInput,
              validator: (cash) {
                if (int.tryParse(cash!) == null) {
                  return 'Enter the correct data!';
                }
                return null;
              },
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: 'Cash'),
            ),
            const SizedBox(
              height: 150,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _changeResources('add');
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Resources has been added!'),
                          duration: Duration(milliseconds: 450),
                        )
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      vertical: 16, horizontal: 16
                    ),
                    backgroundColor: Colors.green
                  ),
                  child: const Icon(Icons.add, color: Colors.white),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _changeResources('take');
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Resources has been taken!'),
                            duration: Duration(milliseconds: 450),
                          )
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 16,
                      ),
                      backgroundColor: Colors.red),
                  child: const Icon(Icons.remove, color: Colors.white),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

