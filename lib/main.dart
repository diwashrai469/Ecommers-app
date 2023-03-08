import 'package:demo_app/Screen/cart_screen.dart';
import 'package:demo_app/theme/theme_provider.dart';
import 'package:demo_app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Provider/dio_state/ecommerce_items_provider.dart';
import 'Screen/home_screen.dart';

void main(List<String> args) {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => EcommerceItemsProvider()),
      ChangeNotifierProvider(create: (_) => ThemeChangerBool()),
    ],
    child: Builder(builder: (context) {
      final boolValue = Provider.of<ThemeChangerBool>(
        context,
      );

      return MaterialApp(
        theme: boolValue.iconBool
            ?AppTheme().darkTheme
            : AppTheme().lightTheme, //change the theme
        routes: {
          '/HomePage': (ctx) {
            return const HomeScreen();
          },
          '/CartPage': (ctx) {
            return const CartScreen();
          },
        },
        initialRoute: "/HomePage",
        debugShowCheckedModeBanner: false,
      );
    }),
  ));
}
