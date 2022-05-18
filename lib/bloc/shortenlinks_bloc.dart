import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Repositary/shorten_api_repositary.dart';
import '../models/shortenlink_model.dart';

part 'shortenlinks_event.dart';
part 'shortenlinks_state.dart';

class ShortenlinksBloc extends Bloc<ShortenlinksEvent, ShortenlinksState> {
  late List myList;
  int initLoadCount = 100;
  int loadMoreCount = 0;
  int loadedLastIndex = 0;

  ShortenlinksBloc() : super(ShortenlinksInitial());




  @override
  Stream<ShortenlinksState> mapEventToState(ShortenlinksEvent event) async* {
    if (event is GetShortenLinkList) {

      yield DataLoading();
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? shortenList = prefs.getString('shortenList');

      final List<ShortenLinkModel> linkHistory = ShortenLinkModel.decode(shortenList!);

      myList = linkHistory;
      // loadMoreCount = initLoadCount;
      yield DataLoaded(myList.reversed.toList());
    }
    if (event is GetShortenLinkListRemove) {

      yield DataLoading();
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? shortenList = prefs.getString('shortenList');

      final List<ShortenLinkModel> linkHistory = ShortenLinkModel.decode(shortenList!);


      // loadMoreCount = initLoadCount;
      linkHistory.removeWhere((item) => item.id == '001');
      myList = linkHistory;

      // Encode and store data in SharedPreferences

      final String encodedData = json.encode(
        linkHistory
            .map<Map<String, dynamic>>((link) => ShortenLinkModel.toMap(link))
            .toList(),
      );

      await prefs.setString('shortenList', encodedData);

      yield DataLoaded(myList.reversed.toList());
    }
    if (event is GetShortenLinkListMore) {
      loadedLastIndex += loadMoreCount;
      myList += List.generate(
          loadMoreCount, (i) => "Item : ${loadedLastIndex + i + 1}");

      yield DataLoaded(myList);
    }
  }
}
