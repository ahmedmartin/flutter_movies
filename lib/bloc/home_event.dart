part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}


class FetchPersons extends HomeEvent{
  int page;
  FetchPersons(this.page);
}
