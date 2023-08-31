import 'package:flutter/foundation.dart';

import 'model/message_model.dart';

class ChatController extends ChangeNotifier {
  final List<Message> _messages = [];

  List<Message> get messages => _messages.reversed.toList();

  addNewMessage(Message message) {
    _messages.add(message);
    notifyListeners();
  }
}