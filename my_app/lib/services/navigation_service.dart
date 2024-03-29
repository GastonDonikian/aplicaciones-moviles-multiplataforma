import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_app/models/news.dart';
import 'package:my_app/models/volunteer_association.dart';
import 'package:my_app/pages/edit_profile.dart';
import 'package:my_app/pages/home.dart';
import 'package:my_app/pages/landing.dart';
import 'package:my_app/pages/login.dart';
import 'package:my_app/pages/news_details.dart';
import 'package:my_app/pages/not_found.dart';
import 'package:my_app/pages/signup.dart';
import 'package:my_app/pages/volunteer_association.dart';
import 'package:my_app/pages/welcome.dart';
import 'package:my_app/providers/auth_provider.dart';
import 'package:my_app/screens/apply.dart';
import 'package:my_app/screens/news.dart';
import 'package:my_app/screens/profile.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>();

final routerProvider = Provider<GoRouter>((ref) {
  ref.listen(authProvider, (previous, next) {
    if (previous != next) {
      if (next) {
        // user is now logged in
        var routeLocation = GoRouter.of(_rootNavigatorKey.currentContext!).location;
        if (routeLocation == LoginPage.routeLocation ||
            routeLocation == SignUpPage.routeLocation ||
            routeLocation == LandingPage.routeLocation) {
          GoRouter.of(_rootNavigatorKey.currentContext!).goNamed(ApplyTab.routeName);
        }
      } else {
        // user is now logged out
        var routeLocation = GoRouter.of(_rootNavigatorKey.currentContext!).location;
        final needsAuth = routeLocation != LoginPage.routeLocation &&
            routeLocation != SignUpPage.routeLocation &&
            routeLocation != LandingPage.routeLocation;
        if (needsAuth) {
          GoRouter.of(_rootNavigatorKey.currentContext!).goNamed(LandingPage.routeName);
        }
      }
    }
  });

  return GoRouter(
      navigatorKey: _rootNavigatorKey,
      initialLocation: LandingPage.routeLocation,
      routes: [
        ShellRoute(
          navigatorKey: _shellNavigatorKey,
          builder: (context, state, child) {
            return HomePage(location: state.location, child: child);
          },
          routes: [
            GoRoute(
                name: ApplyTab.routeName,
                path: ApplyTab.routeLocation,
                parentNavigatorKey: _shellNavigatorKey,
                pageBuilder: (context, state) {
                  return NoTransitionPage(child: ApplyTab());
                },
                routes: [
                  GoRoute(
                    name: VolunteerAssociationPage.routeName,
                    path: VolunteerAssociationPage.routeLocation,
                    parentNavigatorKey: _rootNavigatorKey,
                    pageBuilder: (context, state) {
                      VolunteerAssociation? association = state.extra as VolunteerAssociation?;
                      return NoTransitionPage(
                        child: VolunteerAssociationPage(
                          id: state.params['id']!,
                          maybeVolunteerAssociation: association,
                        ),
                      );
                    },
                  ),
                ]),
            GoRoute(
                name: ProfileTab.routeName,
                path: ProfileTab.routeLocation,
                parentNavigatorKey: _shellNavigatorKey,
                pageBuilder: (context, state) {
                  return const NoTransitionPage(child: ProfileTab());
                },
                routes: [
                  GoRoute(
                    name: EditProfilePage.routeName,
                    path: EditProfilePage.routeLocation,
                    parentNavigatorKey: _rootNavigatorKey,
                    builder: (context, state) => EditProfilePage(),
                  )
                ]),
            GoRoute(
                name: NewsTab.routeName,
                path: NewsTab.routeLocation,
                parentNavigatorKey: _shellNavigatorKey,
                pageBuilder: (context, state) {
                  return NoTransitionPage(child: NewsTab());
                },
                routes: [
                  GoRoute(
                    name: DetailedNews.routeName,
                    path: DetailedNews.routeLocation,
                    parentNavigatorKey: _rootNavigatorKey,
                    builder: (context, state) {
                      News? news = state.extra as News?;
                      return DetailedNews(
                        id: state.params['id']!,
                        maybeNews: news,
                      );
                    },
                  ),
                ]),
          ],
        ),
        GoRoute(
          name: LoginPage.routeName,
          path: LoginPage.routeLocation,
          builder: (context, state) => LoginPage(),
        ),
        GoRoute(
          name: SignUpPage.routeName,
          path: SignUpPage.routeLocation,
          builder: (context, state) => SignUpPage(),
        ),
        GoRoute(
          name: LandingPage.routeName,
          path: LandingPage.routeLocation,
          builder: (context, state) => const LandingPage(),
        ),
        GoRoute(
          name: WelcomePage.routeName,
          path: WelcomePage.routeLocation,
          builder: (context, state) => const WelcomePage(),
        ),
      ],
      redirect: (context, state) {
        bool isLogged = ref.read(authProvider);
        final needsAuth = state.location != LoginPage.routeLocation &&
            state.location != SignUpPage.routeLocation &&
            state.location != LandingPage.routeLocation;

        if (needsAuth) return isLogged ? null : LandingPage.routeLocation;

        if (!needsAuth && isLogged) return ApplyTab.routeLocation;

        return null;
      },
      errorBuilder: (context, state) {
        return const NotFoundPage();
      });
});
