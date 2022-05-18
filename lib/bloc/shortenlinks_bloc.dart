import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../Repositary/shorten_api_repositary.dart';
import '../models/shortenlink_model.dart';

part 'shortenlinks_event.dart';
part 'shortenlinks_state.dart';

class ShortenlinksBloc extends Bloc<ShortenlinksEvent, ShortenlinksState> {
  ShortenlinksBloc() : super(ShortenlinksInitial()) {
    final ApiRepository _apiRepository = ApiRepository();
    on<ShortenlinksEvent>((event, emit) async {
      try {
        emit(ShortenlinksLoading());
        // final mList = await _apiRepository.fetchCovidList();
        // emit(ShortenlinksLoaded(mList));
        // if (mList.error != null) {
        //   emit(CovidError(mList.error));
        // }
      } on NetworkError {
        emit(CovidError("Failed to fetch data. is your device online?"));
      }
      // TODO: implement event handler
    });
  }
}
