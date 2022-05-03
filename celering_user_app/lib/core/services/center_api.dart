import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:celering_user_app/core/model/server_response.dart';

class CenterApi {
  static const String connectionError = "Error en la conexión";
  final String token;

  CenterApi({this.token = ""});

  Map<String, String> get _headers {
    if (token.isEmpty) {
      return {
        "Content-Type": "application/json",
      };
    } else {
      return {
        "Content-Type": "application/json",
        HttpHeaders.authorizationHeader: 'Bearer $token'
      };
    }
  }

  Future<ServerResponse> get({required String urlSpecific}) async {
    try {
      final response =
          await http.get(Uri.parse(urlSpecific), headers: _headers);
      final dataDecode = response.body != ""
          ? json.decode(utf8.decode(response.bodyBytes))
          : [];
      if (response.statusCode >= 200 && response.statusCode <= 204) {
        return ServerResponse(
          isSuccess: true,
          message: 'GET realizada con exito',
          result: dataDecode,
        );
      } else {
        return ServerResponse(
          isSuccess: false,
          message: "Error",
          result: [],
        );
      }
    } catch (error) {
      return ServerResponse(
        isSuccess: false,
        message: connectionError,
        result: [],
      );
    }
  }

  Future<ServerResponse> post({
    required Map<String, dynamic> data,
    required String urlSpecific,
  }) async {
    try {
      String dataParse = data.isNotEmpty ? json.encode(data) : "";
      final response = await http.post(
        Uri.parse(urlSpecific),
        headers: _headers,
        body: dataParse,
      );
      final dataDecode = json.decode(utf8.decode(response.bodyBytes));
      if (response.statusCode >= 200 && response.statusCode <= 204) {
        return ServerResponse(
          isSuccess: true,
          message: 'POST realizada con exito',
          result: dataDecode,
        );
      } else {
        return ServerResponse(
          isSuccess: false,
          message: "Error",
          result: [],
        );
      }
    } catch (error) {
      return ServerResponse(
        isSuccess: false,
        message: connectionError,
        result: [],
      );
    }
  }

  Future<ServerResponse> update({
    required Map<String, dynamic> data,
    required String urlSpecific,
  }) async {
    try {
      String dataParse = json.encode(data);
      final response = await http.patch(
        Uri.parse(urlSpecific),
        headers: _headers,
        body: dataParse,
      );
      final dataDecode = json.decode(utf8.decode(response.bodyBytes));
      if (response.statusCode >= 200 && response.statusCode <= 204) {
        return ServerResponse(
          isSuccess: true,
          message: 'Actualización realizada con exito',
          result: dataDecode,
        );
      } else {
        return ServerResponse(
          isSuccess: false,
          message: "Error",
          result: [],
        );
      }
    } catch (e) {
      return ServerResponse(
        isSuccess: false,
        message: connectionError,
        result: [],
      );
    }
  }

  Future<ServerResponse> updateMultipart({
    required Map<String, dynamic> data,
    required String urlSpecific,
    required String fileField,
    required String filePath,
  }) async {
    try {
      var request = http.MultipartRequest('PATCH', Uri.parse(urlSpecific));
      request.headers.addAll(_headers);
      request.files.add(await http.MultipartFile.fromPath(fileField, filePath));

      for (var e in data.entries) {
        if (e.value != null) {
          request.fields[e.key] = e.value.toString();
        }
      }

      final streamedResponse = await request.send();

      var response = await http.Response.fromStream(streamedResponse);

      final dataDecode = json.decode(utf8.decode(response.bodyBytes));
      if (response.statusCode >= 200 && response.statusCode <= 204) {
        return ServerResponse(
          isSuccess: true,
          message: 'Actualización realizada con exito',
          result: dataDecode,
        );
      } else {
        return ServerResponse(
          isSuccess: false,
          message: "Error",
          result: [],
        );
      }
    } catch (e) {
      return ServerResponse(
        isSuccess: false,
        message: connectionError,
        result: [],
      );
    }
  }

  Future delete({
    required Map<String, dynamic> data,
    required String urlSpecific,
  }) async {
    try {
      final response =
          await http.delete(Uri.parse(urlSpecific), headers: _headers);
      final dataDecode = json.decode(utf8.decode(response.bodyBytes));
      if (response.statusCode >= 200 && response.statusCode <= 204) {
        return ServerResponse(
          isSuccess: true,
          message: 'Eliminación realizada con exito',
          result: dataDecode,
        );
      } else {
        return ServerResponse(
          isSuccess: false,
          message: "Error",
          result: [],
        );
      }
    } catch (e) {
      return ServerResponse(
        isSuccess: false,
        message: connectionError,
        result: [],
      );
    }
  }
}
