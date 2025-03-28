import 'dart:async';
import 'dart:math';

Stream<int> numberStream() async* {
  for (int i = 1; i <= 5; i++) {
    await Future.delayed(Duration(seconds: 1)); // Simulating delay
    yield i; // Sending one item at a time
  }
}



class StockMarket {
  // Creating a Stream that emits stock prices every second
  Stream<double> getStockPriceStream(String stockSymbol) async* {
    final random = Random();
    
    double price = 100.0; // Initial stock price

    while (true) {
      await Future.delayed(Duration(seconds: 1)); // Simulating real-time update

      // Generate a random price change (-1.0 to +1.0)
      double change = (random.nextDouble() * 2 - 1); 
      price += change;

      yield double.parse(price.toStringAsFixed(2)); // Emit new price
    }
  }
}

void main() async {
  List<int> numbers = [1, 2, 3, 4, 5];

  // Immediate access
  print(numbers[2]); // Output: 3

  // Iterating synchronously
  for (var num in numbers) {
    print(num); 
  }

  numberStream().listen((num) {
    print(num); // Prints numbers one by one with a delay
  });

  print(' REAL-TIME STOCK PRICE UPDATES ');
  StockMarket market = StockMarket();
  
  // Listening to the real-time stock price updates
  await for (final price in market.getStockPriceStream("AAPL")) {
    print("📈 Apple Stock Price: \$$price"); // Print latest stock price
  }
}
