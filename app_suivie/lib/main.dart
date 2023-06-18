import 'package:app_suivie/user/view/adminView/adminView.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'user/view/mobileView/homePage/HomePageMobile.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
      apiKey: "AIzaSyDkZ-y6WXhqfFrIiqo6FYDBjl-2xgKcwnI",
      appId: "1:627999996421:web:66ebf657b18f1cd5e27a6c",
      messagingSenderId: "627999996421",
      storageBucket: "geolocalisation-eca86.appspot.com",
      projectId: "geolocalisation-eca86",
    ));
  } else {
    await Firebase.initializeApp();
    
  }
  

  /*
    Stripe.publishableKey =
      "pk_test_51N2CcwDAq0pPQLM4UXNJe8HVLhghe0oWJhLAnPfmCKHTcmVsvdKCDk7UQJpjnHl3yWEyrApD4ZgpTE9fkr0ZgRcX00JesykdAD";*/
  runApp(ParentApp());
}

class ParentApp extends StatefulWidget {
  @override
  _ParentAppState createState() => _ParentAppState();
}


class _ParentAppState extends State<ParentApp> {
  @override
  Widget build(BuildContext context) {
    Widget homePage;
    if (kIsWeb) {
      homePage = HomePageWeb();
    } else {
     homePage = WelcomePage();
    }

    return MaterialApp(
      title: 'Mon application',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: homePage,
    );
  }
}
