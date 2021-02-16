import 'package:festi/providers/authentication_provider.dart';
import 'package:festi/screens/authentication/login_page.dart';
import 'package:festi/screens/authentication/widgets/scanner_qr.dart';
import 'package:festi/screens/clients/screens/categories_list.dart';
import 'package:festi/screens/clients/screens/product_page.dart';
import 'package:festi/screens/restaurants/restaurant_page.dart';
import 'package:festi/screens/splash/splash_screen.dart';
import 'package:festi/utils/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:festi/screens/restaurants/administrar_menu_page.dart';
import 'package:festi/screens/restaurants/administrar_pedidos_page.dart';

class ForksProvider extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider()),
      ],
      child: _app(context),
    );
  }

  Map<String, Widget> appRoutes = {
    "/splash": SplashScreen(),
    "/": LoginPage(),
    "/scanner": QRViewExample(),
    "/restaurant": RestaurantPage(),
    "/categorias": CategoriesScreen(),
    '/administrarPedidos': AdminPedidos(),
    '/productPage': ProductPage(),
    '/administrarMenu' : AdminMenu(),
  };

  Widget _app(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Festi',
      theme: ThemeData(
        brightness: Brightness.light,
        canvasColor: ColorsFesti.NaranjaFesti,

        fontFamily: "OpenSans-ExtraBold",
      ),
      initialRoute: '/splash',
      onGenerateRoute: (RouteSettings settings) {
        String path = settings.name;
        Widget widget = appRoutes[path];
        return SlideRightRoute(widget: widget, settings: settings);
      },
    );
  }
}

class SlideRightRoute extends PageRouteBuilder {
  final Widget widget;
  RouteSettings settings;
  SlideRightRoute({this.widget, this.settings}) : super(
    settings: settings,
    pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
      return widget;
    },
    transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(1.0, 0.0),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      );
    },
  );
}