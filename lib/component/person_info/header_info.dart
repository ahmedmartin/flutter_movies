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
              padding: EdgeInsets.only(top: 80,left: 20,right: 20,bottom: 10),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(50)
              ),
              child: _box_info(model)
            ),
          ),
          Align(
              alignment: Alignment.topCenter,
              child: CircleAvatar(backgroundImage: NetworkImage(model.profilePath!),radius: 90,)),
        ],
      ),
    );
  }
}

class _box_info extends StatelessWidget{

  Person_info_model model;
  late BuildContext Context;
  _box_info(this.model);

  @override
  Widget build(BuildContext context) {

    Context = context;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(model.name!,style: TextStyle(
            color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30
        ),textAlign: TextAlign.center,),
        SizedBox(height: 30,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            info_row(Icons.transgender, model.gender ==1?'fmale':'male'),
            info_row(Icons.star_rate, model.popularity!.toInt().toString()),
          ],
        ),
        SizedBox(height: 15,),
        if(model.placeOfBirth != null)
          ListTile(
            title: Text(model.placeOfBirth!, //overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20
              ),),
            leading: Icon(
              Icons.person_pin_circle, color: Colors.white, size: 30,),
          ),


        SizedBox(height: 15,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            info_row(Icons.cake, model.birthday!),
            info_row(Icons.account_tree_rounded, model.knownForDepartment!),
          ],
        ),

      ],
    );
  }

  Widget info_row(IconData icon,String text){

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon,color: Colors.white,size: 30,),
        SizedBox(width: 10,),
        Text(text,overflow: TextOverflow.ellipsis,style: TextStyle(
            color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20
        ),),
      ],
    );
  }

}