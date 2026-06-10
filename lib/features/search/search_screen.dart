import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tim_ve_ui/core/theme/app_colors.dart';
import 'package:tim_ve_ui/core/widgets/responsive_layout.dart';
import 'package:tim_ve_ui/data/mock/mock_data.dart';
import 'package:tim_ve_ui/features/home/widgets/room_card.dart';
import 'package:tim_ve_ui/providers/rooms_provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late final TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    final provider = context.read<RoomsProvider>();
    _searchController = TextEditingController(text: provider.query);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final roomsProvider = context.watch<RoomsProvider>();
    final filteredRooms = roomsProvider.filterRooms(MockData.rooms);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tìm kiếm & Lọc'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: ResponsiveLayout(
        maxWidth: 720,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextField(
                    controller: _searchController,
                    onChanged: roomsProvider.setQuery,
                    decoration: const InputDecoration(
                      hintText: 'Tìm phòng, khu vực...',
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Thành phố',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: MockData.cities.map((city) {
                      final selected = roomsProvider.city == city;
                      return ChoiceChip(
                        label: Text(city),
                        selected: selected,
                        onSelected: (_) => roomsProvider.setCity(city),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Loại phòng',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: MockData.categories.map((category) {
                      final selected = roomsProvider.category == category;
                      return ChoiceChip(
                        label: Text(category),
                        selected: selected,
                        onSelected: (_) =>
                            roomsProvider.setCategory(category),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Giá: ${_formatPrice(roomsProvider.minPrice)} - ${_formatPrice(roomsProvider.maxPrice)}đ',
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                      TextButton(
                        onPressed: roomsProvider.resetFilters,
                        child: const Text('Đặt lại'),
                      ),
                    ],
                  ),
                  RangeSlider(
                    values: RangeValues(
                      roomsProvider.minPrice.toDouble(),
                      roomsProvider.maxPrice.toDouble(),
                    ),
                    min: 0,
                    max: 15000000,
                    divisions: 15,
                    labels: RangeLabels(
                      _formatPrice(roomsProvider.minPrice),
                      _formatPrice(roomsProvider.maxPrice),
                    ),
                    onChanged: (values) {
                      roomsProvider.setPriceRange(
                        values.start.round(),
                        values.end.round(),
                      );
                    },
                  ),
                  Text(
                    '${filteredRooms.length} phòng tìm thấy',
                    style: const TextStyle(color: AppColors.textSecondary),
                  ),
                ],
              ),
            ),
            Expanded(
              child: filteredRooms.isEmpty
                  ? const Center(child: Text('Không có kết quả'))
                  : ListView.separated(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
                      itemCount: filteredRooms.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 16),
                      itemBuilder: (context, index) {
                        final room = filteredRooms[index];
                        return RoomCard(
                          room: room,
                          onTap: () => context.push('/room/${room.id}'),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatPrice(int value) {
    final text = value.toString();
    final buffer = StringBuffer();
    for (var i = 0; i < text.length; i++) {
      if (i > 0 && (text.length - i) % 3 == 0) {
        buffer.write('.');
      }
      buffer.write(text[i]);
    }
    return buffer.toString();
  }
}
