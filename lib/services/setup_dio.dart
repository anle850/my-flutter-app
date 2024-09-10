import 'package:dio/dio.dart';

final Dio dio = Dio();

void setupDio() {
  dio.options.baseUrl =
      'https://ap-southeast-1.aws.data.mongodb-api.com/app/data-bfzcnjp/endpoint/data/v1';
  dio.options.connectTimeout = const Duration(seconds: 5);
  dio.options.receiveTimeout = const Duration(seconds: 3);
  dio.options.headers = {
    'Content-Type': 'application/json',
    'Access-Control-Request-Headers': '*',
    'api-key':
        'ToGfHK6AWw9kd49l1SNxPd0z1BmhKdG5wsIZuvXmR5UufgyYZssQgUATpt9OqV9p',
  };

  dio.interceptors.add(InterceptorsWrapper(
    onRequest: (options, handler) => handler.next(options),
    onResponse: (response, handler) => handler.next(response),
    onError: (DioException e, handler) {
      print('Dio error: ${e.toString()}');
      handler.next(e);
    },
  ));
}
