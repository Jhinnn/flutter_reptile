import 'package:dio/dio.dart';
import 'package:dio/adapter.dart';

class DioFactory {
  static Future<String> getString(param, page,
      {options, cancelToken, data}) async {
    var dio = Dio(); // with default Options

// Set default configs
    dio.options.baseUrl = 'https://pub.dev/packages';
    dio.options.connectTimeout = 60000; //5s
    dio.options.receiveTimeout = 60000;

// or new Dio with a BaseOptions instance.
    // var options = BaseOptions(
    //   baseUrl: 'https://pub.dev/packages',
    //   connectTimeout: 5000,
    //   receiveTimeout: 3000,
    // );
// Dio dio = Dio(options);
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (client) {
      client.badCertificateCallback = (cert, host, port) {
        return true; // 返回true强制通过
      };
    };
    try {
      Response response =
          await dio.get('?$param&page=$page', cancelToken: cancelToken, options: options);
      print('返回结果：$response');
      return response.data.toString();
    } catch (e) {
      print(e);
      return '';
    }
  }
}

class Config {
  // static const String baseImgUrl = "https://pub.dev/packages";
  static const String baseUrl = "https://pub.dev/packages";

  ///链接超时时间
  static const int connectTimeout = 8000;

  ///  响应流上前后两次接受到数据的间隔，单位为毫秒。如果两次间隔超过[receiveTimeout]，
  ///  [Dio] 将会抛出一个[DioErrorType.RECEIVE_TIMEOUT]的异常.
  ///  注意: 这并不是接收数据的总时限.
  static const int receiveTimeout = 3000;

  ///普通格式的header
  static const Map<String, dynamic> headers = {
    "Accept": "application/json",
  };

  ///json格式的header
  static const Map<String, dynamic> headersJson = {
    "Accept": "application/json",
    "Content-Type": "application/json; charset=UTF-8",
  };
}
