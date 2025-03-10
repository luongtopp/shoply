import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

import '../common/app/cache_helper.dart';
import '../services/injection_container.dart';
import '../services/router.dart';

abstract class NetworkUtils {
  static Future<void> renewToken(http.Response response) async {
    if (response.headers['authorization'] != null) {
      var token = response.headers['authorization'] as String;
      if (token.startsWith('Bearer')) {
        token = token.replaceFirst('Bearer', 'replace').trim();
      }
      await sl<CacheHelper>().cacheSessionToken(token);
    } else if (response.statusCode == 401) {
      rootNavigatorkey.currentContext?.go('/');
    }
  }
}
