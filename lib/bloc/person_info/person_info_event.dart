part of 'person_info_bloc.dart';

@immutable
abstract class PersonInfoEvent {}


class FetchPersonInfo extends PersonInfoEvent{
  int person_id;
  FetchPersonInfo(this.person_id);
}
