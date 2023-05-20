import 'ICoffee.dart';


// Одновременные функции засовывать в Future.await(func1, func2)


Future<void> bWater() {
  print("Вода кипитится...");
  return Future.delayed(Duration(seconds: 3)).then((_) => (print("Вода вскипятилась!")));
}

Future<void> bCoffee() {
  print("Кофе заваривается...");
  return Future.delayed(Duration(seconds: 5)).then((_) => (print("Кофе был заварен!")));
}

Future<void> bMilk() {
  print("Вода кипитится...");
  return Future.delayed(Duration(seconds: 5)).then((_) => (print("Вода вскипятилась!")));
}

Future<void> mixMilkCoffee() {
  print("Перемешивание молока и кофе...");
  return Future.delayed(Duration(seconds: 3)).then((_) => (print("Перемешивание завершено!")));
}
