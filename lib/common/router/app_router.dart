import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phone_book/phone_book_app.dart';
import 'package:phone_book/modules/contacts/ui/pages/contacts_details_page.dart';
import 'package:phone_book/modules/contacts/ui/pages/error_page.dart';

import '../../modules/contacts/ui/pages/contacts_list._page.dart';

class R {
  static const String contactsList = '/contacts';
  static const String contactsDetails = '/contacts/:cId';
}

class AppRouter {
  late final GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: PhoneBookApp.rootNavigatorKey,
    observers: <NavigatorObserver>[BotToastNavigatorObserver()],
    errorPageBuilder: (context, state) => MaterialPage<void>(
      key: state.pageKey,
      restorationId: state.pageKey.value,
      child: const ErrorPage(),
    ),
    initialLocation: R.contactsList,
    routes: <RouteBase>[
      ShellRoute(
        navigatorKey: PhoneBookApp.shellNavigatorKey,
        builder: (BuildContext context, GoRouterState state, Widget child) => ContactsListPage(),
        routes: <RouteBase>[
          _route(
            path: R.contactsDetails,
            pageBuilder: (state) => ContactsDetailsPage(
              contactId: state.pathParameters['cId'] as String,
            ),
          ),
          _route(path: R.contactsList, pageBuilder: (state) => ContactsListPage()),
        ],
      ),
      // _route(
      //   path: R.login,
      //   pageBuilder: (state) => LoginPage(
      //     initalText: state.extra as String?,
      //   ),
      // ),
    ],
  );

  GoRoute _route({
    required String path,
    required Widget Function(GoRouterState state) pageBuilder,
    List<GoRoute> routes = const [],
  }) =>
      GoRoute(
        path: path,
        routes: routes,
        pageBuilder: (BuildContext context, GoRouterState state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: pageBuilder(state),
        ),
      );

  CustomTransitionPage<T> buildPageWithDefaultTransition<T>({
    required BuildContext context,
    required GoRouterState state,
    required Widget child,
  }) =>
      CustomTransitionPage<T>(
        key: state.pageKey,
        child: child,
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(opacity: animation, alwaysIncludeSemantics: true, child: child),
        restorationId: state.pageKey.value,
      );
}
