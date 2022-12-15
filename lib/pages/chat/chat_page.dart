import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lesson_flutter_websocket/components/input_message.dart';
import 'package:lesson_flutter_websocket/components/list_message.dart';
import 'package:lesson_flutter_websocket/pages/chat/controllers/chat_controller.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  ChatController controller = ChatController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(// <-- STACK AS THE SCAFFOLD PARENT
        children: [
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background.jpg"), // <-- BACKGROUND IMAGE
            fit: BoxFit.cover,
          ),
        ),
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text('Chat WebSocket'),
          systemOverlayStyle: SystemUiOverlayStyle.light,
          backgroundColor: Colors.transparent,
        ),
        body: Column(
          children: [
            Expanded(
              child: ListMessageView(
                messages: controller.messages,
              ),
            ),
            InputMessage(
              onSendMessage: controller.sendMessage,
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              const UserAccountsDrawerHeader(
                accountName: Text("Sistemas Distribuidos"),
                accountEmail: Text("Profª Angelica"),
                currentAccountPicture: CircleAvatar(
                  radius: 30.0,
                  backgroundImage: AssetImage("assets/background.jpg"),
                  backgroundColor: Colors.transparent,
                ),
              ),
              const ListTile(
                title: Text('PUC GOIAS'),
              ),
              ListTile(
                  leading: Icon(Icons.book),
                  title: Text("Alunos"),
                  subtitle: Text("Ver..."),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Alunos'),
                        content: const Text(
                            'Carlos H. \nDouglas S.  \nGabriel. \nWalacy'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'Cancel'),
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'OK'),
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    );
                  }),
              ListTile(
                  leading: Icon(Icons.info),
                  title: Text("Sobre o Flutter"),
                  subtitle: Text("info..."),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Versão'),
                        content: const Text('1.0.0'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'Cancel'),
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'OK'),
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    );
                  }),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextFormField(
                  decoration: const InputDecoration(hintText: "Nome"),
                  controller: controller.textCont,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: TextFormField(
                        decoration:
                            const InputDecoration(hintText: "URL do Servidor"),
                        controller: controller.serverTextCont,
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () => controller.init(),
                      icon: const Icon(Icons.send))
                ],
              )
            ],
          ),
        ),
      )
    ]);
  }
}
