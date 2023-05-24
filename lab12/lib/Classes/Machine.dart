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

  void zeroResource(String resource) {
    if(resource == 'beans') {
      _resources.coffeeBeans = 0;
    }
    if(resource == 'water') {
      _resources.water = 0;
    }
    if(resource == 'milk') {
      _resources.milk = 0;
    }
    if(resource == 'cash') {
      _resources.cash = 0;
    }
  }

  void changeResources(Resources value) {
    _resources.coffeeBeans += value.coffeeBeans;
    _resources.water += value.water;
    _resources.milk += value.milk;
    _resources.cash += value.cash;
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
