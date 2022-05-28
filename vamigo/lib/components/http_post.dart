import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class HttpPost {
  final resultNotifier = ValueNotifier<RequestState>(RequestInitial());
  static const urlPrefix = 'http://lwc421.iptime.org:8080';

  Future<Response> makePostRequest(
      var toJson, String urlPostfix, BuildContext context) async {
    resultNotifier.value = RequestLoadInProgress();
    final url = Uri.parse('$urlPrefix' + urlPostfix);
    final headers = {'Content-type': 'application/json'};
    final json = jsonEncode(toJson);
    final response = await post(url, headers: headers, body: json);
    print('Status code: ${response.statusCode}');
    print('Body: ${response.body}');
    _handleResponse(response, context);
    return response;
  }

  void _handleResponse(Response response, BuildContext context) {
    if (response.statusCode >= 400) {
      RequestLoadFailure(context);
    } else {
      resultNotifier.value = RequestLoadSuccess(response.body);
    }
  }
}

class RequestState {
  const RequestState();
}

class RequestInitial extends RequestState {}

class RequestLoadInProgress extends RequestState {}

class RequestLoadSuccess extends RequestState {
  const RequestLoadSuccess(this.body);
  final String body;
}

class RequestLoadFailure extends RequestState {
  BuildContext context;
  RequestLoadFailure(this.context);
}
