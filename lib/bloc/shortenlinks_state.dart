part of 'shortenlinks_bloc.dart';

abstract class ShortenlinksState extends Equatable {
  const ShortenlinksState();
  
  @override
  List<Object> get props => [];
}

class ShortenlinksInitial extends ShortenlinksState {}


class ShortenlinksLoading extends ShortenlinksState {}

// class ShortenlinksLoaded extends ShortenlinksState {
//   final ShortenLinkModel linkModel;
//   const ShortenlinksLoaded(this.linkModel);
// }

class DataLoading extends ShortenlinksState {}

class DataLoaded extends ShortenlinksState {
  final List<dynamic> myList;

  DataLoaded(this.myList);
}
class CovidError extends ShortenlinksState {
  final String? message;
  const CovidError(this.message);
}
