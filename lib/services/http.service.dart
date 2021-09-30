import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

///
/// 200 - 299 : sucess
/// 300 - 399 : error client
/// 400 > : error server
///
class HttpService {
  String baseUrl;
  Map<String, String> headers;

  HttpService({required this.baseUrl, required this.headers});

  Future<HttpResult> post({
    required String slug,
    required Object body,
  }) async {
    Uri apiUri = Uri.parse(this.baseUrl + slug);
    var apiResult = await http.post(apiUri, body: body, headers: this.headers);
    Map<String, dynamic> jsonObject = json.decode(apiResult.body);
    // Helpers.log(
    //   tag: "HttpService@post",
    //   log: "request: " +
    //       {
    //         "url": apiUri,
    //         "headers": headers.toString(),
    //         "body": body.toString(),
    //         "status code": apiResult.statusCode.toString(),
    //         "response body": jsonObject.toString(),
    //       }.toString(),
    // );

    return HttpResult(
      statusCode: apiResult.statusCode,
      response: jsonObject,
    );
  }

  Future<HttpResult> get({
    required String slug,
  }) async {
    Uri apiUri = Uri.parse(this.baseUrl + slug);
    var apiResult = await http.get(apiUri, headers: this.headers);
    Map<String, dynamic> jsonObject = json.decode(apiResult.body);
    print(
      "request: " +
          {
            "url": apiUri,
            "headers": headers.toString(),
            "status code": apiResult.statusCode.toString(),
            "response body": jsonObject.toString(),
          }.toString(),
    );
    // print(apiResult.statusCode.toString() + " ~ " + jsonObject.toString());
    return HttpResult(
      statusCode: apiResult.statusCode,
      response: jsonObject,
    );
  }

  Future<HttpResult> delete({
    required String slug,
  }) async {
    Uri apiUri = Uri.parse(this.baseUrl + slug);
    var apiResult = await http.delete(apiUri, headers: headers);
    Map<String, dynamic> jsonObject = json.decode(apiResult.body);
    // Helpers.log(
    //   tag: "HttpService@delete",
    //   log: "request: " +
    //       {
    //         "url": apiUri,
    //         "headers": headers.toString(),
    //         "status code": apiResult.statusCode.toString(),
    //         "response body": jsonObject.toString(),
    //       }.toString(),
    // );

    return HttpResult(
      statusCode: apiResult.statusCode,
      response: jsonObject,
    );
  }

  Future<HttpResult> put({
    required String slug,
    required Object body,
  }) async {
    Uri apiUri = Uri.parse(this.baseUrl + slug);
    var apiResult = await http.put(apiUri, headers: headers, body: body);
    Map<String, dynamic> jsonObject = json.decode(apiResult.body);
    // Helpers.log(
    //   tag: "HttpService@put",
    //   log: "request: " +
    //       {
    //         "url": apiUri,
    //         "headers": headers.toString(),
    //         "body": body.toString(),
    //         "status code": apiResult.statusCode.toString(),
    //         "response body": jsonObject.toString(),
    //       }.toString(),
    // );

    return HttpResult(
      statusCode: apiResult.statusCode,
      response: jsonObject,
    );
  }

  Future<HttpResult> patch({
    required String slug,
    required Object body,
  }) async {
    Uri apiUri = Uri.parse(this.baseUrl + slug);
    var apiResult = await http.patch(apiUri, headers: headers, body: body);
    Map<String, dynamic> jsonObject = json.decode(apiResult.body);
    // Helpers.log(
    //   tag: "HttpService@patch",
    //   log: "request: " +
    //       {
    //         "url": apiUri,
    //         "headers": headers.toString(),
    //         "body": body.toString(),
    //         "status code": apiResult.statusCode.toString(),
    //         "response body": jsonObject.toString(),
    //       }.toString(),
    // );

    return HttpResult(
      statusCode: apiResult.statusCode,
      response: jsonObject,
    );
  }

  static String get noInternetMessage {
    return "tidak dapat terhubung ker server, periksa kembali koneksi internet anda";
  }

  static String get serverErrorMessage {
    return "server mengalami masalah, cobalah beberapa saat lagi";
  }
}

class HttpResult {
  int statusCode;
  Map<String, dynamic> response;

  HttpResult({required this.statusCode, required this.response});

  bool get isError {
    if (statusCode >= 200 && statusCode < 400) {
      return false;
    } else {
      return true;
    }
  }

  bool get isClientError {
    if (statusCode >= 400 && statusCode < 500) {
      return true;
    } else {
      return false;
    }
  }

  bool get isServerError {
    if (statusCode >= 400 && statusCode < 500) {
      return false;
    } else {
      return true;
    }
  }
}
