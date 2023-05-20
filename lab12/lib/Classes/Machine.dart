import 'ICoffee.dart';
import 'Resources.dart';
import 'AsyncCoffee.dart';


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

  Future<void> makingCoffee(ICoffee coffee) async {
    if (isAvailable(coffee)) {
      subtractResources(coffee);
      //print('Your ${coffee.coffeeName} is done!');
      if (coffee.milkRequired != 0) {
        await bWater();
        Future.wait([bCoffee(), bMilk()]);
        await mixMilkCoffee();
      }
      else {
        await bWater();
        await bCoffee();
      }

      print("Your ${coffee.coffeeName} is done!");

    } else {
      print("There is not enough resources!");
      //print('Not enough resources to make your ${coffee.coffeeName}!');
    }
  }
}
