import 'package:bot_toast/bot_toast.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phone_book/modules/contacts/bloc/contacts_bloc.dart';
import 'package:phone_book/common/constants/app_config.dart';
import 'package:phone_book/common/router/app_router.dart';
import 'package:phone_book/common/style/appTheme/app_theme.dart';
import 'package:phone_book/common/ui/widgets/internet_error_widget.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PhoneBookApp extends StatelessWidget {
  const PhoneBookApp({Key? key}) : super(key: key);
  static final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();
  // static final GlobalKey<NavigatorState> shellNavigatorKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          Provider<AppRouter>(
            lazy: false,
            create: (BuildContext createContext) => AppRouter(),
          ),
          ChangeNotifierProvider(create: (context) => ContactsBloc()..loadContacts()),
        ],
        child: EasyLocalization(
          supportedLocales: AppConfig.supportedLocales,
          path: AppConfig.localePath,
          startLocale: AppConfig.startLocale,
          fallbackLocale: AppConfig.startLocale,
          useOnlyLangCode: true,
          child: RefreshConfiguration(
            child: Builder(
              builder: (context) {
                final GoRouter router = context.read<AppRouter>().router;
                return MaterialApp.router(
                  title: AppConfig.name,
                  theme: AppTheme.light,
                  supportedLocales: context.supportedLocales,
                  localizationsDelegates: context.localizationDelegates,
                  locale: context.locale,
                  routerConfig: router,
                  debugShowCheckedModeBanner: false,
                  builder: BotToastInit(),
                );
              },
            ),
          ),
        ),
      );

  Widget? myBuilder(BuildContext context, Widget? child) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 0.88),
      child: Builder(
        builder: (context) => Material(
          child: Column(
            children: [
              StreamBuilder<ConnectivityResult>(
                stream: Connectivity().onConnectivityChanged,
                builder: (context, AsyncSnapshot<ConnectivityResult> result) =>
                    (result.data == ConnectivityResult.mobile || result.data == ConnectivityResult.wifi)
                        ? SafeArea(bottom: false, child: Container())
                        : const InternetError(),
              ),
              Expanded(
                child: MediaQuery(
                  data: MediaQuery.of(context).copyWith(padding: MediaQuery.of(context).padding.copyWith(top: 0)),
                  child: SafeArea(child: child!),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
