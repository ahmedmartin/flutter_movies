





import 'package:dio/dio.dart';
import 'package:movies/model/person_info_model.dart';
import 'package:movies/model/popular_person_model.dart';

class Person_repo {


  Future<List<Results>> get_popular_persons (int page) async {
    String api_key = 'f8d950c0bee1561b2f544983d89e5fc5';
    final response = await Dio().get('https://api.themoviedb.org/3/person/popular?api_key=$api_key&language=en-US&page=$page');

    if(response.statusCode==200)
      return Popular_person_model.fromJson(response.data).results!;

    else
      return [];

  }


  Future<Person_info_model> get_popular_person_info (int person_id) async {
    String api_key = 'f8d950c0bee1561b2f544983d89e5fc5';
    final response = await Dio().get('https://api.themoviedb.org/3/person/$person_id?api_key=$api_key&language=en-US&append_to_response=images');

    if(response.statusCode==200)
      return Person_info_model.fromJson(response.data);

    else
      return Person_info_model();

  }

}