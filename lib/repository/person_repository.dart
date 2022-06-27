





import 'package:dio/dio.dart';
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


}