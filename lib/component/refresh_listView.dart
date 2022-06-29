import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/bloc/home/home_bloc.dart';
import 'package:movies/model/popular_person_model.dart';
import 'package:movies/repository/person_repository.dart';
import 'package:movies/view/person_info.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../bloc/person_info/person_info_bloc.dart';


class Refresh_ListView extends StatefulWidget{

  HomeBloc bloc;

  Refresh_ListView(this.bloc);

  @override
  State<StatefulWidget> createState() {
    return _Refresh_ListView( bloc);
  }

}

class _Refresh_ListView extends State<Refresh_ListView>{

  RefreshController _refreshController = RefreshController(initialRefresh: false);
  HomeBloc bloc;
  int page_index =1;



  _Refresh_ListView(this.bloc);


  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height-20,
      child:SmartRefresher(
        controller: _refreshController,
        enablePullDown: false,
        enablePullUp: page_index<=500,
        onLoading:() async {
          setState(()  {
            bloc.get_popular_persons(++page_index);
          });
          _refreshController.loadComplete();
        },


        child: ListView.builder(
            itemCount: bloc.popular_persons_info.length,
            itemBuilder: (context,index){
              return Card(
                  color:Colors.blue ,
                  shadowColor: Colors.black,
                  elevation: 10,
                  margin: EdgeInsets.all(10),
                  shape:RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ) ,
                  child: _list_item(index));
            }),
      ),
    );
  }

  Widget _list_item(int index){
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListTile(
        //contentPadding: EdgeInsets.all(5),
        title: Text(bloc.popular_persons_info[index].name!,style: TextStyle(fontWeight: FontWeight.bold,
            fontSize: 20,color: Colors.white),),
        trailing: CircleAvatar(backgroundImage: NetworkImage(bloc.popular_persons_info[index].profilePath!),
        radius: 30,),
        subtitle: Padding(
          padding: const EdgeInsets.all(5),
          child: Text(bloc.popular_persons_info[index].knownForDepartment!
              ,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
        ),
        onTap:(){
          BlocProvider<PersonInfoBloc>(
            create: (_) => PersonInfoBloc(),
          );
          Navigator.push(context, MaterialPageRoute(
              builder:(context)=>Person_info(bloc.popular_persons_info[index].id!)));
        },
      ),
    );
  }

}


