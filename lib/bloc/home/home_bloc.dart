import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../model/popular_person_model.dart';
import '../../repository/person_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {

  List<Results> popular_persons_info=[];


  HomeBloc() : super(HomeInitial()) {
    on<FetchPersons>(_onPersonsEvent);
  }

  _onPersonsEvent(FetchPersons event, Emitter<HomeState> emit) async {
    emit(LoadingPersonsState());
    try {
      print(event.page);
      popular_persons_info = await Person_repo().get_popular_persons(event.page);
      print(popular_persons_info.length);
      emit(FetchedPersonsState());
    } catch (e) {
      print(e.toString());
      emit(FailedPersonsState(e.toString()));
    }

  }
  get_popular_persons(int page) async {
    print(page);
    if(page<=500)   //number of pages only 500
      popular_persons_info.addAll(await Person_repo().get_popular_persons(page));
  }
}


