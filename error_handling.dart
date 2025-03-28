void checkAge(int age) {
  if (age < 18) {
    throw AgeException('Age must be 18 or older.');
  }
}

void functionThatThrows() {
  try {
    throw Exception('Initial error');
  } catch (e) {
    print('Logging the error: $e');
    rethrow; // Allows other parts of the code to handle the error
  }
}

class AgeException implements Exception {
  final String message; // Stores the error message

  AgeException(this.message); // Constructor to set the message

  @override
  // method is overridden to provide a readable error description
  String toString() => 'AgeException: $message'; // Custom error message

}



void main() {
  // checkAge(16); // This will throw an exception

  /**  Catching Exceptions (try-catch) */
  try {
    checkAge(16);
  } catch (e) {
    print('Caught an exception: $e');
  }

  /** Using on for Specific Exceptions  */
  try {
    throw FormatException('Invalid format!');
  } on FormatException {
    print('A format exception occurred.');
  } catch (e) {
    print('Some other exception: $e');
  }

  /** Getting Stack Trace */
  try {
    throw Exception('Something went wrong!');
  } catch (e, s) {
    print('Exception: $e');
    print('Stack Trace: $s');
  }

  /**  Rethrowing an Exception */
  try {
    functionThatThrows();
  } catch (e) {
    print('Handled in main: $e');
  }

  /** The finally Block */
  try {
    throw Exception('Something bad happened!');
  } catch (e) {
    print('Caught: $e');
  } finally {
    print('Cleaning up resources...');
  }

  /** Using assert for Debugging */
  int age = 15;
  assert(age >= 18, 'Age must be at least 18.');
  print('This line will not execute if assert fails.');

}
