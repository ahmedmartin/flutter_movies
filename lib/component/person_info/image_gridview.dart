import 'package:flutter/material.dart';
import 'package:movies/model/person_info_model.dart';
import 'package:movies/view/show_image.dart';





class Images_grideview extends StatelessWidget{

  List<Profiles> images_profile ;

  Images_grideview(this.images_profile);

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 500,
      child: GridView.builder(
          itemCount:images_profile.length ,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: .45,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context,index){
            return GestureDetector(
              child: Align(
                  alignment: Alignment.topCenter,
                  child: Image.network(images_profile[index].filePath!,)),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                    builder:(context)=>Show_image(images_profile[index].filePath!)));
              },
            );
          })
    );
  }
}