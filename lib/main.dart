import "package:flutter/material.dart";
import "package:katalog/screens/home_page.dart";
import "package:katalog/screens/login_page.dart";
import "package:katalog/screens/cart_page.dart";
import "package:katalog/store.dart";
import "package:katalog/utills/routes.dart";
import "package:katalog/widgets/themes.dart";
import "package:velocity_x/velocity_x.dart";
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(VxState(store: MyStore(), child: myapp()));
}

class myapp extends StatelessWidget {
  const myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: HomePage(),
      themeMode: ThemeMode.dark,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => HomePage(),
        MyRouts.homeRoute: (context) => HomePage(),
        MyRouts.loginRoute: (context) => LoginPage(),
        MyRouts.cartRoute: (context) => CartPage(),
      },
    );
  }
}
