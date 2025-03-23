  Future<void> fetchData() async {
    try {
      await Future.delayed(Duration(seconds: 2));
      throw Exception('Failed to fetch data'); // Simulating error
    } catch (e) {
      print('Error: $e');
    } finally {
      print('Cleanup: Closing connection...');
    }
  }
