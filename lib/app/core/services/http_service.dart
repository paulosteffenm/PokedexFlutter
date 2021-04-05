import 'package:dio/dio.dart';
import 'package:pokemon/app/environments/environments.dart';

class HttpService {
  BaseOptions options = BaseOptions(
    baseUrl: AppEnvironment.apiBaseUrl,
  );

  Dio _http;

  HttpService() {
    _http = Dio(options);
    _http.interceptors
        .add(InterceptorsWrapper(onResponse: _onResponse, onError: _onError));
  }

  Dio get instance {
    return _http;
  }

  HttpService.withoutAuthorization() {
    _http = Dio(options);
    _http.interceptors.add(InterceptorsWrapper(
        onRequest: _onRequest, onResponse: _onResponse, onError: _onError));
  }

  RequestOptions _onRequest(RequestOptions options) {
    print('REQUEST[${options.method}] ${options.path}');

    final DateTime now = DateTime.now();

    options.headers['Accept-Language'] = 'pt-BR';
    options.headers['X-Device-DateTime'] = now;
    options.headers['X-Device-TimeZone-Name'] = now.timeZoneName;
    options.headers['X-Device-TimeZone-Offset'] = now.timeZoneOffset;

    return options;
  }

  Response _onResponse(Response response) {
    print('RESPONSE[${response.statusCode}] ${response.request.path}');

    return response;
  }

  DioError _onError(DioError e) {
    if (e.type == DioErrorType.DEFAULT &&
        e.message.contains('SocketException')) {
      print('No conection');
      //_toastService.standard('${SanusTexts.opaVoceEstaSemConexao} ${SanusTexts.verifiqueSuaConexaoComAInternetETenteNovamente}');
    }

    if (e.response != null &&
        e.response.data.length > 0 &&
        e.response.data[0]['key'] == 'medico') {
      return e;
    }

    if (e.response.statusCode == 400) {
      print('${e.response.data[0]['message']}');
      //_toastService.standard('${e.response.data[0]['message']}');
    }

    return e;
  }
}
