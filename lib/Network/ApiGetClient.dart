import 'package:flutter/material.dart';
import 'package:tipster/Models/BookmarkModel.dart';
import 'package:tipster/Network/ApiConstant.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future getData({
  required String PARAM_URL,
}) async {
  var response =
      await http.get(Uri.parse(ApiConstant.get_base_url + PARAM_URL), headers: {
    'Content-Type': 'application/json',
    'Authorization':
        'Bearer e435fad07c732fec513b2f4e35108da300427cc3c9a3acdec3a7ed0e0c979350'
  });

  // print(response.body);

  var Response = jsonDecode(response.body);

  return Response;
}
