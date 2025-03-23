// Dart Wildcard Variable (_) Use Cases - Real-World Examples

// 1. Ignoring local variables (e.g., when you only care about execution, not result)
void main() {
  var _ = expensiveComputation(); // The result is ignored
  print("Computation executed, but result is unused.");
}

dynamic expensiveComputation() {
  print("Performing a heavy computation...");
  return 42;
}

// 2. Ignoring loop variables (e.g., when iterating a fixed number of times)
void repeatAction(int times) {
  for (var _ in List.filled(times, null)) {
    print("Repeated action");
  }
}

// 3. Ignoring exceptions (e.g., when logging but not handling specifics)
void safeOperation() {
  try {
    throw Exception("Something went wrong");
  } catch (_) {
    print("Error occurred, but we don't need details.");
  }
}

// 4. Using _ in generic classes and functions (e.g., ignoring a generic type)
class Response<T, _> { // The second type parameter is ignored
  final T data;
  Response(this.data);
}

void processResponse(Response<String, int> response) {
  print("Processing response: ${response.data}");
}

// 5. Using _ in callbacks (e.g., when only the second argument matters)
void handleUserEvents(Function(int, String) callback) {
  callback(1, "User logged in");
  callback(2, "User logged out");
}

 