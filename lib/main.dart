import 'package:flutter/material.dart';
import 'package:thameen/app.dart';
import 'package:thameen/shared/services/shared_preferences_singleton.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesSingleton.initInstance();
  runApp(const Thameen());
}
