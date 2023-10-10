import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_example/details_screen.dart';
import 'package:go_router_example/home_screen.dart';
import 'package:go_router_example/splash_screen.dart';
import 'package:go_router_example/tab_box.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>();

GoRouter myRouter = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/home',
    routes: [
      GoRoute(path: "/", builder: (context, state) => const SplashScreen()),
      GoRoute(
          path: "/home_screen",
          builder: (context, state) => const HomeScreen(),
          routes: [
            GoRoute(
                path: "home_detail",
                builder: (context, state) => Scaffold(
                      appBar: AppBar(
                        title: Text("Home detail"),
                      ),
                    )),
          ]),
      GoRoute(
          path: "/details_screen",
          name: "details_screen",
          builder: (context, state) {
            Map<String, dynamic> extras = state.extra as Map<String, dynamic>;
            return DetailsScreen(
              a: extras["a"] as String, //state.queryParams['a'] as String,
              b: extras["b"] as int, //int.parse(state.queryParams['b']!),
              myOrder: extras['my_order'] as MyOrder,
            );
          }),
      ShellRoute(
          navigatorKey: _shellNavigatorKey,
          builder: (context, state, child) {
            return TabBox(
              child: child,
            );
          },
          routes: [
            GoRoute(
              path: '/home',
              builder: (BuildContext context, GoRouterState state) {
                return const Center(child: Text('Home'));
              },
            ),
            GoRoute(
              path: '/search',
              builder: (BuildContext context, GoRouterState state) {
                return const Center(child: Text('Search'));
              },
            ),
            GoRoute(
              path: '/account',
              builder: (BuildContext context, GoRouterState state) {
                return const Center(child: Text('Account'));
              },
            ),
          ]),
    ]);

// ShellRoute(
//   builder:
//       (BuildContext context, GoRouterState state, Widget child) {
//     return Scaffold(
//       body: child,
//       /* ... */
//       bottomNavigationBar: BottomNavigationBar(
//         /* ... */
//       ),
//     );
//   },
//   routes: <RouteBase>[
//     GoRoute(
//       path: 'details',
//       builder: ( context,  state) {
//         return const DetailsScreen();
//       },
//     ),
//   ],
// ),
