import 'package:flutter/material.dart';
import 'package:hackathon_troll_it/widgets/newpost.dart';
import 'package:hackathon_troll_it/widgets/post.dart';
import 'package:hackathon_troll_it/widgets/story.dart';

class PostPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          NewPost(),
          Story(),
          Post(),
        ],
      ),
      appBar: AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      actions: [
        Container(
          //width: double.infinity,
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Text("StayHealthy",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700, color: Colors.blue),
                ),
              ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(50)
                    ),
                    child: const Icon(
                        Icons.search,
                        color: Colors.black87),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(50)
                    ),
                    child: const Icon(
                        Icons.message,
                        color: Colors.black87),
                  )
                ],
              )
            ],
          ),
        )
      ],
      ),
    );
  }
}