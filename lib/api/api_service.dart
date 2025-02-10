import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'models/homepage_response.dart'; // Import HomepageResponse

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  static const String serviceId = "2"; // Define global service ID

  Future<HomepageResponse> fetchHomepageData() async {
    try {
      // Define the JSON data to be sent in the request body
      final Map<String, dynamic> requestBody = {
        "added_by_web": "food.56testing.club",
        "service_id": serviceId,
        "user_id": 1,
      };

      // Send the request with the JSON data in the body
      final response = await _dio.post(
        'homepage_dynamic',
        data: requestBody, // Pass the JSON data here
        options: Options(
          headers: {
            'Content-Type': 'application/json', // Set the content type to JSON
          },
        ),
      );

      // Log the API response for debugging
      if (kDebugMode) {
        print('API Response: ${response.data}');
      }

      return HomepageResponse.fromJson(response.data);
    } on DioException catch (e) {
      if (kDebugMode) {
        print('API Error: ${e.response?.data ?? e.message}');
      }
      return HomepageResponse(
        status: "error",
        statusCode: 500,
        message: "Unexpected error occurred",
      );
    }
  }
}
