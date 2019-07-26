import 'dart:convert';

import 'package:http/http.dart' as http;
import 'functions.dart';

class Ajax {
  Future<Map<String, dynamic>> get(AjaxParams params) async {
    var cfg = await readConfig();
    var res = await http.get(cfg['api']['url'] + params.url, headers: params.headers);
    return {
      "status": res.statusCode,
      "data": jsonDecode(res.body)
    };
  }

  Future<Map<String, dynamic>> post(AjaxParams params) async {
    var cfg = await readConfig();
    var res = await http.post(cfg['api']['url'] + params.url, body: params.payload, headers: params.headers);
    return {
      "status": res.statusCode,
      "data": jsonDecode(res.body)
    };
  }

  Future<Map<String, dynamic>> put(AjaxParams params) async {
    var cfg = await readConfig();
    var res = await http.put(cfg['api']['url'] + params.url, body: params.payload, headers: params.headers);
    return {
      "status": res.statusCode,
      "data": jsonDecode(res.body)
    };
  }

  Future<Map<String, dynamic>> delete(AjaxParams params) async {
    var cfg = await readConfig();
    var res = await http.delete(cfg['api']['url'] + params.url, headers: params.headers);
    return {
      "status": res.statusCode,
      "data": jsonDecode(res.body)
    };
  }
}

class AjaxParams {
  AjaxParams({
    this.url,
    this.headers,
    this.payload,
  });

  String url;
  Map<String, dynamic> payload;
  Map<String, String> headers;
}
