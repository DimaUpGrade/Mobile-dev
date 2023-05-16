class Resources {
  int _coffeeBeans;
  int _water;
  int _milk;
  int _cash;

  Resources(this._coffeeBeans, this._water, this._milk, this._cash);

  int get coffeeBeans {
    return _coffeeBeans;
  }

  set coffeeBeans (int value) {
    _coffeeBeans = value;
  }

  int get water {
    return _water;
  }

  set water (int value){
    _water = value;
  }

  int get milk {
    return _milk;
  }

  set milk (int value) {
    _milk = value;
  }

  int get cash {
    return _cash;
  }

  set cash (int value) {
    _cash = value;
  }
}