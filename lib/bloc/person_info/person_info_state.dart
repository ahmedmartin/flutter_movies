part of 'person_info_bloc.dart';

@immutable
abstract class PersonInfoState {}

class PersonInfoInitial extends PersonInfoState {}



class LoadingPersonState extends PersonInfoState{}

class FetchedPersonState extends PersonInfoState{}

class FailedPersonState extends PersonInfoState{
  String error;
  FailedPersonState(this.error);
}