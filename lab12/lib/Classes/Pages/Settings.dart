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
  int beans = 0;
  int water = 0;
  int milk = 0;
  int cash = 0;

  final _formKey = GlobalKey<FormState>();
  var _beansInput = TextEditingController();
  var _waterInput = TextEditingController();
  var _milkInput = TextEditingController();
  var _cashInput = TextEditingController();

  void _changeResources(String value) {
    if (value == 'add') {
      Resources resources = Resources(
          int.parse(_beansInput.text),
          int.parse(_waterInput.text),
          int.parse(_milkInput.text),
          int.parse(_cashInput.text),
      );
      widget.machine.changeResources(resources);
      setState(() {});
    }
    if (value == 'take') {
      Resources resources = Resources(
          -int.parse(_beansInput.text),
          -int.parse(_waterInput.text),
          -int.parse(_milkInput.text),
          -int.parse(_cashInput.text)
      );
      widget.machine.changeResources(resources);
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    _beansInput = TextEditingController(text: '');
    _waterInput = TextEditingController(text: '');
    _milkInput = TextEditingController(text: '');
    _cashInput = TextEditingController(text: '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
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
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            'Current resources:',
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Coffee: ${widget.machine.resources.coffeeBeans}',
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white
                            ),
                          ),
                          Text(
                            'Water: ${widget.machine.resources.water}',
                            style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white
                            ),
                          ),
                          Text(
                            'Milk: ${widget.machine.resources.milk}',
                            style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white
                            ),
                          ),
                          Text(
                            'Money inside: ${widget.machine.resources.cash}',
                            style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white
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
              height: 15,
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
                        )
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      vertical: 16, horizontal: 24
                    )
                  ),
                  child: const Icon(Icons.add),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _changeResources('take');
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Resources has been taken!'),
                          )
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 24
                      )
                  ),
                  child: const Icon(Icons.remove),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

