import 'package:flutter/material.dart';
import 'app/app.dart';
import 'app_services/endpoint_env.dart';

void main() async {
  // load endpoint
  await EndpointEnv.init();

  runApp(const MyApp());
}
