import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phone_book/modules/contacts/models/contact.dart';
import 'package:phone_book/modules/contacts/ui/pages/create_contact_page.dart';
import 'package:phone_book/modules/contacts/ui/pages/contacts_details_page.dart';

import '../../modules/contacts/ui/pages/contacts_list._page.dart';
import '../ui/components/error_page.dart';

class R {
  static const String contactsList = '/';
  static const String createContact = '/create';
  static const String contactsDetails = '/details';
}

class AppRouter {
  late final GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    observers: <NavigatorObserver>[BotToastNavigatorObserver()],
    errorPageBuilder: (context, state) => MaterialPage<void>(
      key: state.pageKey,
      restorationId: state.pageKey.value,
      child: const ErrorPage(),
    ),
    routes: <RouteBase>[
      _route(
        path: R.contactsList,
        pageBuilder: (state) => ContactsListPage(),
        routes: [
          _route(path: R.createContact.replaceAll('/', ''), pageBuilder: (state) => CreateContactPage()),
          _route(
            path: R.contactsDetails.replaceAll('/', ''),
            pageBuilder: (state) => ContactsDetailsPage(
              contact: state.extra as Contact,
            ),
          ),
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
        pageBuilder: (BuildContext context, GoRouterState state) => getSlideTransitionPage(
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

  static CustomTransitionPage getSlideTransitionPage(
      {required BuildContext context, required GoRouterState state, required Widget child}) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) => SlideTransition(
        position: animation.drive(
          Tween<Offset>(
            begin: const Offset(1, 0),
            end: Offset.zero,
          ).chain(CurveTween(curve: Curves.easeIn)),
        ),
        child: child,
      ),
    );
  }

  static Page<dynamic> Function(BuildContext context, GoRouterState state) getSlidePageBuilder(
      {required Widget child, required bool leftToRight}) {
    return (context, state) => getSlideTransitionPage(
          context: context,
          state: state,
          child: child,
        );
  }
}
