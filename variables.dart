  /** VARIABLES DECLARATIONS */

  void example(){
    print("-------------- VARIABLES --------------");
    var name = 'Voyager I';
    int age = 25;
    double height = 5.9;
    String name2 = "Alice";
    bool isStudent = true;
    Object obj = "Hello";  // Can hold any type
    Object? nullableObj;   // Can hold null
    dynamic anything = 42; // Can be anything
    List<int> numbers = [1, 2, 3]; // List that only holds integers
    List<Object> mixed = [1, "hello", true]; // List that holds any type

    // List<T>
<<<<<<< HEAD
    List<int> numbers = [1, 2, 3, 4, 5];
=======
    // List<int> numbers = [1, 2, 3, 4, 5];
>>>>>>> 3a906cd (Reinitialized Git and linked to GitHub)

    // Map<K, V>
    Map<String, String> user = {
      "name": "John",
      "email": "john@example.com"
    };

    // Set<T>
    Set<String> uniqueNames = {"Alice", "Bob", "Charlie"};

    Null empty = null;

    // Single image Map
    Map<String, dynamic> image = {
      'tags': ['saturn'],
      'url': '//path/to/saturn.jpg',
    };

    // List of image Maps
    List<Map<String, dynamic>> images = [
      {
        'tags': ['saturn'],
        'url': '//path/to/saturn.jpg',
      },
      {
        'tags': ['earth'],
        'url': '//path/to/earth.jpg',
      }
    ];

    // Print all variables
    print("Name 1: $name, Name 2: $name2");
    print("Age: $age, Height: $height, Is Student: $isStudent");

    // print("Numbers List: $numbers");
    // print("User Map: $user");
    // print("Unique Names Set: $uniqueNames");

    // print("Empty Variable: $empty");

    // print("Single Image Map: Tags - ${image['tags']}, URL - ${image['url']}");

    // print("List of Images:");
    // for (var img in images) {
    //   print("Tags: ${img['tags']}, URL: ${img['url']}");
    // }

  }