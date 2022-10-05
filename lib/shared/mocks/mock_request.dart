import 'dart:convert';

import 'package:http/http.dart' as http;

Future<http.Response> mockRequest(http.Request request) async {
  await Future.delayed(const Duration(milliseconds: 500));
  return http.Response(
    jsonEncode(request.bodyFields),
    200,
    request: request,
    headers: {'content-type': 'application/json; charset=UTF-8'},
  );
}
