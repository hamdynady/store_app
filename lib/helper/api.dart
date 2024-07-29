import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api {
  // The 'get' function sends a GET request to a given URL and handles the response
  Future<dynamic> get({required String url, @required String? token}) async {
    // Send the GET request to the specified URL
    http.Response response = await http.get(Uri.parse(url));
    Map<String, String> headers = {}; // Initialize headers as an empty map
    // If the token is not null, add it to the headers
    if (token != null) {
      headers.addAll({
        'Authorization': 'Bearer $token',
      });
    }
    // Check if the status code is 200 (OK)
    if (response.statusCode == 200) {
      // If the status code is 200, decode the JSON response body and return it
      return jsonDecode(response.body);
    } else {
      // If the status code is not 200, throw an exception with the status code
      throw Exception(
          'There is a problem with the status code ${response.statusCode}');
    }
  }

// @required means that the parameter is mandatory for the function
// The 'post' function sends a POST request to a given URL with an optional token and a body
  Future<dynamic> post(
      {required String url, // The URL to which the POST request will be sent
      @required dynamic body, // The body of the POST request, which is mandatory
      @required String? token // The optional token for authorization
      }) async {
    Map<String, String> headers = {}; // Initialize headers as an empty map

    // If the token is not null, add it to the headers
    if (token != null) {
      headers.addAll({
        'Authorization': 'Bearer $token',
      });
    }

    // Send the POST request to the specified URL with the headers and body
    http.Response response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      // Return the json Decode response received from the server
      return jsonDecode(response.body);
    } else {
      // If the status code is not 200, throw an exception with the status code
      throw Exception(
          'There is a problem with the status code ${response.statusCode} with body ${jsonDecode(response.body)}');
    }
  }

// @required means that the parameter is mandatory for the function
// The 'put' function sends a put request to a given URL with an optional token and a body
  Future<dynamic> put(
      {required String url, // The URL to which the POST request will be sent
      @required
      dynamic body, // The body of the POST request, which is mandatory
      @required String? token // The optional token for authorization
      }) async {
    Map<String, String> headers = {}; // Initialize headers as an empty map

    //Put header almost always is form-urlencoded
    headers.addAll({
      'Content-Type': 'application/x-www-form-urlencoded',
    });
    // If the token is not null, add it to the headers
    if (token != null) {
      headers.addAll({
        'Authorization': 'Bearer $token',
      });
    }
    print('url=$url body=$body token=$token');
    // Send the POST request to the specified URL with the headers and body
    http.Response response = await http.put(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      // Return the json Decode response received from the server
      Map<String,dynamic> data = jsonDecode(response.body);
      print(data);
      return data;
    } else {
      // If the status code is not 200, throw an exception with the status code
      throw Exception(
          'There is a problem with the status code ${response.statusCode} with body ${jsonDecode(response.body)}');
    }
  }
}
