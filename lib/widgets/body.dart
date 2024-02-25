import 'package:hackathon_troll_it/widgets/constants.dart';
import 'package:hackathon_troll_it/models/ChatMessage.dart';
import 'package:flutter/material.dart';
import 'package:hackathon_troll_it/widgets/chat_input_field.dart';
import 'package:hackathon_troll_it/widgets/message_screen.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: ListView.builder(
              itemCount: demeChatMessages.length,
              itemBuilder: (context, index) =>
                  MessageScreen(message: demeChatMessages[index]),
            ),
          ),
        ),
        const ChatInputField(),
      ],
    );
  }
}