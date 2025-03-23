void example(){
  print("-------------- FUNCTIONS --------------");
   // int sum(int a, int b) {
  //   return a + b;
  // }

  // int sumShortHand(int a, int b) => a + b;

  // print(sum(2, 3)); // 5
  // print(sumShortHand(2, 3)); // 5

  // flybyObjects.where((name) => name.contains('turn')).forEach(print); // Shortcut for forEach((item) => print(item))

  // void greet({String name = 'Guest'}) {
  //   print('Hello, $name!');
  // }

  // greet(); // Hello, Guest!
  // greet(name: 'Alice'); // Hello, Alice!

  List<int> numbersV2 = [1,2,3,4,5];

  // // ✅ Works fine even if the list is empty
  int sum = numbersV2.fold(0, (a, b) => a + b);

  print(sum);
}