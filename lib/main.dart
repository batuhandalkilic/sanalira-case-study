import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/firebase/firebase_options.dart';
import 'pages/authentication/authentication.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  //Riverpod.Sağlayıcıların durumunun saklanacağı yer.
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)
    return ScreenUtilInit(
      //Samsung S21FE viewport. Diğer ekranlara(TV-TABLET) göre oranlanyan paket.
      designSize: const Size(384, 854),

      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'SanaLira',
          theme: ThemeData(),
          home: child,
        );
      },
      child: const AuthenticationPage(),
    );
  }
}
