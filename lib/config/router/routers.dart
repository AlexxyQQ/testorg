import 'package:flutter/material.dart';
import 'package:musync/features/auth/presentation/widgets/main_auth_page.dart';
import 'package:musync/features/auth/presentation/view/login_page.dart';
import 'package:musync/features/auth/presentation/view/signup_page.dart';
import 'package:musync/features/home/presentation/widgets/bottomNav/bottom_nav.dart';
import 'package:musync/features/nowplaying/presentation/view/nowplaying.dart';
import 'package:musync/features/onboarding/presentation/view/on_boarding_page.dart';
import 'package:on_audio_query/on_audio_query.dart';

class Routes {
  static const String initialRoute = '/';
  static const String loginRoute = '/login';
  static const String signupRoute = '/signup';
  static const String homeRoute = '/home';
  static const String getStartedRoute = '/welcome';
  static const String onBoardingRoute = '/onBoarding';
  static const String forgotPasswordRoute = '/forgotPassword';
  static const String nowPlaying = '/nowPlaying';

  static final Map<String, Widget Function(BuildContext)> loggedinRoute = {
    initialRoute: (context) => const OnBoardingPage(),
    getStartedRoute: (context) => const MainAuthPage(),
    loginRoute: (context) => const LoginPage(),
    signupRoute: (context) => const SignupPage(),
    homeRoute: (context) => const BottomNavBar(),
    nowPlaying: (context) => NowPlaying(
          songList: (ModalRoute.of(context)?.settings.arguments
              as Map<String, dynamic>)['songs'] as List<SongModel>,
          index: (ModalRoute.of(context)?.settings.arguments
              as Map<String, dynamic>)['index'] as int,
        ),
  };
  static final Map<String, Widget Function(BuildContext)> loggedoutRoute = {
    initialRoute: (context) => const OnBoardingPage(),
    getStartedRoute: (context) => const MainAuthPage(),
    loginRoute: (context) => const LoginPage(),
    signupRoute: (context) => const SignupPage(),
    homeRoute: (context) => const BottomNavBar(),
    nowPlaying: (context) => NowPlaying(
          songList: (ModalRoute.of(context)?.settings.arguments
              as Map<String, dynamic>)['songs'] as List<SongModel>,
          index: (ModalRoute.of(context)?.settings.arguments
              as Map<String, dynamic>)['index'] as int,
        ),
  };

  static List<Route<dynamic>> generateInitialRoutes({
    required String initialRoute,
    required BuildContext context,
    required bool isFirstTime,
    required bool goHome,
  }) {
    if (initialRoute == '/') {
      if (MediaQuery.of(context).size.width >= 900) {
        return [
          MaterialPageRoute(
            builder: (context) {
              if (!isFirstTime && goHome) {
                return const BottomNavBar();
              } else {
                return const Placeholder(); //TabOnboarding();
              }
            },
          ),
        ];
      } else {
        return [
          MaterialPageRoute(
            builder: (context) {
              if (!isFirstTime && goHome) {
                return const BottomNavBar();
              } else if (!isFirstTime) {
                return const MainAuthPage();
              } else {
                return const OnBoardingPage();
              }
            },
          ),
        ];
      }
    }
    return [];
  }
}
