import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../../core/_core.dart';
import 'i_network_service.dart';

class HttpNetworkService implements INetworkService {
  Map<String, String> defHeader = {
        // "Accept": "*/*",
        "Accept": "application/json",
      };

  void _throwOnFail(http.Response response) {
    print(response.statusCode);
    print(response.body);
    if (response.statusCode != 200 && response.statusCode != 201) {
      throw jsonDecode(response.body)['message'];
    }
  }

  @override
  Future<dynamic> get(
    Uri uri, {
    Map<String, String> headers = const {},
  }) async {
    try {
      final response = await http.get(
        uri,
        headers: defHeader..addAll(headers),
      );

      _throwOnFail(response);

      return jsonDecode(response.body);
    } on SocketException {
      print('Failure:message:  SocketException');
      throw Failure(message: 'Please check your internet connection 😑');
    } on FormatException {
      print('Failure:message:  FormatException');
      throw Failure(message: 'Bad response format 👎');
    } catch (ex) {
      print('Failure:message:  Message {${ex.toString()}}');
      throw Failure(message: ex.toString());
    }
  }

  @override
  Future<dynamic> post(
    Uri uri, {
    required Map<String, dynamic> body,
    Map<String, String> headers = const {},
  }) async {
    try {
      print(jsonEncode(body));
      final response = await http.post(
        uri,
        body: body,
        headers: defHeader..addAll(headers),
      );
      _throwOnFail(response);

      return response.body.isNotEmpty ? jsonDecode(response.body) : null;
    } on SocketException {
      print('Failure:message:  SocketException');
      throw Failure(message: 'Please check your internet connection 😑');
    } on FormatException {
      print('Failure:message:  FormatException');
      throw Failure(message: 'Bad response format 👎');
    } catch (ex) {
      print('Failure:message:  Message {${ex.toString()}}');
      throw Failure(message: ex.toString());
    }
  }

  @override
  Future<dynamic> put(
    Uri uri, {
    required Map<String, dynamic> body,
    Map<String, String>? headers,
  }) async {
    try {
      final response = await http.put(
        uri,
        body: body,
      );

      _throwOnFail(response);

      return jsonDecode(response.body);
    } on SocketException {
      print('Failure:message:  SocketException');
      throw Failure(message: 'Please check your internet connection 😑');
    } on FormatException {
      print('Failure:message:  FormatException');
      throw Failure(message: 'Bad response format 👎');
    } catch (ex) {
      print('Failure:message:  Message {${ex.toString()}}');
      throw Failure(message: ex.toString());
    }
  }

  @override
  Future<dynamic> delete(Uri uri) async {
    try {
      final response = await http.delete(uri);

      _throwOnFail(response);

      return jsonDecode(response.body);
    } on SocketException {
      print('Failure:message:  SocketException');
      throw Failure(message: 'Please check your internet connection 😑');
    } on FormatException {
      print('Failure:message:  FormatException');
      throw Failure(message: 'Bad response format 👎');
    } catch (ex) {
      print('Failure:message:  Message {${ex.toString()}}');
      throw Failure(message: ex.toString());
    }
  }
}
