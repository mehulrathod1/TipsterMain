import 'package:flutter/material.dart';
import 'package:tipster/Network/ApiConstant.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future PostData({required String PARAM_URL, required Map params}) async {
  var response = await http.post(Uri.parse(ApiConstant.base_url + PARAM_URL),
      body: params);
  print(response.body);
  var Response = jsonDecode(response.body);
  print('----------->' + Response.toString());

  return Response;
}
