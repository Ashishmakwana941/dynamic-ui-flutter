import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../api/api_service.dart';
import '../api/models/homepage_response.dart';

part 'homepage_event.dart';
part 'homepage_state.dart';

class HomepageBloc extends Bloc<HomepageEvent, HomepageState> {
  final ApiService _apiService;

  HomepageBloc(this._apiService) : super(HomepageInitial()) {
    on<FetchHomepageData>(_onFetchHomepageData);
  }

  void _onFetchHomepageData(FetchHomepageData event, Emitter<HomepageState> emit) async {
    emit(HomepageLoading());
    try {
      final data = await _apiService.fetchHomepageData();
      emit(HomepageLoaded(data));
    } catch (e) {
      emit(HomepageError(e.toString().replaceFirst('Exception: ', '')));
    }
  }
}