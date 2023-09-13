import 'dart:convert';
import 'package:amazon/constants/utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void httpErrorHandel({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onsucess,
}) {
  switch (response.statusCode) {
    case 200:
      onsucess();
      break;
    case 400:
      showSnackBar(jsonDecode(response.body)["msg"], context);
      break;
    case 500:
      showSnackBar(jsonDecode(response.body)["msg"], context);
      break;
    default:
      showSnackBar(response.body, context);
  }
}
