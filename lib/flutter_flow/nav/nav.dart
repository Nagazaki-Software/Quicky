import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';

import '/auth/base_auth_user_provider.dart';

import '/main.dart';
import '/flutter_flow/flutter_flow_util.dart';

import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? NavBarPage() : GetstartedWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? NavBarPage() : GetstartedWidget(),
        ),
        FFRoute(
          name: PaginaInicialWidget.routeName,
          path: PaginaInicialWidget.routePath,
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'PaginaInicial')
              : PaginaInicialWidget(),
        ),
        FFRoute(
          name: GetstartedWidget.routeName,
          path: GetstartedWidget.routePath,
          builder: (context, params) => GetstartedWidget(),
        ),
        FFRoute(
          name: PaginaNotificacoesWidget.routeName,
          path: PaginaNotificacoesWidget.routePath,
          builder: (context, params) => PaginaNotificacoesWidget(),
        ),
        FFRoute(
          name: PaginaDeCriarContaWidget.routeName,
          path: PaginaDeCriarContaWidget.routePath,
          builder: (context, params) => PaginaDeCriarContaWidget(),
        ),
        FFRoute(
          name: TaskWidget.routeName,
          path: TaskWidget.routePath,
          builder: (context, params) => TaskWidget(
            task: params.getParam(
              'task',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['tasks'],
            ),
          ),
        ),
        FFRoute(
          name: EntrarWidget.routeName,
          path: EntrarWidget.routePath,
          builder: (context, params) => EntrarWidget(),
        ),
        FFRoute(
          name: EsqueciMinhaSenhWidget.routeName,
          path: EsqueciMinhaSenhWidget.routePath,
          builder: (context, params) => EsqueciMinhaSenhWidget(),
        ),
        FFRoute(
          name: PaginaNotificacoesCopyWidget.routeName,
          path: PaginaNotificacoesCopyWidget.routePath,
          builder: (context, params) => PaginaNotificacoesCopyWidget(),
        ),
        FFRoute(
          name: PerfilDoUsuarioWidget.routeName,
          path: PerfilDoUsuarioWidget.routePath,
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'PerfilDoUsuario')
              : PerfilDoUsuarioWidget(),
        ),
        FFRoute(
          name: PaginaExploreWidget.routeName,
          path: PaginaExploreWidget.routePath,
          builder: (context, params) => PaginaExploreWidget(),
        ),
        FFRoute(
          name: ConfiguracoessWidget.routeName,
          path: ConfiguracoessWidget.routePath,
          builder: (context, params) => ConfiguracoessWidget(),
        ),
        FFRoute(
          name: TeladeeditarperfilWidget.routeName,
          path: TeladeeditarperfilWidget.routePath,
          builder: (context, params) => TeladeeditarperfilWidget(),
        ),
        FFRoute(
          name: ConversaWidget.routeName,
          path: ConversaWidget.routePath,
          builder: (context, params) => ConversaWidget(
            chatReference: params.getParam(
              'chatReference',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['chat'],
            ),
          ),
        ),
        FFRoute(
          name: ChatWidget.routeName,
          path: ChatWidget.routePath,
          builder: (context, params) =>
              params.isEmpty ? NavBarPage(initialPage: 'chat') : ChatWidget(),
        ),
        FFRoute(
          name: PaginaDeInserirCodigoWidget.routeName,
          path: PaginaDeInserirCodigoWidget.routePath,
          builder: (context, params) => PaginaDeInserirCodigoWidget(),
        ),
        FFRoute(
          name: PaginaDeVerificarEmailWidget.routeName,
          path: PaginaDeVerificarEmailWidget.routePath,
          builder: (context, params) => PaginaDeVerificarEmailWidget(),
        ),
        FFRoute(
          name: PaginaDeConectarSuaContaWidget.routeName,
          path: PaginaDeConectarSuaContaWidget.routePath,
          builder: (context, params) => PaginaDeConectarSuaContaWidget(),
        ),
        FFRoute(
          name: PaginaBemVindosWidget.routeName,
          path: PaginaBemVindosWidget.routePath,
          builder: (context, params) => PaginaBemVindosWidget(),
        ),
        FFRoute(
          name: PaginaQualSeuNomeWidget.routeName,
          path: PaginaQualSeuNomeWidget.routePath,
          builder: (context, params) => PaginaQualSeuNomeWidget(),
        ),
        FFRoute(
          name: PaginaDoSeuAniversarioWidget.routeName,
          path: PaginaDoSeuAniversarioWidget.routePath,
          builder: (context, params) => PaginaDoSeuAniversarioWidget(),
        ),
        FFRoute(
          name: PaginaDeQualGeneroWidget.routeName,
          path: PaginaDeQualGeneroWidget.routePath,
          builder: (context, params) => PaginaDeQualGeneroWidget(),
        ),
        FFRoute(
          name: BiubibubibubCopyWidget.routeName,
          path: BiubibubibubCopyWidget.routePath,
          builder: (context, params) => BiubibubibubCopyWidget(),
        ),
        FFRoute(
          name: PaginaDistanciaMaximaWidget.routeName,
          path: PaginaDistanciaMaximaWidget.routePath,
          builder: (context, params) => PaginaDistanciaMaximaWidget(),
        ),
        FFRoute(
          name: PaginaOqueEstaProcurandoWidget.routeName,
          path: PaginaOqueEstaProcurandoWidget.routePath,
          builder: (context, params) => PaginaOqueEstaProcurandoWidget(),
        ),
        FFRoute(
          name: EditarperfilWidget.routeName,
          path: EditarperfilWidget.routePath,
          builder: (context, params) => EditarperfilWidget(),
        ),
        FFRoute(
          name: CriartaskWidget.routeName,
          path: CriartaskWidget.routePath,
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'criartask')
              : CriartaskWidget(),
        ),
        FFRoute(
          name: PaginaDePreferenciasDePrivacidadeWidget.routeName,
          path: PaginaDePreferenciasDePrivacidadeWidget.routePath,
          builder: (context, params) =>
              PaginaDePreferenciasDePrivacidadeWidget(),
        ),
        FFRoute(
          name: CrieumapaginadepoliticadecookiesWidget.routeName,
          path: CrieumapaginadepoliticadecookiesWidget.routePath,
          builder: (context, params) =>
              CrieumapaginadepoliticadecookiesWidget(),
        ),
        FFRoute(
          name: LoginBETAWidget.routeName,
          path: LoginBETAWidget.routePath,
          builder: (context, params) => LoginBETAWidget(),
        ),
        FFRoute(
          name: InformacoesDaConversaWidget.routeName,
          path: InformacoesDaConversaWidget.routePath,
          builder: (context, params) => InformacoesDaConversaWidget(
            chatReference: params.getParam(
              'chatReference',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['chat'],
            ),
          ),
        ),
        FFRoute(
          name: ConfirmarEmailWidget.routeName,
          path: ConfirmarEmailWidget.routePath,
          builder: (context, params) => ConfirmarEmailWidget(),
        ),
        FFRoute(
          name: ExploretasksWidget.routeName,
          path: ExploretasksWidget.routePath,
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'exploretasks')
              : ExploretasksWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/getstarted';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: Color(0xFF0F0700),
                  child: Center(
                    child: Image.asset(
                      'assets/images/Ativo_2.png',
                      width: 250.0,
                      fit: BoxFit.contain,
                    ),
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
