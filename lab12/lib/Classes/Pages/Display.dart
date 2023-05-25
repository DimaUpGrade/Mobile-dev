import 'package:flutter/material.dart';
import 'package:lab12/Classes/Machine.dart';
import 'package:lab12/Classes/Coffee.dart';
import 'package:lab12/Classes/ICoffee.dart';
import 'package:lab12/Classes/Resources.dart';

class Display extends StatefulWidget {
  final CoffeeMachine machine;
  const Display({Key? key, required this.machine}) : super(key: key);

  @override
  State<Display> createState() => _Display();
}

class _Display extends State<Display> {
  ICoffee? _coffee;
  int money = 0;
  var _cashInput = TextEditingController();
  Espresso espresso = Espresso();
  Latte latte = Latte();
  Cappuccino cappuccino = Cappuccino();
  Americano americano = Americano();
  String _process = '';

  bool _isMakingCoffee = false;

  void _addMoney() {
    money += int.parse(_cashInput.text);
    setState(() {
      money;
    });
  }

  @override
  void initState() {
    super.initState();
    _cashInput = TextEditingController(text: '0');
  }

  void _clearCashInput() {
    _cashInput.clear();
    setState(() {});
  }

  Future<void> _makeCoffee() async {
    if (_coffee != null  && !_isMakingCoffee) {
      setState(() {
        _process = 'Start process of making ${_coffee!.coffeeName}';
        _isMakingCoffee = true;
      });

      if (widget.machine.isAvailable(_coffee!) && money >= _coffee!.coffeePrice) {
        money -= _coffee!.coffeePrice;
        setState(() {
          money;
        });
        await widget.machine.makingCoffee(_coffee!);
        setState(() {
          _process = 'Process of making ${_coffee!.coffeeName} is completed';
          _isMakingCoffee = false;
        });
      } else {
        setState(() {
          _process = 'Not enough resources for ${_coffee!.coffeeName}!';
          _isMakingCoffee = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        child: ListView(
          children: [
            Container(
              color: Colors.black45,
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0 , 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text('Beans: ${widget.machine.resources.coffeeBeans}',),
                        Text('Water: ${widget.machine.resources.water}'),
                        Text('Milk: ${widget.machine.resources.milk}'),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                    child: Container(
                      height: 150,
                      width: 400,
                      // color: Colors.deepPurpleAccent,
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Coffee Maker 2000',
                            style: TextStyle(
                              fontSize: 30,
                              fontFamily: 'Minecraft',
                              color: Colors.white
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text (
                            'Your money: $money',
                            style: const TextStyle(
                              fontSize: 15,
                              fontFamily: 'Minecraft',
                              color: Colors.white
                            ),
                          ),
                          Flexible(
                            child: Text(
                              _process,
                              style: const TextStyle(
                                fontSize: 15,
                                fontFamily: 'Minecraft',
                                color: Colors.white
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 2,
              color: Colors.black12,
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      RadioListTile<ICoffee>(
                        title: const Text('Espresso 100₽'),
                        value: espresso,
                        groupValue: _coffee,
                        onChanged: (ICoffee? value) {
                          setState(() {_coffee = value;});
                        },
                      ),
                      RadioListTile<ICoffee>(
                        title: const Text('Latte 150₽'),
                        value: latte,
                        groupValue: _coffee,
                        onChanged: (ICoffee? value) {
                          setState(() {_coffee = value;});
                        },
                      ),
                      RadioListTile<ICoffee>(
                        title: const Text('Cappuccino 140₽'),
                        value: cappuccino,
                        groupValue: _coffee,
                        onChanged: (ICoffee? value) {
                          setState(() {_coffee = value;});
                        },
                      ),
                      RadioListTile<ICoffee>(
                        title: const Text('Americano 120₽'),
                        value: americano,
                        groupValue: _coffee,
                        onChanged: (ICoffee? value) {
                          setState(() {_coffee = value;});
                        },
                      )
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {
                    _makeCoffee();
                  },
                  icon: const Icon(Icons.coffee_maker),
                  iconSize: 100,
                  color: _isMakingCoffee ? Colors.grey : Colors.blueAccent,
                )
              ],
            ),
            Container(
              width: double.infinity,
              height: 2,
              color: Colors.black12,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 5,
                ),
                Flexible(
                  child: TextFormField(
                    controller: _cashInput,
                    validator: (cash) {
                      if (int.tryParse(cash!) == null) {
                        return 'Data is incorrect!';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Money'
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    _addMoney();
                  },
                  child: const Icon(Icons.attach_money),
                ),
                ElevatedButton(
                  onPressed: () {
                    _clearCashInput();
                  },
                  child: const Icon(Icons.money_off_csred),
                ),
                const SizedBox(
                  width: 10,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
