part of 'shortenlinks_bloc.dart';

abstract class ShortenlinksState extends Equatable {
  const ShortenlinksState();
  
  @override
  List<Object> get props => [];
}

class ShortenlinksInitial extends ShortenlinksState {}


class ShortenlinksLoading extends ShortenlinksState {}



class DataLoading extends ShortenlinksState {}

class DataLoaded extends ShortenlinksState {
  final List<dynamic> myList;

  DataLoaded(this.myList);
}

