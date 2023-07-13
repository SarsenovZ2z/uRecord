import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:urecord/src/features/auth/presentation/pages/login_screen.dart';
import 'package:urecord/src/features/auth/presentation/pages/register_screen.dart';
import 'package:urecord/src/features/auth/presentation/pages/verification_screen.dart';
import 'package:urecord/src/features/auth/presentation/widgets/middlewares/authenticated_only_middleware.dart';
import 'package:urecord/src/features/auth/presentation/widgets/middlewares/guests_only_middleware.dart';
import 'package:urecord/src/features/home/presentation/pages/home_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      pageBuilder: (context, state) => CupertinoPage(
        key: state.pageKey,
        title: 'Listen',
        child: const AuthenticatedOnlyMiddleware(
          child: CupertinoPageScaffold(
            child: HomeScreen(),
          ),
        ),
      ),
    ),
    GoRoute(
      path: '/login',
      pageBuilder: (context, state) => CupertinoPage(
        key: state.pageKey,
        title: 'Sign In',
        child: const GuestsOnlyMiddleware(
          child: LoginScreen(),
        ),
      ),
    ),
    GoRoute(
      path: '/register',
      pageBuilder: (context, state) => CupertinoPage(
        key: state.pageKey,
        title: 'Sign Up',
        child: const GuestsOnlyMiddleware(
          child: RegisterScreen(),
        ),
      ),
    ),
    GoRoute(
      path: '/verification',
      pageBuilder: (context, state) => CupertinoPage(
        key: state.pageKey,
        title: 'Almost There',
        child: const GuestsOnlyMiddleware(
          child: VerificationScreen(),
        ),
      ),
    ),
  ],
);
