class CoffeeMachine {
  int _coffeeBeans;
  int _milk;
  int _water;
  int _cash;

  CoffeeMachine(this._coffeeBeans, this._milk, this._water, this._cash);

  int get coffeeBeans {
    return _coffeeBeans;
  }

  set coffeeBeans (int value) {
    _coffeeBeans = value;
  }

  int get milk {
    return _milk;
  }

  set milk (int value) {
    _milk = value;
  }

  int get water {
    return _water;
  }

  set water (int value) {
    _water = value;
  }

  int get cash {
    return _cash;
  }

  set cash (int value) {
    _cash = value;
  }

  bool isAvailable() {
    if (_water >= 50 && _coffeeBeans >= 100) {
      return true;
    }
    else {
      return false;
    }
  }

  void _subtractResources() {
    _coffeeBeans -= 50;
    _water -= 100;
  }

  // Сделал тип bool, чтобы отслеживать приготовление или неприготовление кофе
  bool makingCoffee() {
    if (isAvailable()) {
      _subtractResources();
      print('есть кофе');
      return true;
    }
    else {
      print('нет кофе');
      return false;
    }
  }
}
