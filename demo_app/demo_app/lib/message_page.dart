import 'package:flutter/material.dart';
import 'api_service.dart';

class MessagePage extends StatelessWidget {
  final String username;
  MessagePage({super.key, required this.username});

  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Welcome $username')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: messageController,
              decoration: const InputDecoration(
                labelText: 'Enter message',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('Save Message'),
              onPressed: () async {
                if (messageController.text.isNotEmpty) {
                  await ApiService.saveMessage(
                    username,
                    messageController.text,
                  );
                  messageController.clear();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Message stored')),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
