import 'package:hackathon_troll_it/models/ChatMessage.dart';
import 'package:flutter/material.dart';
import 'package:hackathon_troll_it/widgets/constants.dart';
import 'package:hackathon_troll_it/widgets/text_message.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({
    Key? key,
    required this.message,
  }) : super(key: key);

  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    String imageUrl = "https://cdn.pixabay.com/photo/2016/08/20/05/36/avatar-1606914_1280.png";
    return Padding(
      padding: const EdgeInsets.only(top: kDefaultPadding),
      child: Row(
        mainAxisAlignment:
        message.isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!message.isSender) ...[
            CircleAvatar(
              radius: 12,
              backgroundImage: NetworkImage(imageUrl),
            ),
            const SizedBox(width: kDefaultPadding / 2),
          ],
          TextMessage(message: message),
        ],
      ),
    );
  }
}

