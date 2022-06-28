import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies/model/person_info_model.dart';
import 'package:movies/repository/person_repository.dart';

part 'person_info_event.dart';
part 'person_info_state.dart';

class PersonInfoBloc extends Bloc<PersonInfoEvent, PersonInfoState> {

  Person_info_model person_model=Person_info_model();

  PersonInfoBloc() : super(PersonInfoInitial()) {
    on<FetchPersonInfo>(_onPersonInfoEvent);
  }

  _onPersonInfoEvent(FetchPersonInfo event, Emitter<PersonInfoState> emit) async {
    emit(LoadingPersonState());
    try {
      person_model = await Person_repo().get_popular_person_info(event.person_id);
      emit(FetchedPersonState());
    } catch (e) {
      emit(FailedPersonState(e.toString()));
    }

  }
}
