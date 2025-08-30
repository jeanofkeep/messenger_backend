import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const String baseUrl = 'http://192.168.0.4:8000';
Future<http.Response> loginUser(String username, String password) async {
  print(
      'Sending login request for username: $username'); // Отладка перед запросом
  final response = await http.post(
    Uri.parse('$baseUrl/login'), // Замени на IP для устройства
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({
      'username': username,
      'password': password,
    }),
  );
  print(
      'Login response: ${response.statusCode} - ${response.body}'); // Отладка ответа
  return response;
}

Future<http.Response> registerUser(
    String username, String password, String name) async {
  print(
      'Sending registration request for username: $username with name: $name'); // Отладка перед запросом
  final response = await http.post(
    Uri.parse('$baseUrl/register'), // Замени на IP для устройства
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({
      'username': username,
      'password': password,
      'name': name,
    }),
  );
  print(
      'Registration response: ${response.statusCode} - ${response.body}'); // Отладка ответа
  return response;
}
