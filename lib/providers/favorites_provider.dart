import 'package:flutter/foundation.dart';
import 'package:tim_ve_ui/data/models/models.dart';

class FavoritesProvider extends ChangeNotifier {
  final Set<String> _favoriteIds = {'2', '6'};

  bool isFavorite(String roomId) => _favoriteIds.contains(roomId);

  List<Room> favoritesFrom(List<Room> rooms) {
    return rooms.where((room) => _favoriteIds.contains(room.id)).toList();
  }

  void toggle(String roomId) {
    if (_favoriteIds.contains(roomId)) {
      _favoriteIds.remove(roomId);
    } else {
      _favoriteIds.add(roomId);
    }
    notifyListeners();
  }
}
