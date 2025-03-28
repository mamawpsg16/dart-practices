// String createOrderMessage() {
//   var order = fetchUserOrder();
//   return 'Your order is: $order';
// }


Future<String> fetchUserOrder() {
  // Imagine that this function is fetching user info but encounters a bug.
  return Future.delayed(
    const Duration(seconds: 2),
    () => throw Exception('Logout failed: user ID is invalid'),
  );
}

Future<String> createOrderMessage() async {
  try {
    var order = await fetchUserOrder(); // ✅ Now this properly returns a String
    return 'Your order is: $order';
  } catch (e) {
    return 'Failed to create order message: $e';
  }
}

Future<String> myFunc() async {
  return Future.delayed(const Duration(seconds: 2), () => 'Hello World');
}

// Future<String> fetchUserOrder() =>
// // Imagine that this function is
// // more complex and slow.
// Future.delayed(const Duration(seconds: 2), () => 'Large Latte');

/** STREAMS  */
Future<int> sumStream(Stream<int> stream) async {
  var sum = 0;

  // await for listens to the stream asynchronously.
  // It processes one value at a time until all values are received.
  // After consuming all values, it returns the total sum.
  await for (final value in stream) {
    sum += value; // Adds each received value to sum
  }

  return sum; // Returns the total sum
}


// Function that generates a stream of integers from 1 to `to`
Stream<int> countStream(int to) async* {
  for (int i = 1; i <= to; i++) {
    yield i; // Emits one value at a time asynchronously
  }
}

Future<int> sumStreamV1(Stream<int> stream) async {
  var sum = 0;
  try {
    await for (final value in stream) {
      sum += value;
    }
  } catch (e) {
    return -1;
  }
  return sum;
}

Stream<int> countStreamV1(int to) async* {
  for (int i = 1; i <= to; i++) {
    if (i == 4) {
      throw Exception('Intentional exception');
    } else {
      yield i;
    }
  }
}

/** Single Subscription Streams
 * These streams can only be listened to once.
 * They deliver data in a sequence, like an iterator.
 * Used for operations like reading a file, fetching API data, or processing a long-running task.
 */
Stream<int> numberStream() async* {
  for (int i = 1; i <= 5; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield i; // Emit values over time
  }
}



void main() async {
  // print('Fetching user order...');
  // print(await createOrderMessage());

  // var result = myFunc().then((e) => print(e)).catchError((e) => print(e));
  // print(result);
  

  /** STREAM */
  var stream = countStream(10); // Creates a stream of numbers from 1 to 10
  print(stream); // Prints instance of Stream<int>

  var sum = await sumStream(stream); // Sums up all emitted values
  print(sum); // Outputs: 55 (1+2+3+...+10)

  var stream1= countStreamV1(10);
  var sum1 = await sumStreamV1(stream1);
  print(sum1); // -1

  Stream<int> streams = numberStream();

  streams.listen((number) {
    print("Received: $number");
  });

  /** BROADCAST
   * Can have multiple listeners at the same time.
   * Suitable for UI events, WebSocket connections, and real-time updates.
  */
  Stream<int> broadcastStream = numberStream().asBroadcastStream();

  broadcastStream.listen((number) {
    print("Listener 1: $number");
  });

  broadcastStream.listen((number) {
    print("Listener 2: $number");
  });

   numberStream()
      .where((number) => number % 2 == 0) // Only even numbers
      .map((number) => "Number: $number") // Transform to String
      .listen((data) {
    print(data);
  });

}

