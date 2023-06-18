import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';


class AppBlocker {
  String packageName;
  bool isBlocked;

  AppBlocker({required this.packageName, required this.isBlocked});

  Future<void> toggleBlock() async {
    //if (await Permission.manageExternalStorage.request().isGranted) {
    var status = await Permission.manageExternalStorage.request();
    //if (status.isGranted) {
      final result = await Process.run('pm', [isBlocked ? 'enable' : 'disable', packageName]);
      if (result.exitCode != 0) {
        print('Failed to toggle block for $packageName');
      } else {
        print('$packageName ${isBlocked ? 'enabled' : 'disabled'} successfully');
        isBlocked = !isBlocked;
      }
    } 
  }

