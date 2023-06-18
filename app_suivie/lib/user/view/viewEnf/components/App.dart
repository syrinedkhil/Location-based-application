import 'dart:io';
import 'dart:typed_data';

import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_apps/device_apps.dart';
import 'package:package_info/package_info.dart';
import 'package:flutter/services.dart';




class ChildApp extends StatefulWidget {
  @override
  _ChildAppState createState() => _ChildAppState();
}

class _ChildAppState extends State<ChildApp> {
  late CollectionReference _childAppsRef;

  @override
  void initState() {
    super.initState();
    _childAppsRef = FirebaseFirestore.instance.collection('App');
    _sendInstalledApps();
  }

  void _sendInstalledApps() async {
  // Vérifie si l'autorisation est accordée
  if (await Permission.storage.request().isGranted) {
    // Si l'autorisation est accordée, récupérer les applications installées
    List<Application> apps = await DeviceApps.getInstalledApplications(
      includeAppIcons: true,
      includeSystemApps: false,
      onlyAppsWithLaunchIntent: true,

    );
    

    for (Application app in apps) {
      if (!await app.systemApp) {
        //Uint8List iconData = await DeviceApps.getApplicationIcon(app.packageName);

      Map<String, dynamic> appData = {
        "appName": app.appName,
        "packageName": app.packageName,
        "versionName": app.versionName,
        "versionCode": app.versionCode,
        "systemApp": app.systemApp,
        "isBlocked":false
      };

      // envoyer les données de l'application à la base de données Firestore
      await _childAppsRef.add(appData);
    }}
  } else {
    // Si l'autorisation n'est pas accordée, afficher une boîte de dialogue pour demander l'autorisation
    await Permission.storage.request();
  }
}


 
 
 
 
 
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Applications de l'enfant"),
      ),
      body: Center(
        child: Text("Liste des applications envoyée à la base de données."),
      ),
    );
  }
}
