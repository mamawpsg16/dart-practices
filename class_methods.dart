import 'dart:math';

// Abstract class representing a general bank account
abstract class BankAccount {
  String accountHolder;
  double _balance;

  BankAccount(this.accountHolder, this._balance);

  // Abstract method: Must be implemented by subclasses
  void deposit(double amount);

  void withdraw(double amount);

  // Getter for balance (read-only)
  double get balance => _balance;

  // Setter for balance (to modify the private variable)
  set balance(double amount) {
    if (amount >= 0) {
      _balance = amount;
    } else {
      print("Balance cannot be negative.");
    }
  }
}

// Concrete class: Savings Account
class SavingsAccount extends BankAccount {
  final double interestRate; // Interest rate in percentage

  SavingsAccount(super.accountHolder, super._balance, this.interestRate);

  @override
  void deposit(double amount) {
    if (amount > 0) {
      balance += amount;
      print("$accountHolder deposited \$$amount. New Balance: \$$balance");
    } else {
      print("Deposit amount must be greater than zero.");
    }
  }

  @override
  void withdraw(double amount) {
    if (amount > 0 && amount <= balance) {
      balance -= amount;
      print("$accountHolder withdrew \$$amount. Remaining Balance: \$$balance");
    } else {
      print("Invalid withdrawal amount.");
    }
  }

  // Method to calculate interest
  double calculateInterest() {
    return balance * (interestRate / 100);
  }
}

// Class representing a Wallet that supports adding and subtracting money
class Wallet {
  double balance;

  Wallet(this.balance);

  // Overloading the + operator to add money to the wallet
  Wallet operator +(double amount) {
    return Wallet(balance + amount);
  }

  // Overloading the - operator to spend money from the wallet
  Wallet operator -(double amount) {
    return Wallet(balance - amount);
  }

  @override
  String toString() => "Wallet Balance: \$$balance";
}

// Main function to demonstrate the system
void main() {
  // Creating a savings account
  var account = SavingsAccount("Alice", 1000, 5);
  account.deposit(500); // Alice deposits $500
  account.withdraw(300); // Alice withdraws $300
  print("Interest Earned: \$${account.calculateInterest()}"); // Calculating interest

  print("\n----- Wallet Operations -----");

  // Creating a Wallet instance
  var myWallet = Wallet(50);
  print(myWallet);

  // Using operator overloading to add money
  myWallet = myWallet + 20;
  print(myWallet);

  // Using operator overloading to subtract money
  myWallet = myWallet - 30;
  print(myWallet);
}
