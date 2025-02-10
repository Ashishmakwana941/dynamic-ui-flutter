// homepage_event.dart
part of 'homepage_bloc.dart';

abstract class HomepageEvent extends Equatable {
  const HomepageEvent();

  @override
  List<Object> get props => [];
}

class FetchHomepageData extends HomepageEvent {}