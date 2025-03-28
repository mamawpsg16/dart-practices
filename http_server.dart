import 'dart:io';

void main() async {
  final server = await HttpServer.bind('localhost', 2222);
  print("🚀 Server running on http://localhost:2222");

  await for (HttpRequest request in server) {
    handleRequest(request);
  }
}

void handleRequest(HttpRequest request) {
  print("📩 Received request for ${request.uri.path}");

  final response = request.response;

  switch (request.uri.path) {
    case '/':
      response
        ..headers.contentType = ContentType.text
        ..write("Welcome to the Dart Server!");
      break;
    case '/dart':
      response
        ..headers.contentType = ContentType.text
        ..write("Hello from the Dart server!");
      break;
    default:
      response
        ..statusCode = HttpStatus.notFound
        ..write("404: Not Found");
  }

  response.close();
}
