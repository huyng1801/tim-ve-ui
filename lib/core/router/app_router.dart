import 'package:go_router/go_router.dart';
import 'package:tim_ve_ui/features/auth/login_screen.dart';
import 'package:tim_ve_ui/features/booking/booking_screen.dart';
import 'package:tim_ve_ui/features/chat/chat_detail_screen.dart';
import 'package:tim_ve_ui/features/chat/chat_list_screen.dart';
import 'package:tim_ve_ui/features/favorites/favorites_screen.dart';
import 'package:tim_ve_ui/features/home/home_screen.dart';
import 'package:tim_ve_ui/features/notifications/notifications_screen.dart';
import 'package:tim_ve_ui/features/profile/profile_screen.dart';
import 'package:tim_ve_ui/features/room_detail/room_detail_screen.dart';
import 'package:tim_ve_ui/features/search/search_screen.dart';
import 'package:tim_ve_ui/features/shell/app_shell.dart';
import 'package:tim_ve_ui/features/splash/splash_screen.dart';
import 'package:tim_ve_ui/providers/auth_provider.dart';

abstract final class AppRoutes {
  static const splash = '/';
  static const login = '/login';
  static const home = '/home';
  static const favorites = '/favorites';
  static const notifications = '/notifications';
  static const profile = '/profile';
  static const search = '/search';
  static const roomDetail = '/room/:id';
  static const booking = '/room/:id/booking';
  static const chat = '/chat';
  static const chatDetail = '/chat/:id';
}

GoRouter createAppRouter(AuthProvider authProvider) {
  return GoRouter(
    initialLocation: AppRoutes.splash,
    refreshListenable: authProvider,
    redirect: (context, state) {
      final isLoggedIn = authProvider.isAuthenticated;
      final location = state.matchedLocation;
      final isSplash = location == AppRoutes.splash;
      final isLogin = location == AppRoutes.login;

      if (isSplash) return null;

      if (!isLoggedIn && !isLogin) {
        return AppRoutes.login;
      }

      if (isLoggedIn && isLogin) {
        return AppRoutes.home;
      }

      return null;
    },
    routes: [
      GoRoute(
        path: AppRoutes.splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => const LoginScreen(),
      ),
      ShellRoute(
        builder: (context, state, child) => AppShell(child: child),
        routes: [
          GoRoute(
            path: AppRoutes.home,
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: HomeScreen()),
          ),
          GoRoute(
            path: AppRoutes.favorites,
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: FavoritesScreen()),
          ),
          GoRoute(
            path: AppRoutes.notifications,
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: NotificationsScreen()),
          ),
          GoRoute(
            path: AppRoutes.profile,
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: ProfileScreen()),
          ),
        ],
      ),
      GoRoute(
        path: AppRoutes.search,
        builder: (context, state) => const SearchScreen(),
      ),
      GoRoute(
        path: AppRoutes.roomDetail,
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return RoomDetailScreen(roomId: id);
        },
      ),
      GoRoute(
        path: AppRoutes.booking,
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return BookingScreen(roomId: id);
        },
      ),
      GoRoute(
        path: AppRoutes.chat,
        builder: (context, state) => const ChatListScreen(),
      ),
      GoRoute(
        path: AppRoutes.chatDetail,
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return ChatDetailScreen(threadId: id);
        },
      ),
    ],
  );
}
