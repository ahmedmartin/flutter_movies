import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/bloc/home_bloc.dart';
import 'package:movies/component/refresh_listView.dart';





class Home extends StatelessWidget{

 late HomeBloc bloc;

  @override
  Widget build(BuildContext context) {

    bloc =  BlocProvider.of<HomeBloc>(context);
    bloc.add(FetchPersons(1));

    return Scaffold(
      body:
      BlocBuilder<HomeBloc,HomeState>(builder: (context, state){
        if(state is FetchedPersonsState){
          return Refresh_ListView(bloc.popular_persons_info,bloc);
        }else
          return Container();
      }),
    );
  }

}