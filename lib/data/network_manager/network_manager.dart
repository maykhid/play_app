// ignore_for_file: constant_identifier_names

import 'dart:async';

import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:play_app/constants/app_config.dart';

class NetworkManager {
  static BaseOptions options = BaseOptions(
    connectTimeout: 30000,
    receiveTimeout: 30000,
  );

  Dio client = Dio(options);

  Future networkRequestManager(
      String requestUrl, RequestType vrxRequestType) async {
    var baseUrl = AppConfig.baseURL;
    String url = '$baseUrl$requestUrl';
    Response? mainResponse;
    client.interceptors
        .add(DioCacheManager(CacheConfig(baseUrl: baseUrl)).interceptor);

    print('Url: $url');

    try {
      switch (vrxRequestType) {
        case RequestType.GET:
          var response = await client.get(
            url,
            // options:
            //     buildCacheOptions(const Duration(days: 1), forceRefresh: true),
          );
          mainResponse = response;
          // print('Response: ${mainResponse.toString()}');
          break;
        case RequestType.POST:
          break;
      }
      // print('Response: ${mainResponse.toString()}');
      return mainResponse;
    } on TimeoutException catch (e) {
      print("Network Timeout Error response: $e");
      throw ("Network timed out, please check your network connection and try again");
    } on DioError catch (e) {
      if (DioErrorType.receiveTimeout == e.type ||
          DioErrorType.connectTimeout == e.type) {
        print("Network Timeout Error response: $e");
        throw ("Network timed out, please check your network connection and try again");
      } else if (DioErrorType.other == e.type) {
        if (e.message.contains('SocketException')) {
          print("No Network Error response: $e");
          throw ("No internet connection, please check your network connection and try again");
        } else {
          print("No Network Error response: $e");
          throw ("An error occurred processing this request, please try again later");
        }
      } else if (e.response!.statusCode! <= 400 &&
          e.response!.statusCode! > 499) {
        throw ("Something went wrong");
      } else if (e.response!.statusCode == 500) {
        // If that call was not successful, throw an error.
        // print("Server 500 response: ${apiResponse.message}");
        throw ("We are unable to process request at this time, please try again later");
      } else {
        throw ("Network Unknown response");
      }
    } catch (e, stackTrace) {
      print("Internal Error response: $e, StackTrace: $stackTrace");
      throw ("An error occurred while processing this request");
    }
  }
}

enum RequestType {
  GET,
  POST,
}
