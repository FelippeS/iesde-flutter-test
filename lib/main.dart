import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:processo_selecao_iesde/common/theme.dart';
import 'package:processo_selecao_iesde/screens/cart.dart';
import 'package:processo_selecao_iesde/screens/catalog.dart';
import 'package:processo_selecao_iesde/screens/login.dart';

void main() {
  runApp(const MyApp());
}

GoRouter router() {
  return GoRouter(
    initialLocation: '/login',
    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) => const MyLogin(),
      ),
      GoRoute(
        path: '/catalog',
        builder: (context, state) => const MyCatalog(),
        routes: [
          GoRoute(
            path: 'cart',
            builder: (context, state) => const MyCart(),
          ),
        ],
      ),
    ],
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp.router(
      title: 'Teste',
      theme: appTheme,
      routerConfig: router(),
    );

  }
}
