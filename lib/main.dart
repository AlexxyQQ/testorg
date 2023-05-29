import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:musync/app.dart';
import 'package:musync/bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Paint.enableDithering = true; // Enable dithering for better quality

  // Initialize Hive
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    await Hive.initFlutter('Musync');
  } else {
    await Hive.initFlutter();
  }

  // Open Hive Boxes
  await hiveOpen('settings');
  await hiveOpen('users');
  await hiveOpen('uploads');
  await hiveOpen('songs');

  Bloc.observer = MusyncBlocObserver();

  runApp(
    const App(),
  );
}

/// Open Hive Boxes
/// Provide a {$boxName} to open, if it fails to open, it will try again
Future<void> hiveOpen(String boxName) async {
  await Hive.openBox(boxName).onError(
    (error, stackTrace) async {
      await Hive.openBox(boxName);
      throw 'Failed to open $boxName Box\nError: $error';
    },
  );
}
