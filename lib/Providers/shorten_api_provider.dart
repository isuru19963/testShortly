import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/shortenlink_model.dart';

class ApiProvider {
  final Dio _dio = Dio();
  final String _url = 'https://api.shrtco.de/v2/shorten?url=';

  Future<ShortenLinkModel> fetchDataList(url) async {
    try {
      Response response = await _dio.get(_url+url);
      print("Exception occured: ");
      print(response.data);
      return ShortenLinkModel.fromJson(response.data['result']);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return ShortenLinkModel.withError("Data not found / Connection issue");
    }
  }

}