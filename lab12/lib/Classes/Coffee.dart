import 'ICoffee.dart';
import 'Enums.dart';

class Espresso implements ICoffee {
  CoffeeTypes get type {
    return CoffeeTypes.espresso;
  }

  @override
  String get coffeeName {
    return 'espresso';
  }

  @override
  int get coffeeBeansRequired {
    return 10;
  }

  @override
  int get waterRequired {
    return 30;
  }

  @override
  int get milkRequired {
    return 0;
  }

  @override
  int get coffeePrice {
    return 100;
  }
}

class Latte implements ICoffee {
  CoffeeTypes get type {
    return CoffeeTypes.latte;
  }

  @override
  String get coffeeName {
    return 'latte';
  }

  @override
  int get coffeeBeansRequired {
    return 10;
  }

  @override
  int get waterRequired {
    return 10;
  }

  @override
  int get milkRequired {
    return 180;
  }

  @override
  int get coffeePrice {
    return 150;
  }
}

class Cappuccino implements ICoffee{
  CoffeeTypes get type {
    return CoffeeTypes.latte;
  }

  @override
  String get coffeeName {
    return 'cappuccino';
  }

  @override
  int get coffeeBeansRequired {
    return 120;
  }

  @override
  int get waterRequired {
    return 10;
  }

  @override
  int get milkRequired {
    return 120;
  }

  @override
  int get coffeePrice {
    return 140;
  }
}

class Americano implements ICoffee{
  CoffeeTypes get type {
    return CoffeeTypes.americano;
  }

  @override
  String get coffeeName {
    return 'americano';
  }

  @override
  int get coffeeBeansRequired {
    return 10;
  }

  @override
  int get waterRequired {
    return 90;
  }

  @override
  int get milkRequired {
    return 0;
  }

  @override
  int get coffeePrice {
    return 120;
  }
}
