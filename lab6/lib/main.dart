import 'package:flutter/material.dart';

void main() => runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text ('Калькулятор площади')),
        body: const MyForm(),
      ),
    )
);

class MyForm extends StatefulWidget {
  const MyForm({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MyFormState();
}

class MyFormState extends State {
  final _formKey = GlobalKey<FormState>();
  double width = 0;
  double height = 0;
  double result = 0;
  String outputString = 'Задайте параметры';

  bool myValidate(value){
    try{
      double.parse(value);
      return true;
    }
    on Exception {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child:
      Form(
        key: _formKey,
        child:
          Column(
            children: <Widget>[
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: const Text('Ширина, мм')
                  ),
                  Expanded(
                      child: TextFormField(validator: (value) {
                        if (value!.isNotEmpty && myValidate(value) && double.parse(value) > 0) {
                          width = double.parse(value);
                        }
                        else {
                          return "Данные некорректны!";
                        }
                      })
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                      padding: const EdgeInsets.all(10),
                      child: const Text('Длина, мм')
                  ),
                  Expanded(
                      child: TextFormField(validator: (value) {
                        if (value!.isNotEmpty && myValidate(value) && double.parse(value) > 0) {
                          height = double.parse(value);
                        }
                        else {
                          return "Данные некорректны!";
                        }
                      })
                  )
                ],
              ),

              const Divider(color: Colors.transparent, height: 50),

              ElevatedButton(
                  onPressed: (){
                    if (_formKey.currentState!.validate())
                      {
                        setState(() {
                          result = width * height;
                          outputString = 'S = $width * $height = $result мм^2';
                        });
                      }
                    else {
                      setState(() {
                        outputString = 'Проверьте данные';
                      });
                    }
                  },
                  child: const Text('Вычислить', style: TextStyle(color: Colors.white))
              ),

              const Divider(color: Colors.transparent, height: 50),

              Text(outputString),
            ],
          )
      ),
    );
  }
}



