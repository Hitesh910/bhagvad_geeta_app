import 'package:bhagvad_geeta_app/screen/home/provider/home_provider.dart';
import 'package:bhagvad_geeta_app/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
        providers: [ChangeNotifierProvider.value(value: HomeProvider())],
        child: Consumer<HomeProvider>(
          builder: (context, value, child) {
            value.getTheme();
            return MaterialApp(
              theme: ThemeData.light(),
              darkTheme: ThemeData.dark(),
              themeMode:
                  value.theme == "light" ? ThemeMode.light : ThemeMode.dark,
              routes: app_routes,
            );
          },
          // child:
          // MaterialApp(
          //   themeMode: ,
          //   routes: app_routes,
          // ),
        )),
  );
}
