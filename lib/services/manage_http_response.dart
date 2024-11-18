import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

void manageHttpResponse(
    {required http.Response response,
    required BuildContext context,
    required VoidCallback onSuccess}) {
  //Switch statement to handle different http status codes
  switch (response.statusCode) {
    case 200:
      onSuccess();
      break;
    case 400: //indicates bad request
      showSnackBar(context, json.decode(response.body)['msg']);
      break;
    case 500: //indicates server error
      showSnackBar(context, json.decode(response.body)['error']);
      break;
    case 201: //indicates a resource was create successfully
      onSuccess();
      break;
  }
}

void showSnackBar(BuildContext context, String title) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(title)));
}
