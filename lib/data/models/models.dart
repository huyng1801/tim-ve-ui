import 'package:flutter/material.dart';

enum RoomType {
  studio('Studio'),
  oneBedroom('1 phòng ngủ'),
  twoBedroom('2 phòng ngủ'),
  shared('Phòng trọ');

  const RoomType(this.label);
  final String label;
}

class Room {
  const Room({
    required this.id,
    required this.title,
    required this.location,
    required this.city,
    required this.price,
    required this.area,
    required this.type,
    required this.rating,
    required this.reviewCount,
    required this.imageUrls,
    required this.amenities,
    required this.description,
    required this.hostName,
  });

  final String id;
  final String title;
  final String location;
  final String city;
  final int price;
  final double area;
  final RoomType type;
  final double rating;
  final int reviewCount;
  final List<String> imageUrls;
  final List<String> amenities;
  final String description;
  final String hostName;

  String get priceLabel => '${_formatPrice(price)}đ/tháng';

  static String _formatPrice(int value) {
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

class Review {
  const Review({
    required this.userName,
    required this.rating,
    required this.comment,
    required this.date,
  });

  final String userName;
  final double rating;
  final String comment;
  final String date;
}

class AppUser {
  const AppUser({
    required this.name,
    required this.email,
    required this.phone,
    required this.avatarUrl,
    required this.bookingCount,
  });

  final String name;
  final String email;
  final String phone;
  final String avatarUrl;
  final int bookingCount;
}

class NotificationItem {
  const NotificationItem({
    required this.id,
    required this.title,
    required this.body,
    required this.time,
    required this.isRead,
    required this.icon,
  });

  final String id;
  final String title;
  final String body;
  final String time;
  final bool isRead;
  final IconData icon;
}

class ChatThread {
  const ChatThread({
    required this.id,
    required this.name,
    required this.avatarUrl,
    required this.lastMessage,
    required this.time,
    required this.unreadCount,
    required this.messages,
  });

  final String id;
  final String name;
  final String avatarUrl;
  final String lastMessage;
  final String time;
  final int unreadCount;
  final List<ChatMessage> messages;
}

class ChatMessage {
  const ChatMessage({
    required this.text,
    required this.isMe,
    required this.time,
  });

  final String text;
  final bool isMe;
  final String time;
}
