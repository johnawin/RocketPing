import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Stopwatch stopwatch;
Future<void> pingResponseTime() async {
  stopwatch = new Stopwatch();
  stopwatch.start();
  final http.BaseResponse response = await http.get(
    'https://google.com',
  );
  if (response.statusCode == 200) {
    stopwatch.stop();
  } else {
    throw Exception('Failed to get a network response.');
  }
}

