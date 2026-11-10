import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tplayer/data/domain_models/text_line.dart';
import 'package:tplayer/data/domain_models/text_title.dart';
import 'package:tplayer/data/test_data.dart';

import '../../utils/result.dart';

const DEFAULT_PORT = 8081;
const DEFAULT_HOST = '192.168.0.21';
// const DEFAULT_HOST = 'localhost';

/// Adds the `Authentication` header to a header configuration.
typedef AuthHeaderProvider = String? Function();

class ContentClient {
  ContentClient({String? host, int? port, HttpClient Function()? clientFactory})
    : _host = host ?? DEFAULT_HOST,
      _port = port ?? DEFAULT_PORT,
      _clientFactory = clientFactory ?? HttpClient.new;

  final String _host;
  final int _port;
  final HttpClient Function() _clientFactory;

  AuthHeaderProvider? _authHeaderProvider;

  set authHeaderProvider(AuthHeaderProvider authHeaderProvider) {
    _authHeaderProvider = authHeaderProvider;
  }

  Future<void> _authHeader(HttpHeaders headers) async {
    final header = _authHeaderProvider?.call();
    if (header != null) {
      headers.add(HttpHeaders.authorizationHeader, header);
    }
  }

  Future<Result<String>> getJsonAsRawString(String url) async {
    final client = _clientFactory();
    try {
      final request = await client.get(_host, _port, url);
      await _authHeader(request.headers);
      final response = await request.close();
      if (response.statusCode == HttpStatus.ok) {
        final stringData = await response.transform(utf8.decoder).join();
        return Result.ok(stringData);
      } else {
        return Result.error(
          HttpException("Invalid response", uri: Uri.parse(url)),
        );
      }
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      client.close();
    }
  }

  Future<Result<List<TextTitle>>> getListAllTextTitles() async {
    const String url = '/cdn/text.json';
    Result<String> rawJson = await getJsonAsRawString(url);
    switch (rawJson) {
      case Ok():
        final json = jsonDecode(rawJson.value) as List<dynamic>;
        return Result.ok(
          json.map((element) => TextTitle.fromJson(element)).toList(),
        );
      case Error():
        return Result.error(rawJson.error);
    }
  }

  Future<Result<List<TextTitle>>> getListAllTextTitles2() async {
    final client = _clientFactory();
    try {
      final request = await client.get(_host, _port, '/cdn/texts.json');
      await _authHeader(request.headers);
      final response = await request.close();
      if (response.statusCode == HttpStatus.ok) {
        final stringData = await response.transform(utf8.decoder).join();
        final json = jsonDecode(stringData) as List<dynamic>;
        return Result.ok(
          json.map((element) => TextTitle.fromJson(element)).toList(),
        );
      } else {
        return const Result.error(HttpException("Invalid response"));
      }
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      client.close();
    }
  }

  Future<Result<List<TextLine>>> getListTextLines() async {
    final json = jsonDecode(losTresSerditos);
    return Result.ok(
      json
          .mapIndexed((index, element) => TextLine.fromJson(element, index))
          .toList(),
    );
  }
}
