import 'package:flutter/material.dart';
import 'package:lesson_flutter_websocket/pages/chat/chat_page.dart';
import 'package:lesson_flutter_websocket/pages/chat/splash_screen.dart';

void main() {
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
        routes: {
          '/splash': (_) => const SplashPage(),
          '/main' :(_) => const  ChatPage()
         },
      
       
    );
  }
}
