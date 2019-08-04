import 'dart:convert';

import 'package:http/http.dart' as http;
import 'functions.dart';

class Ajax {
  Future<Map<String, dynamic>> get(AjaxParams params) async {
    var url = "";
    if (params.url.contains("http")) {
      url = params.url;
    } else {
      var cfg = await readConfig();
      url = cfg['api']['url'] + params.url;
    }
    var res = await http.get(url, headers: params.headers);

    return {
      "status": res.statusCode,
      "data": jsonDecode(res.body)
    };
  }

  Future<Map<String, dynamic>> post(AjaxParams params) async {
    var url = "";
    if (params.url.contains("http")) {
      url = params.url;
    } else {
      var cfg = await readConfig();
      url = cfg['api']['url'] + params.url;
    }
    var res = await http.post(url, body: params.payload, headers: params.headers);
    return {
      "status": res.statusCode,
      "data": jsonDecode(res.body)
    };
  }

  Future<Map<String, dynamic>> put(AjaxParams params) async {
    var url = "";
    if (params.url.contains("http")) {
      url = params.url;
    } else {
      var cfg = await readConfig();
      url = cfg['api']['url'] + params.url;
    }
    var res = await http.put(url, body: params.payload, headers: params.headers);
    return {
      "status": res.statusCode,
      "data": jsonDecode(res.body)
    };
  }

  Future<Map<String, dynamic>> delete(AjaxParams params) async {
    var url = "";
    if (params.url.contains("http")) {
      url = params.url;
    } else {
      var cfg = await readConfig();
      url = cfg['api']['url'] + params.url;
    }
    var res = await http.delete(url, headers: params.headers);
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
