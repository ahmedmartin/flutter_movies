import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/bloc/home_bloc.dart';
import 'package:movies/model/popular_person_model.dart';
import 'package:movies/repository/person_repository.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';



class Refresh_ListView extends StatelessWidget{

  RefreshController _refreshController = RefreshController(initialRefresh: false);
  List<Results> persons;
  HomeBloc bloc;

  Refresh_ListView(this.persons,this.bloc);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child:SmartRefresher(
        controller: _refreshController,
        onRefresh: () async {
          _refreshController.refreshCompleted();
        },

        physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        child: ListView.builder(
            itemCount: persons.length,
            physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            reverse: true,
            shrinkWrap: true,
            //controller: _scrollController,
            itemBuilder: (context,index){
              return ListTile(
                title: Text(persons[index].name!),
              );
            }),
      ),
    );
  }

}