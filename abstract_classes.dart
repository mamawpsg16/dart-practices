// Abstract class with a shared implementation
abstract class Payment {
  String _name = 'Payment';
  void processPayment(double amount); // Subclasses MUST implement this method

  void printReceipt(double amount) {
    print('Receipt: Payment of \$$amount processed.');
  }

  Payment(){
    print("$_name");
  }
}

// Subclass: Implements processPayment() differently for CreditCard
class CreditCardPayment extends Payment {
  @override
  void processPayment(double amount) {
    print('Processing credit card payment of \$$amount...');
    printReceipt(amount);
  }
}

// Subclass: Implements processPayment() differently for PayPal
class PayPalPayment extends Payment {
  @override
  void processPayment(double amount) {
    print('Processing PayPal payment of \$$amount...');
    printReceipt(amount);
  }
}