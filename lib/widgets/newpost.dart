import 'package:flutter/material.dart';

class NewPost extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return Container(
     height: 120,
     width: MediaQuery.of(context).size.width,
     color: Colors.white,
     child: Column(
       children: [
         Row(
           children: [
             Container(child: CircleAvatar(
               backgroundImage: NetworkImage("https://cdn.pixabay.com/photo/2024/01/10/00/14/ai-generated-8498603_1280.jpg"),
             ),
             margin: EdgeInsets.only(left: 10),
             ),
             Container(
               margin: EdgeInsets.only(left: 30),
               width: 250,
               child: TextField(decoration: InputDecoration(hintText: "Ban dang nghi gi?",
                 labelStyle: TextStyle(
                 color: Colors.black,
               ),
                 border: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(100),
                 ),
                 contentPadding: EdgeInsets.symmetric(horizontal: 20),
               ),
               ),
             )
           ],
         ),
         Row(
           mainAxisSize: MainAxisSize.max,
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Container(
               margin: EdgeInsets.only(top: 10),
               alignment: Alignment.center,
               height: 50 ,
               width: MediaQuery.of(context).size.width * 0.33,
               child: Container(
                 width: 100,
                 child: Row(
                   children: [
                     Container(
                       alignment: Alignment.center,
                        width: 30,
                       child: Icon(Icons.post_add, color: Colors.red,),
                     ),
                     Container(
                       alignment: Alignment.center,
                       width: 30,
                       child: Text("Post"),
                     ),
                   ],
                 ),
               ),
             ),
             Container(
               margin: EdgeInsets.only(top: 10),
               alignment: Alignment.center,
               //color: Colors.black,
               height: 50 ,
               width: MediaQuery.of(context).size.width * 0.33,
               child: Container(
                 width: 100,
                 child: Row(
                   children: [
                     Container(
                       alignment: Alignment.center,
                       width: 30,
                       child: Icon(Icons.photo, color: Colors.green,),
                     ),
                     Container(
                       alignment: Alignment.center,
                       child: Text("Photo"),
                     ),
                   ],
                 ),
               ),
             ),
             Container(
               margin: EdgeInsets.only(top: 10),
               alignment: Alignment.center,
               //color: Colors.black,
               height: 50 ,
               width: MediaQuery.of(context).size.width * 0.33,
               child: Container(
                 width: 100,
                 child: Row(
                   children: [
                     Container(
                       alignment: Alignment.center,
                       width: 30,
                       child: Icon(Icons.camera_roll, color: Colors.purpleAccent),
                     ),
                     Container(
                       alignment: Alignment.center,
                       child: Text("Room"),
                     ),
                   ],
                 ),
               ),
             ),
           ],
         )
       ],
     ),
   );
  }
}