import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/bloc/home/home_bloc.dart';
import 'package:movies/component/refresh_listView.dart';





class Home extends StatelessWidget{

 late HomeBloc bloc;
 int page =1;

  @override
  Widget build(BuildContext context) {

    bloc =  BlocProvider.of<HomeBloc>(context);
    bloc.add(FetchPersons(page));

    return Scaffold(
      body:Column(
        children: [
          SizedBox(height: 20,),
          BlocBuilder<HomeBloc,HomeState>(builder: (context, state){
            if(state is FetchedPersonsState){
              return Refresh_ListView(bloc);
            }else
              return Container();
          }),
        ],
      ),
    );
  }

}