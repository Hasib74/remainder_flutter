import 'package:filednote/presentation/auth/auth.dart';
import 'package:filednote/presentation/mainFeatures/experiments/screen/experiment_screen.dart';
import 'package:filednote/presentation/mainFeatures/experiments/sector/add_experiment.dart';
import 'package:filednote/presentation/mainFeatures/root/screen/root_drawer.dart';
import 'package:filednote/presentation/mainFeatures/root/screen/root_screen.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:filednote/domain/authentication.dart';
import 'package:filednote/presentation/homeScreen/home_screen.dart';
import 'package:filednote/presentation/splash_screen.dart';

import '../../presentation/auth/section/signIn/sign_in_screen.dart';
import '../../presentation/auth/section/signUp/sign_up_screen.dart';
import '../../presentation/mainFeatures/dashBoard/screen/dash_board_screen.dart';
import '../../presentation/onBoarding/on_boarding_screen.dart';
import 'app_routes.dart';

class RouterNotifier extends ChangeNotifier {
  final Ref _ref;

  RouterNotifier(this._ref) {
    _ref.listen(checkAuthorizeProvider, (previous, next) {
      print("checkAuthorizeProvider Previous :  ${previous}");
      print("checkAuthorizeProvider Next : ${next}");
    });

    /*_ref.listen<AuthState>(
      authNotifierProvider,
          (_, __) => notifyListeners(),
    );*/
  }

  /* String? redirectLogic(BuildContext context, GoRouterState state) {
    final authState = _ref.read(authNotifierProvider);

    final areWeSigningIn = state.matchedLocation == RouteNames.signInRoute;

    return authState.maybeMap(
      authenticated: (_) => areWeSigningIn ? RouteNames.homeRoute : null,
      orElse: () => areWeSigningIn ? null : RouteNames.signInRoute,
    );
  }
*/
  List<RouteBase> get routes {
    return [
      GoRoute(
        name: AppRoutes.splashScreen,
        path: AppRoutes.splashScreen,
        builder: (context, state) => SplashScreen(),
      ),
      GoRoute(
        name: AppRoutes.homeScreen,
        path: AppRoutes.homeScreen,
        builder: (context, state) => HomeScreen(),
      ),
      GoRoute(
          path: AppRoutes.onBoarding,
          name: AppRoutes.onBoarding,
          builder: (context, state) => const ObBoardingScreen()),
      GoRoute(
          path: AppRoutes.auth,
          name: AppRoutes.auth,
          builder: (context, state) => const AuthScreen()),
      GoRoute(
          path: AppRoutes.signIn,
          name: AppRoutes.signIn,
          builder: (context, state) => const SignInScreen()),
      GoRoute(
          path: AppRoutes.signUp,
          name: AppRoutes.signUp,
          builder: (context, state) => const SignUpScreen()),
      StatefulShellRoute(
          branches: [
            StatefulShellBranch(initialLocation: AppRoutes.dashBoard, routes: [
              GoRoute(
                  path: AppRoutes.dashBoard,
                  name: AppRoutes.dashBoard,
                  builder: (context, state) => const DashBoardScreen()),
            ]),
            StatefulShellBranch(routes: [
              GoRoute(
                  path: AppRoutes.addExp,
                  name: AppRoutes.addExp,
                  builder: (context, state) => const ExperimentScreen()),
            ])
          ],

          /*pageBuilder: (context , state , shell){

            return Page();

          },*/

          builder: (BuildContext context, GoRouterState state,
              StatefulNavigationShell navigationShell) {
            return RootScreen(
              key: state.pageKey,
              navigationShell: navigationShell,
              child: navigationShell,
            );
            ;
          },
          navigatorContainerBuilder: (BuildContext context,
              StatefulNavigationShell navigationShell, List<Widget> children) {
            return RootScreen(
              navigationShell: navigationShell,
              child: children[navigationShell.currentIndex],
            );
          })

      /*  ShellRoute(
          builder: (context, state, child) => RootScreen(
                key: state.pageKey,
                child: child,
              ),
          navigatorKey: AppRoutes.shellNavigatorKey,
          routes: [
            GoRoute(
                builder: (context, state) {
                  return RootDrawer();
                },
                path: AppRoutes.rootDrawer,
                name: AppRoutes.rootDrawer,
                routes: [
                  GoRoute(
                      path: AppRoutes.dashBoard,
                      name: AppRoutes.dashBoard,
                      builder: (context, state) => const DashBoardScreen()),
                  GoRoute(
                      path: AppRoutes.addExp,
                      name: AppRoutes.addExp,
                      builder: (context, state) => const AddExperiments()),
                ])
          ]),*/

      /*  GoRoute(
          path: AppRoutes.rootScreen,
          name: AppRoutes.rootScreen,
          builder: (context, state) =>  RootScreen()),
*/
      /*   StatefulShellRoute(branches: branches, navigatorContainerBuilder: (context){
        return ProviderScope(
          child: context.navigator,
        );
      })*/
    ];
  }

  ShellRoute RootScreenShellRoute({
    required BuildContext context,
    required GlobalKey<NavigatorState> key,
    required Widget Function(
            BuildContext context, GoRouterState state, Widget child)?
        builder,
  }) =>
      ShellRoute(builder: builder, navigatorKey: key, routes: [
        GoRoute(
            path: AppRoutes.addExp,
            name: AppRoutes.addExp,
            builder: (context, state) => const AddExperiments()),
        GoRoute(
            path: AppRoutes.dashBoard,
            name: AppRoutes.dashBoard,
            builder: (context, state) => const DashBoardScreen()),
      ]);
}
