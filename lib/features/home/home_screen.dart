import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tim_ve_ui/core/router/app_router.dart';
import 'package:tim_ve_ui/core/theme/app_colors.dart';
import 'package:tim_ve_ui/core/widgets/responsive_layout.dart';
import 'package:tim_ve_ui/data/mock/mock_data.dart';
import 'package:tim_ve_ui/features/home/widgets/room_card.dart';
import 'package:tim_ve_ui/providers/auth_provider.dart';
import 'package:tim_ve_ui/providers/rooms_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthProvider>();
    final roomsProvider = context.watch<RoomsProvider>();
    final filteredRooms = roomsProvider.filterRooms(MockData.rooms);

    return Scaffold(
      body: SafeArea(
        child: ResponsiveLayout(
          maxWidth: 720,
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Xin chào, ${auth.user?.name.split(' ').last ?? 'bạn'} 👋',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 4),
                                const Text(
                                  'Tìm phòng thuê phù hợp hôm nay',
                                  style: TextStyle(color: AppColors.textSecondary),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: () => context.push(AppRoutes.chat),
                            icon: const Icon(Icons.chat_bubble_outline),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: () => context.push(AppRoutes.search),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 14,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(color: AppColors.border),
                          ),
                          child: const Row(
                            children: [
                              Icon(Icons.search, color: AppColors.textSecondary),
                              SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  'Tìm theo khu vực, loại phòng...',
                                  style: TextStyle(color: AppColors.textSecondary),
                                ),
                              ),
                              Icon(Icons.tune, color: AppColors.primary),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [AppColors.primary, AppColors.primaryDark],
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Ưu đãi tuần này',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              'Giảm 10% cho phòng tại TP.HCM & Đà Nẵng',
                              style: TextStyle(
                                color: Colors.white.withValues(alpha: 0.9),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 40,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: MockData.categories.length,
                          separatorBuilder: (_, __) => const SizedBox(width: 8),
                          itemBuilder: (context, index) {
                            final category = MockData.categories[index];
                            final selected = roomsProvider.category == category;
                            return FilterChip(
                              label: Text(category),
                              selected: selected,
                              onSelected: (_) =>
                                  roomsProvider.setCategory(category),
                              showCheckmark: false,
                              labelStyle: TextStyle(
                                color: selected
                                    ? AppColors.primary
                                    : AppColors.textPrimary,
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Phòng nổi bật (${filteredRooms.length})',
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          TextButton(
                            onPressed: () => context.push(AppRoutes.search),
                            child: const Text('Xem tất cả'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              if (filteredRooms.isEmpty)
                const SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(
                    child: Text('Không tìm thấy phòng phù hợp'),
                  ),
                )
              else
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
                  sliver: SliverLayoutBuilder(
                    builder: (context, constraints) {
                      final width = constraints.crossAxisExtent;
                      final crossAxisCount = width >= 600 ? 2 : 1;
                      return SliverGrid(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: crossAxisCount,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                          childAspectRatio: crossAxisCount == 2 ? 0.72 : 0.85,
                        ),
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            final room = filteredRooms[index];
                            return RoomCard(
                              room: room,
                              onTap: () =>
                                  context.push('/room/${room.id}'),
                            );
                          },
                          childCount: filteredRooms.length,
                        ),
                      );
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
