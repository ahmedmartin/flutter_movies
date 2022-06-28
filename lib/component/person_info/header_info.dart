import 'package:flutter/material.dart';
import 'package:movies/model/person_info_model.dart';



class Header_info extends StatelessWidget{

  Person_info_model model;
  Header_info(this.model);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 350,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(top: 100,left: 10,right: 10,bottom: 10),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(60)
              ),
              child: _box_info(model)
            ),
          ),
          Align(
              alignment: Alignment.topCenter,
              child: CircleAvatar(backgroundImage: NetworkImage(model.profilePath!),radius: 100,)),
        ],
      ),
    );
  }
}

class _box_info extends StatelessWidget{

  Person_info_model model;
  _box_info(this.model);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(model.name!,style: TextStyle(
            color: Colors.white,fontWeight: FontWeight.bold,fontSize: 35
        ),),
        SizedBox(height: 30,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            info_row(Icons.transgender, model.gender ==1?'fmale':'male'),
            info_row(Icons.star_rate, model.popularity!.toInt().toString()),
          ],
        ),
        SizedBox(height: 20,),
        info_row(Icons.person_pin_circle, model.placeOfBirth!),

        SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            info_row(Icons.cake, model.birthday!),
            info_row(Icons.account_tree_rounded, model.knownForDepartment!),
          ],
        ),

        // SizedBox(height: 20,),
        // Text(model.biography!,style: TextStyle(
        //     color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16
        // ),),

      ],
    );
  }

  Widget info_row(IconData icon,String text){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon,color: Colors.white,size: 30,),
        SizedBox(width: 20,),
        Text(text,style: TextStyle(
            color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20
        ),),
      ],
    );
  }

}