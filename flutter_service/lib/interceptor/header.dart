import 'package:http_interceptor/http_interceptor.dart';
import 'package:shared_preferences/shared_preferences.dart';


class HeaderInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({RequestData data}) async {
    try {
      data.headers["Content-Type"] = "application/json";
      data.headers["Authorization"] = 'Bearer ${_getAuthorizationHeader()}';
    } catch (e) {
      print(e);
    }
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({ResponseData data}) async {
    return data;
  }

  Future<String> _getAuthorizationHeader() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get('token');
  }
}