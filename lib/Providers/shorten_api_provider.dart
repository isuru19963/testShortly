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
  Future functionShorten(link)async{




    try {
      // final Future<ShortenLinkModel> dataList= fetchDataList(shortenLink.text);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? musicsStrings = await prefs.getString('musics_key');
      final List<ShortenLinkModel> musics;
      musics = ShortenLinkModel.decode(musicsStrings!);
      // Encode and store data in SharedPreferences
      musics.add(ShortenLinkModel(id:'dataList',url:'google.com',shortenUrl: 'gevhwefjg' ));
      final String encodedData = json.encode([ShortenLinkModel(id:'dataList',url:'google.com',shortenUrl: 'gevhwefjg' )]

        // musics
        //     .map<Map<String, dynamic>>((link) => ShortenLinkModel.toMap(link))
        //     .toList(),
      );

      await prefs.setString('musics_key', encodedData);

      // Fetch and decode data
      final String? musicsString = await prefs.getString('musics_key');

      final List<ShortenLinkModel> musicss = ShortenLinkModel.decode(musicsString!);
      print(musicsString);
      return 'success';
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return ShortenLinkModel.withError("Data not found / Connection issue");
    }



  }
}