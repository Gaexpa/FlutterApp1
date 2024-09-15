import 'package:demo/pages/home_page.dart';
import 'package:demo/pages/pet/pet_page.dart';
import 'package:demo/pages/wrappers/main_wrapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class AppNavigation {
  /// 不知道幹嘛用的
  AppNavigation._();

  /// 設定Go Router初始的頁面
  static String initR = "/home";

  /// Private Navigators Keys
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _rootNavigatorHome =
      GlobalKey<NavigatorState>(debugLabel: "shellHome");
  static final _rootNavigatorPet =
  GlobalKey<NavigatorState>(debugLabel: "shellPet");

  /// Go Router 設定
  static final GoRouter router = GoRouter(
    initialLocation: initR,
    navigatorKey: _rootNavigatorKey,
    routes: <RouteBase>[
      /// MainWrapper Route
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainWrapper(navigationShell: navigationShell,);
        },
        branches: <StatefulShellBranch>[
          /// Branch Home
          StatefulShellBranch(
            navigatorKey: _rootNavigatorHome,
            routes: [
              GoRoute(
                  path: "/home",
                  name: "Home",
                  builder: (context, state) {
                    return HomePage(
                      key: state.pageKey,
                    );
                  })
            ],
          ),
          /// Branch Pet
          StatefulShellBranch(
            navigatorKey: _rootNavigatorPet,
            routes: [
              GoRoute(
                  path: "/pet",
                  name: "Pet",
                  builder: (context, state) {
                    return PetPage(
                      key: state.pageKey,
                    );
                  })
            ],
          ),
        ],
      ),
    ],
  );
}
