import 'dart:convert';
import 'package:web_socket_channel/web_socket_channel.dart';
import '../models/message_model.dart';

class SocketService {
  final WebSocketChannel _channel;

  SocketService(String url) : _channel = WebSocketChannel.connect(Uri.parse(url));

  // Stream of incoming messages
  Stream<MessageModel> get messagesStream =>
      _channel.stream.map((message) {
        final decoded = json.decode(message);
        return MessageModel.fromJson(decoded);
      });

  // Send a message
  void sendMessage(MessageModel message) {
    final jsonMessage = json.encode(message.toJson());
    _channel.sink.add(jsonMessage);
  }

  // Close the connection
  void close() {
    _channel.sink.close();
  }
}
