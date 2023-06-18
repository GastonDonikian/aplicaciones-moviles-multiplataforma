import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_app/models/volunteer_association.dart';
import 'package:my_app/pages/home.dart';
import 'package:my_app/pages/landing.dart';
import 'package:my_app/pages/login.dart';
import 'package:my_app/pages/news_details.dart';
import 'package:my_app/pages/signup.dart';
import 'package:my_app/pages/volunteer_association.dart';
import 'package:my_app/pages/welcome.dart';
import 'package:my_app/screens/apply.dart';
import 'package:my_app/screens/news.dart';
import 'package:my_app/screens/profile.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/landing',
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return HomePage(location: state.location, child: child);
      },
      routes: [
        GoRoute(
            name: "home",
            path: '/home',
            parentNavigatorKey: _shellNavigatorKey,
            builder: (context, state) {
              return const ApplyTab();
            },
            routes: [
              GoRoute(
                  name: 'association',
                  path: 'association/:id',
                  parentNavigatorKey: _rootNavigatorKey,
                  builder: (context, state) {
                    VolunteerAssociation association = state.extra! as VolunteerAssociation;
                    return VolunteerAssociationPage(
                      id: state.params['id']!,
                      volunteerAssociation: association,
                    );
                  }),
            ]),
        GoRoute(
            name: "profile",
            path: '/profile',
            parentNavigatorKey: _shellNavigatorKey,
            builder: (context, state) {
              return const ProfileTab();
            }),
        GoRoute(
            name: "news",
            path: '/news',
            parentNavigatorKey: _shellNavigatorKey,
            builder: (context, state) {
              return const NewsTab();
            }),
      ],
    ),
    GoRoute(
      name: 'login',
      path: '/login',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      name: 'signup',
      path: '/signup',
      builder: (context, state) => const SignUpPage(),
    ),
    GoRoute(
      name: 'landing',
      path: '/landing',
      builder: (context, state) => const LandingPage(),
    ),
    GoRoute(
      name: 'welcom',
      path: '/welcome',
      builder: (context, state) => const WelcomePage(),
    ),
    GoRoute(
      name: 'news_details',
      path: '/news_details',
      builder: (context, state) => const DetailedNews(),
    )
  ],
);
