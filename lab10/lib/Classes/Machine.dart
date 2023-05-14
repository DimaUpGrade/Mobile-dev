import 'ICoffee.dart';
import 'Resources.dart';

class CoffeeMachine {
  Resources _resources;

  CoffeeMachine(this._resources);

  Resources get resources {
    return _resources;
  }

  set resources (Resources value) {
    _resources = value;
  }

  bool isAvailable(ICoffee coffee) {
    return _resources.coffeeBeans >= coffee.coffeeBeansRequired &&
        _resources.water >= coffee.waterRequired &&
        _resources.milk >= coffee.milkRequired;
  }

  void subtractResources(ICoffee coffee) {
    if (isAvailable(coffee)) {
      _resources.coffeeBeans -= coffee.coffeeBeansRequired;
      _resources.water -= coffee.waterRequired;
      _resources.milk -= coffee.milkRequired;
      _resources.cash += coffee.coffeePrice;
    }
  }

  bool makingCoffee(ICoffee coffee) {
    if (isAvailable(coffee)) {
      subtractResources(coffee);
      //print('Your ${coffee.coffeeName} is done!');
      return true;
    } else {
      return false;
      //print('Not enough resources to make your ${coffee.coffeeName}!');
    }
  }
}
