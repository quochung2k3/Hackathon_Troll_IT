import 'package:flutter/material.dart';
import 'package:hackathon_troll_it/widgets/body.dart';

class messagePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    String imageUrl = "https://cdn.pixabay.com/photo/2016/08/20/05/38/avatar-1606916_960_720.png";
    return Scaffold(
      body: Body(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue,
        title: Row(
          children: [
            BackButton(),
            CircleAvatar(
              backgroundImage: NetworkImage(imageUrl),
            ),
            const Padding(
                padding: EdgeInsets.only(left: 8.0)
            ),
            const Column(
              children: [
                Text(
                    "John Nguyen",
                     style: TextStyle(fontSize: 16),
                ),
                Text(
                  "Active 3h ago",
                  style: TextStyle(fontSize: 12),
                )
              ],
            )
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.local_phone,
              color: Colors.grey,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.video_call,
              color: Colors.grey,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
