part of 'shortenlinks_bloc.dart';

abstract class ShortenlinksEvent extends Equatable {
  const ShortenlinksEvent();

  @override
  List<Object> get props => [];
}

class GetShortenLinkList extends ShortenlinksEvent {}

class GetShortenLinkListMore extends ShortenlinksEvent {}

class GetShortenLinkListRemove extends ShortenlinksEvent {}