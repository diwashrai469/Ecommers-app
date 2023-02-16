import 'package:demo_app/Screen/cart_page.dart';
import 'package:demo_app/Provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Provider/ApiProvider/api.dart';
import 'Screen/home_page.dart';

void main(List<String> args) {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => DataProvider()),
      ChangeNotifierProvider(create: (_) => ThemeChangerBool()),
    ],
    child: Builder(builder: (context) {
      final boolValue = Provider.of<ThemeChangerBool>(
        context,
      );

      return MaterialApp(
        theme: boolValue.iconBool
            ? boolValue.darkTheme
            : boolValue.lightTheme, //change the theme
        routes: {
          '/HomePage': (ctx) {
            return HomePage();
          },
          '/CartPage': (ctx) {
            return MyCartPage();
          },
        },
        initialRoute: "/HomePage",
        debugShowCheckedModeBanner: false,
      );
    }),
  ));
}
