part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}


class LoadingPersonsState extends HomeState{}

class FetchedPersonsState extends HomeState{}

class FailedPersonsState extends HomeState{
  String error;
  FailedPersonsState(this.error);
}
