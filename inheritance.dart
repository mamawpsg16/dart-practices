class Animal {
  String _breed;  // Private variable (only accessible inside this file)
  String _color;   // Public variable
  String _type = 'Animal'; // Private variable
  Animal(this._breed, this._color,[this._type = 'Animal']); // Constructor

  // Public getter for _breed
  String get breed => "Breed is $_breed";

  // Public setter for _breed
  set breed(String newBreed) {
    _breed = newBreed;
  }

  void eat() {
    print('$_type is eating.');
  }
}


class Dog extends Animal {
  String _name;

  Dog(String breed, String color, this._name) : super(breed, color, 'Dog');

  @override
  void eat() {
    super.eat();
    print('$_name is eating.');
  }

  void bark() {
    print('Dog is barking.');
  }
}