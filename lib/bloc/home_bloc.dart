import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../model/popular_person_model.dart';
import '../repository/person_repository.dart';

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
      popular_persons_info = await Person_repo().get_popular_persons(event.page);
      emit(FetchedPersonsState());
    } catch (e) {
      emit(FailedPersonsState(e.toString()));
    }

  }
}
