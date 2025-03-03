import 'package:dart_learner/booking_project/core/local_storage/app_prefrerence.dart';
import 'package:flutter/material.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppPreference.init();
  runApp(const BookingApp());
}
