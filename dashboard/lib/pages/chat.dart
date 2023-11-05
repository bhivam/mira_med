import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final TextEditingController _controller = TextEditingController();
  final List<Message> _messages = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Align(
                    alignment: _messages[index].isUser
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color:
                            _messages[index].isUser ? Colors.blue : Colors.grey,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        _messages[index].content,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5.0,
                    offset: Offset(0, 3),
                    color: Colors.black12,
                  ),
                ],
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.emoji_emotions_outlined,
                        color: Colors.grey),
                    onPressed: () {
                      // TODO: Implement emoji picker or relevant function
                    },
                  ),
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText: 'Type a message...',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 8.0),
                    height: 50,
                    width: 50,
                    child: FittedBox(
                      child: FloatingActionButton(
                        backgroundColor: Colors.white,
                        foregroundColor:
                            Colors.blue, // or any color you want for the icon
                        onPressed: _sendQuestion,
                        child: const Icon(Icons.send_rounded, size: 25),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _sendQuestion() {
    final question = _controller.text;
    if (question.trim().isEmpty) return;

    setState(() {
      _messages.add(Message(content: question, isUser: true));
    });

    final reply = _getReply(question);

    setState(() {
      _messages.add(Message(content: reply, isUser: false));
    });

    _controller.clear();
  }

  String _getReply(String question) {
    if (question.contains('cerebral palsy')) {
      return "Cerebral palsy is a group of disorders that affect a person's ability to move and maintain balance and posture.";
    } else if (question.contains('symptoms')) {
      return "Common symptoms include poor coordination, stiff muscles, weak muscles, and tremors. Some people may have problems with speech or vision.";
    } else if (question.contains('treatment')) {
      return "Treatment may include physical therapy, braces, or surgery. Medications can also help manage symptoms.";
    } else {
      return "I'm not sure about that. Can you specify?";
    }
  }
}

class Message {
  final String content;
  final bool isUser;

  Message({required this.content, required this.isUser});
}
