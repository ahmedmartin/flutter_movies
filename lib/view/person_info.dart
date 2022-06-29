import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/bloc/person_info/person_info_bloc.dart';
import 'package:movies/component/person_info/header_info.dart';
import 'package:movies/component/person_info/image_gridview.dart';





class Person_info extends StatelessWidget{

  int person_id;
  late PersonInfoBloc bloc;
  Person_info(this.person_id);



  @override
  Widget build(BuildContext context) {

    bloc = BlocProvider.of<PersonInfoBloc>(context);
    bloc.add(FetchPersonInfo(person_id));

    return Scaffold(
      body: BlocBuilder<PersonInfoBloc,PersonInfoState>(builder: (context, state){
        if(state is LoadingPersonState) {
          return Center(child: CircularProgressIndicator());
        }else if(state is FetchedPersonState){
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  Header_info(bloc.person_model),
                  // SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Text(bloc.person_model.biography!, style: TextStyle(
                        color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16
                    ),),
                  ),
                  //SizedBox(height: 20,),
                  Images_grideview(bloc.person_model.images!.profiles!)
                ],
              ),
            ),
          );
        }else
          return Center(child: Text('no internet connection'),);
      })
    );
  }

}