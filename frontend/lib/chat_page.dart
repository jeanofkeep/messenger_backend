import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  final String chatName;
  const ChatPage({super.key, required this.chatName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(chatName),
        backgroundColor: const Color.fromARGB(113, 230, 17, 17),
      ),
      body: Column(
        children: [
          // Поле для отображения сообщений (можно заменить на список)
          Expanded(
            child: Container(
              color: const Color.fromARGB(255, 41, 51, 78), // Фон чата
              child: const Center(child: Text('Сообщения появятся здесь')),
            ),
          ),
          // Поле ввода и кнопка отправки
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Введите сообщение',
                      labelStyle: const TextStyle(color: Colors.white70),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: Colors.white),
                      ),
                    ),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(width: 8), // Расстояние между полем и кнопкой
                ElevatedButton(
                  onPressed: () {
                    // Логика отправки сообщения
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(113, 230, 17, 17),
                  ),
                  child: const Icon(Icons.send, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 41, 51, 78),
    );
  }
}
