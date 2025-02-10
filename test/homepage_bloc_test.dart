import 'package:dynamic_ui_app/api/models/homepage_response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dynamic_ui_app/bloc/homepage_bloc.dart';
import 'mock_api_service.mocks.dart'; // Import the generated mock file

void main() {
  late HomepageBloc homepageBloc;
  late MockApiService mockApiService;

  setUp(() {
    mockApiService = MockApiService();
    homepageBloc = HomepageBloc(mockApiService);
  });

  tearDown(() {
    homepageBloc.close();
  });

  // Test case 1: Initial state is HomepageInitial
  test('Initial state is HomepageInitial', () {
    expect(homepageBloc.state, equals(HomepageInitial()));
  });

  // Test case 2: Emits [HomepageLoading, HomepageLoaded] when FetchHomepageData is added
  blocTest<HomepageBloc, HomepageState>(
    'Emits [HomepageLoading, HomepageLoaded] when FetchHomepageData is added',
    build: () {
      // Mock the API response
      when(mockApiService.fetchHomepageData()).thenAnswer(
            (_) async => HomepageResponse(
          viewtypeList: [],
          themeColors: [],
          status: 'success',
          statusCode: 200,
          message: 'success',
          type: 'Food',
        ),
      );
      return homepageBloc;
    },
    act: (bloc) => bloc.add(FetchHomepageData()),
    expect: () => [
      HomepageLoading(),
      HomepageLoaded(
        HomepageResponse(
          viewtypeList: [],
          themeColors: [],
          status: 'success',
          statusCode: 200,
          message: 'success',
          type: 'Food',
        ),
      ),
    ],
  );

  // Test case 3: Emits [HomepageLoading, HomepageError] when API call fails
  blocTest<HomepageBloc, HomepageState>(
    'Emits [HomepageLoading, HomepageError] when API call fails',
    build: () {
      // Mock an API error
      when(mockApiService.fetchHomepageData()).thenThrow(Exception('Failed to load data'));
      return homepageBloc;
    },
    act: (bloc) => bloc.add(FetchHomepageData()),
    expect: () => [
      HomepageLoading(),
      HomepageError('Failed to load data'), // Now correctly formatted
    ],
  );

  // Test case 4: Emits [HomepageLoading, HomepageLoaded] with empty data
  blocTest<HomepageBloc, HomepageState>(
    'Emits [HomepageLoading, HomepageLoaded] with empty data',
    build: () {
      // Mock an empty API response
      when(mockApiService.fetchHomepageData()).thenAnswer(
            (_) async => HomepageResponse(
          viewtypeList: null,
          themeColors: null,
          status: null,
          statusCode: null,
          message: null,
          type: null,
        ),
      );
      return homepageBloc;
    },
    act: (bloc) => bloc.add(FetchHomepageData()),
    expect: () => [
      HomepageLoading(),
      HomepageLoaded(
        HomepageResponse(
          viewtypeList: null,
          themeColors: null,
          status: null,
          statusCode: null,
          message: null,
          type: null,
        ),
      ),
    ],
  );
}
