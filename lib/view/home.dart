import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/bloc/home/home_bloc.dart';
import 'package:movies/component/refresh_listView.dart';
import 'package:movies/model/popular_person_model.dart';
import 'package:shared_preferences/shared_preferences.dart';





class Home extends StatelessWidget{

 late HomeBloc bloc;
 late SharedPreferences prefs;
 int page =1;

  @override
  Widget build(BuildContext context) {

    bloc =  BlocProvider.of<HomeBloc>(context);
    bloc.add(FetchPersons(page));

    return Scaffold(
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 20,),
          BlocBuilder<HomeBloc,HomeState>(builder: (context, state) {
            if(state is FetchedPersonsState){
              return Refresh_ListView(bloc);
            }else if(state is FailedPersonsState && bloc.popular_persons_info.isNotEmpty){
                  return Refresh_ListView(bloc);
            }else
              return Center(child: Text('no internet connection'),);
          }),


          BlocListener<HomeBloc,HomeState>(listener: (context, state) async {
            if(state is FetchedPersonsState){
              prefs = await SharedPreferences.getInstance();
              List<String> data =[];
              bloc.popular_persons_info.forEach((element) {
               data.add(json.encode(element.toJson()));
              });
              await prefs.setStringList('data', data);
            }else if(state is FailedPersonsState){
              prefs = await SharedPreferences.getInstance();
              List<String> result = await prefs.getStringList('data')!;
              result.forEach((element) {
                bloc.popular_persons_info.add(Results.fromJson(json.decode(element)));
              });
            }
          },
          child: Container(),
          ),
        ],
      ),
    );
  }

}
