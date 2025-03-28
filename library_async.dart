Future<String> setName(String string) async {
  return await Future.delayed(Duration(seconds: 1), () {
    if (string.isEmpty) {
      throw "Error: String cannot be empty!";
    }
    return string;
  });
}

// Simulated API call that takes time
Future<String> fetchUserData() async {
  return await Future.delayed(Duration(seconds: 2), () => "User: Kevin");
}

Future<String> loadImages() async {
  // return await Future.delayed(Duration(seconds: 3), () => "Images Loaded");
  return await Future.delayed(Duration(seconds: 2), () { //TRIGGER ERROR
    throw "Something went wrong!";
  });
}

Future<String> getNotifications() async {
  return await Future.delayed(Duration(seconds: 1), () => "New Notifications");
}

Stream<int> countStream(int max) async* {
  for (int i = 1; i <= max; i++) {
    await Future.delayed(Duration(seconds: 1)); // Simulate delay
    yield i; // Emit a value to the stream
  }
}

  Stream<int> faultyStream() async* {
  yield 1;
  yield 2;
  throw "Something went wrong!";
  yield 3; // This will never execute
}

  
void main() async{
  
  await setName('gekko').then((e) => print("Returned Value: $e")).catchError((e) => print("Error: $e"));

  try {
    var shet = await setName('');
    print(shet);
  } catch (e) {
    print('CATCH: ${e}');
  }

  print("Fetching data...");

  try {
     List<String> results = await Future.wait([
      fetchUserData(),
      loadImages(),
      getNotifications(),
    ]);
    print("✅ Done! Results: $results");
  } catch (e) {
    print("❌ Error occurred: $e");
  }

  /** Using an Asynchronous for Loop (await for)  */
  await for (int value in countStream(3)) {
    print("Received: $value");
  }
  print("✅ Stream finished!");

  /** Transforming Stream Data  */
    countStream(5)
      .map((num) => num * 2) // Multiply each value by 2
      .listen((value) {
        print("Doubled: $value");
      });

  /** Handling Errors in Streams */
  faultyStream().listen((value) {
    print("Received: $value");
  }, onError: (error) {
    print("❌ Error: $error");
  }, onDone: () {
    print("✅ Stream finished!");
  });
}