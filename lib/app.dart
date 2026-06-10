import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tim_ve_ui/core/router/app_router.dart';
import 'package:tim_ve_ui/core/theme/app_theme.dart';
import 'package:tim_ve_ui/core/widgets/responsive_layout.dart';
import 'package:tim_ve_ui/providers/auth_provider.dart';
import 'package:tim_ve_ui/providers/favorites_provider.dart';
import 'package:tim_ve_ui/providers/rooms_provider.dart';

class SmartRoomApp extends StatelessWidget {
  SmartRoomApp({super.key});

  final _authProvider = AuthProvider();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: _authProvider),
        ChangeNotifierProvider(create: (_) => FavoritesProvider()),
        ChangeNotifierProvider(create: (_) => RoomsProvider()),
      ],
      child: MaterialApp.router(
        title: 'Smart Room',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        routerConfig: createAppRouter(_authProvider),
        builder: (context, child) {
          return ResponsiveLayout(
            maxWidth: 900,
            child: child ?? const SizedBox.shrink(),
          );
        },
      ),
    );
  }
}
