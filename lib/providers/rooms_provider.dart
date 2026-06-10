import 'package:flutter/foundation.dart';
import 'package:tim_ve_ui/data/models/models.dart';

class RoomsProvider extends ChangeNotifier {
  String _query = '';
  String _category = 'Tất cả';
  String _city = 'Tất cả';
  int _minPrice = 0;
  int _maxPrice = 15000000;

  String get query => _query;
  String get category => _category;
  String get city => _city;
  int get minPrice => _minPrice;
  int get maxPrice => _maxPrice;

  void setQuery(String value) {
    _query = value;
    notifyListeners();
  }

  void setCategory(String value) {
    _category = value;
    notifyListeners();
  }

  void setCity(String value) {
    _city = value;
    notifyListeners();
  }

  void setPriceRange(int min, int max) {
    _minPrice = min;
    _maxPrice = max;
    notifyListeners();
  }

  void resetFilters() {
    _query = '';
    _category = 'Tất cả';
    _city = 'Tất cả';
    _minPrice = 0;
    _maxPrice = 15000000;
    notifyListeners();
  }

  List<Room> filterRooms(List<Room> rooms) {
    return rooms.where((room) {
      final matchesQuery = _query.isEmpty ||
          room.title.toLowerCase().contains(_query.toLowerCase()) ||
          room.location.toLowerCase().contains(_query.toLowerCase()) ||
          room.city.toLowerCase().contains(_query.toLowerCase());

      final matchesCategory =
          _category == 'Tất cả' || room.type.label == _category;

      final matchesCity = _city == 'Tất cả' || room.city == _city;

      final matchesPrice =
          room.price >= _minPrice && room.price <= _maxPrice;

      return matchesQuery &&
          matchesCategory &&
          matchesCity &&
          matchesPrice;
    }).toList();
  }
}
