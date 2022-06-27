import 'package:flutter/material.dart';
import 'package:movies/bloc/home_bloc.dart';
import 'package:movies/component/refresh_listView.dart';
import 'package:bloc/bloc.dart';





class Home extends StatelessWidget{

 late HomeBloc bloc;

  @override
  Widget build(BuildContext context) {

    bloc =  BlocProvider.of<HomeBloc>(context);

    return Scaffold(
      body:
      BlocBuilder<MacroCalculatorBloc,MacroCalculatorState>(builder: (context, state){
        if(state is LoadingMacrostate){
          return CircularProgressIndicator(color: const Color.fromARGB(255,3,118,77),);
        }else if(state is FetchedMacroState){
          return _List_view(bloc);
        }else
          return Container();
      }),
      Refresh_ListView(),
    );
  }

}