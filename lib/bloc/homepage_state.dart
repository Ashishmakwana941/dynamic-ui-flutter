// homepage_state.dart
part of 'homepage_bloc.dart';

abstract class HomepageState extends Equatable {
  const HomepageState();

  @override
  List<Object> get props => [];
}

class HomepageInitial extends HomepageState {}

class HomepageLoading extends HomepageState {}

class HomepageLoaded extends HomepageState {
  final HomepageResponse data;

  const HomepageLoaded(this.data);

  @override
  List<Object> get props => [data];
}

class HomepageError extends HomepageState {
  final String message;

  const HomepageError(this.message);

  @override
  List<Object> get props => [message];
}