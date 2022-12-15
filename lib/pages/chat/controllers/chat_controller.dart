import 'package:flutter/cupertino.dart';
import 'package:lesson_flutter_websocket/configuration/user_config.dart';
import 'package:lesson_flutter_websocket/entities/message_entity.dart';
import 'package:lesson_flutter_websocket/services/message_service.dart';
import 'package:mobx/mobx.dart';

part 'chat_controller.g.dart';

class ChatController = ChatControllerBase with _$ChatController;

abstract class ChatControllerBase with Store {
  MessageService messageService = MessageService();

  TextEditingController textCont = TextEditingController();
  TextEditingController serverTextCont = TextEditingController();

  @observable
  ObservableList<Message> messages = ObservableList<Message>();

  @action
  void sendMessage(String text) {
    final message = Message(
      name: textCont.text,
      text: text,
    );
    messages.add(message);
    messageService.sendMessage(message);
  }

  void init() {
    messageService.initConnection(stringServer: serverTextCont.text);
    messageService.broadcastNotifications(
      onReceive: (message) {
        if (message.name != textCont.text) {
          messages.add(message);
        }
      },
    );
  }
}
