import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tim_ve_ui/core/theme/app_colors.dart';
import 'package:tim_ve_ui/core/widgets/responsive_layout.dart';
import 'package:tim_ve_ui/data/mock/mock_data.dart';
import 'package:tim_ve_ui/features/home/widgets/room_card.dart';
import 'package:tim_ve_ui/providers/favorites_provider.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favorites = context.watch<FavoritesProvider>();
    final favoriteRooms = favorites.favoritesFrom(MockData.rooms);

    return Scaffold(
      appBar: AppBar(title: const Text('Yêu thích')),
      body: ResponsiveLayout(
        maxWidth: 720,
        child: favoriteRooms.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.favorite_border,
                      size: 64,
                      color: AppColors.textSecondary.withValues(alpha: 0.5),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Chưa có phòng yêu thích',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Nhấn biểu tượng tim để lưu phòng bạn thích',
                      style: TextStyle(color: AppColors.textSecondary),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () => context.go('/home'),
                      child: const Text('Khám phá phòng'),
                    ),
                  ],
                ),
              )
            : ListView.separated(
                padding: const EdgeInsets.all(20),
                itemCount: favoriteRooms.length,
                separatorBuilder: (_, __) => const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  final room = favoriteRooms[index];
                  return RoomCard(
                    room: room,
                    onTap: () => context.push('/room/${room.id}'),
                  );
                },
              ),
      ),
    );
  }
}
