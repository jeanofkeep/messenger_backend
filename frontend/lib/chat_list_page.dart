import 'package:flutter/material.dart';
import 'chat_page.dart';

class ChatListPage extends StatelessWidget {
  const ChatListPage({Key? key, required this.name}) : super(key: key);
  final String name;

  // В будущем заменишь на реальные данные с бэкенда
  final List<Map<String, String>> chats = const [
    {
      'name': 'Alice',
      'lastMessage': 'Привет! Как дела?',
      'time': '10:30',
      'avatar': 'https://i.pravatar.cc/150?img=1'
    },
    {
      'name': 'Bob',
      'lastMessage': 'message.',
      'time': '09:15',
      'avatar': 'https://i.pravatar.cc/150?img=2'
    },
    {
      'name': 'Charlie',
      'lastMessage': 'Отправил документы.',
      'time': 'Вчера',
      'avatar': 'https://i.pravatar.cc/150?img=3'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 41, 51, 78),
      appBar: AppBar(
        title: const Text("Чаты"),
        backgroundColor: Color.fromARGB(113, 230, 17, 17),
      ),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) {
          final chat = chats[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(chat['avatar']!),
            ),
            title: Text(
              chat['name']!,
              style: const TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              chat['lastMessage']!,
              style: const TextStyle(color: Colors.grey),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: Text(
              chat['time']!,
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ChatPage(chatName: chat['name']!),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

// Экран конкретного чата

/*

import 'package:flutter/material.dart';
const Color(0xFF1E1E1E)
class ChatListPage extends StatelessWidget {
  final String name;
  final String userName;
  final String chatTitle;

  ChatListPage(
      {Key? key,
      required this.name,
      required this.chatTitle,
      required this.userName})
      : super(key: key);

  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(chatTitle),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Действие для настройки
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(8.0),
              children: [
                // Пример сообщений
                _buildMessageBubble("Привет!", userName, true),
                _buildMessageBubble("Как дела?", "Другой пользователь", false),
                _buildMessageBubble("Все хорошо, спасибо!", userName, true),
                // Добавьте больше сообщений по мере необходимости
              ],
            ),
          ),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildMessageBubble(String message, String sender, bool isMe) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4.0),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: isMe ? Colors.blueAccent : Colors.grey[300],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment:
              isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Text(
              sender,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isMe ? Colors.white : Colors.black),
            ),
            SizedBox(height: 5),
            Text(
              message,
              style: TextStyle(color: isMe ? Colors.white : Colors.black),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageInput() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _messageController,
              decoration: InputDecoration(
                hintText: "Введите сообщение...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              // Логика отправки сообщения
              String message = _messageController.text.trim();
              if (message.isNotEmpty) {
                // Отправьте сообщение
                _messageController.clear();
              }
            },
          ),
        ],
      ),
    );
  }
}


=================================
import 'package:flutter/material.dart';

class ChatListPage extends StatelessWidget {
  const ChatListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> chats = [
      {
        'name': 'Алексей',
        'message': 'Привет! Как дела?',
        'time': '12:30',
      },
      {
        'name': 'Катя',
        'message': 'Увидимся завтра?',
        'time': '11:10',
      },
      {
        'name': 'Работа',
        'message': 'Нужно внести правки в проект',
        'time': '09:45',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Мои чаты'),
      ),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) {
          final chat = chats[index];
          return ListTile(
            leading: const CircleAvatar(child: Icon(Icons.person)),
            title: Text(chat['name'] ?? ''),
            subtitle: Text(chat['message'] ?? ''),
            trailing: Text(chat['time'] ?? ''),
            onTap: () {
              // TODO: переход в чат
            },
          );
        },
      ),
    );
  }
}
*/