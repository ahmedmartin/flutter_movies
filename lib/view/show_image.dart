import 'package:flutter/material.dart';



class Show_image extends StatelessWidget{

  String img_url;
  Show_image(this.img_url);

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: Column(
       mainAxisAlignment: MainAxisAlignment.center ,
       children: [
         Image.network(img_url),
       ],
     ),
   );
  }


}