// Interface (acts as a contract for all notification types)
abstract class Notifiable {
  void sendNotification(String message);
}

// SMS Notification Implementation
class SMSNotification implements Notifiable {
  @override
  void sendNotification(String message) {
    print('Sending SMS: $message');
  }
}

// Email Notification Implementation
class EmailNotification implements Notifiable {
  @override
  void sendNotification(String message) {
    print('Sending Email: $message');
  }
}

// Push Notification Implementation
class PushNotification implements Notifiable {
  @override
  void sendNotification(String message) {
    print('Sending Push Notification: $message');
  }
}