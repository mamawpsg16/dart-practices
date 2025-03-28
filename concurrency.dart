import 'dart:isolate';
import 'dart:convert';
import 'dart:io';

const String filename = 'with_keys.json';

// Simulating an asynchronous API call
Future<String> fetchUserData() async {
  await Future.delayed(Duration(seconds: 3)); // Simulating a 3-second delay
  return 'User: Kevin, Age: 25';
}

void main() async{
  /**EVENT LOOP */
  print(' --- EVENT LOOP ---');
  print('Start');

  // schedules 'Delayed Task' to run after 2 seconds.
  Future.delayed(Duration(seconds: 2), () {
    print('Delayed Task');
  });

  print('Mid');

  //If you want Dart to wait for the delayed task before moving on, you can use await
  await Future.delayed(Duration(seconds: 2));
  print('Delayed Task');

  print('End');

  /** ASNYCHRONOUS */
  print(' --- ASNYCHRONOUS ---');
  print('Fetching user data...');

  // fetchUserData().then((user) {
  //   print('User data received: $user');
  // }).catchError((error) {
  //   print('Error fetching user data: $error');
  // });

  // Using async and await for Better Readability
  try {
    String user = await fetchUserData();
    print('User data received: $user');
  } catch (error) {
    print('Error fetching user data: $error');
  }
  print('Processing other tasks while waiting...');

  /** ISOLATE 
   * pawning: Isolate.spawn(entryPoint, message) starts a new isolate.
   * Running: The isolate executes the provided function.
   * Communication: Data is exchanged via SendPort and ReceivePort.
   * Termination: Isolates must be explicitly terminated using isolate.kill()
  */

  /** ISOLATE.SPAWN  (USE FOR)
   * Long-lived background workers
   * Higher (must be manually managed/disposed)
   * Uses SendPort & ReceivePort
   * More complex (manual message handling)
   * Running a background service
   */
  print('Start');
  // Creating a ReceivePort to get messages from the spawned isolate.
  final receivePort = ReceivePort();

  // Spawning a new isolate and passing the SendPort of our ReceivePort to communicate.
  await Isolate.spawn(heavyTask, receivePort.sendPort);

  // Listening for messages from the spawned isolate.
  receivePort.listen((message) {
    print('Received: $message'); // Printing the result sent by the heavyTask function.
    receivePort.close(); // Closing the ReceivePort to free resources after receiving the message.
  });

  print('End (Main Isolate is free)');

  ReceivePort receivePort1 = ReceivePort();

  // Spawning an isolate and passing an argument
  await Isolate.spawn(taskWithArg, ['Hello, Dart!', receivePort1.sendPort]);

  receivePort1.listen((message) {
    print('Message from isolate: $message');
    receivePort1.close();
  });

  /** ISOLATE.RUN  (USE FOR)
   * 	One-time computations	
   * Lower (automatically disposed)
   * No explicit message passing
   * Simpler (async/await)
   * Parsing JSON, heavy calculations
   */

   print('Start');

  // Running a heavy task in a separate isolate
  int result = await Isolate.run(() => heavyTaskV1(1000000000));

  print('Result: $result');
  print('End (UI remains responsive)');

  /** Sending closures with isolates */
  print('Reading JSON in background...');

  // Read and parse JSON in a separate isolate
  final Map<String, dynamic> jsonData = await Isolate.run(() async {
    final fileData = await File(filename).readAsString(); // Read file
    return jsonDecode(fileData) as Map<String, dynamic>; // Parse JSON
  });

  // Use the data after parsing is complete
  print('✅ JSON Loaded! Number of keys: ${jsonData.length}');
}

// Function that runs in a separate isolate
void heavyTask(SendPort sendPort) {
  int sum = 0;

  // Performing a CPU-intensive task (summing a large number range)
  for (int i = 0; i < 1000000000; i++) {
    sum += i;
  }

  // Sending the result back to the main isolate using the SendPort
  sendPort.send('Task Completed with sum: $sum');
}

// Entry point that accepts an argument
void taskWithArg(List args) {
  String message = args[0];
  SendPort sendPort = args[1];

  sendPort.send('$message - Processed in isolate');
}

// Function that performs a heavy computation
int heavyTaskV1(int limit) {
  int sum = 0;
  for (int i = 0; i < limit; i++) {
    sum += i;
  }
  return sum;
}
