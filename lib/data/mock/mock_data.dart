import 'package:flutter/material.dart';
import 'package:tim_ve_ui/core/constants/demo_credentials.dart';
import 'package:tim_ve_ui/data/models/models.dart';

abstract final class MockData {
  static const categories = [
    'Tất cả',
    'Studio',
    '1 phòng ngủ',
    '2 phòng ngủ',
    'Phòng trọ',
  ];

  static const cities = ['Tất cả', 'Hà Nội', 'TP.HCM', 'Đà Nẵng'];

  static AppUser get demoUser => AppUser(
        name: DemoCredentials.name,
        email: DemoCredentials.email,
        phone: DemoCredentials.phone,
        avatarUrl: 'https://i.pravatar.cc/150?u=demo-user',
        bookingCount: 3,
      );

  static const reviews = [
    Review(
      userName: 'Lan Phương',
      rating: 5,
      comment: 'Phòng sạch sẽ, chủ nhà thân thiện và phản hồi nhanh.',
      date: '2 tuần trước',
    ),
    Review(
      userName: 'Hoàng Tuấn',
      rating: 4.5,
      comment: 'Vị trí thuận tiện đi làm, tiện ích đầy đủ.',
      date: '1 tháng trước',
    ),
    Review(
      userName: 'Thu Hà',
      rating: 4.8,
      comment: 'Không gian yên tĩnh, giá hợp lý so với khu vực.',
      date: '1 tháng trước',
    ),
  ];

  static final rooms = [
    Room(
      id: '1',
      title: 'Studio hiện đại gần công viên',
      location: 'Cầu Giấy',
      city: 'Hà Nội',
      price: 5500000,
      area: 28,
      type: RoomType.studio,
      rating: 4.8,
      reviewCount: 42,
      imageUrls: [
        'https://images.unsplash.com/photo-1522708323590-d24dbb6b0267?w=800',
        'https://images.unsplash.com/photo-1502672260266-1c1ef2d93688?w=800',
      ],
      amenities: ['Wifi', 'Máy lạnh', 'Thang máy', 'Bảo vệ 24/7'],
      description:
          'Studio thoáng mát, nội thất mới, gần trung tâm thương mại và công viên. Phù hợp sinh viên và người đi làm.',
      hostName: 'Chị Mai',
    ),
    Room(
      id: '2',
      title: 'Căn hộ 1PN view thành phố',
      location: 'Quận 2',
      city: 'TP.HCM',
      price: 8200000,
      area: 45,
      type: RoomType.oneBedroom,
      rating: 4.9,
      reviewCount: 67,
      imageUrls: [
        'https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?w=800',
        'https://images.unsplash.com/photo-1493809842364-78817add7ffb?w=800',
      ],
      amenities: ['Hồ bơi', 'Gym', 'Bãi xe', 'Ban công'],
      description:
          'Căn hộ cao cấp với view sông Sài Gòn, tiện ích nội khu đầy đủ, an ninh tốt.',
      hostName: 'Anh Đức',
    ),
    Room(
      id: '3',
      title: 'Phòng trọ sạch sẽ gần ĐH',
      location: 'Hai Bà Trưng',
      city: 'Hà Nội',
      price: 3200000,
      area: 18,
      type: RoomType.shared,
      rating: 4.5,
      reviewCount: 28,
      imageUrls: [
        'https://images.unsplash.com/photo-1555854877-bab0e564b8d5?w=800',
      ],
      amenities: ['Wifi', 'Máy giặt chung', 'Bảo vệ'],
      description: 'Phòng trọ yên tĩnh, gần các trường đại học, có chỗ để xe.',
      hostName: 'Cô Hương',
    ),
    Room(
      id: '4',
      title: 'Căn 2PN gia đình tiện nghi',
      location: 'Ngũ Hành Sơn',
      city: 'Đà Nẵng',
      price: 9500000,
      area: 68,
      type: RoomType.twoBedroom,
      rating: 4.7,
      reviewCount: 35,
      imageUrls: [
        'https://images.unsplash.com/photo-1484154218962-a197022b5858?w=800',
        'https://images.unsplash.com/photo-1564013799919-ab600027ffc6?w=800',
      ],
      amenities: ['Bếp riêng', 'Máy lạnh', 'Ban công', 'Thang máy'],
      description: 'Căn hộ rộng rãi, gần biển, phù hợp gia đình nhỏ hoặc chia sẻ.',
      hostName: 'Anh Phong',
    ),
    Room(
      id: '5',
      title: 'Studio mini gần metro',
      location: 'Bình Thạnh',
      city: 'TP.HCM',
      price: 4800000,
      area: 22,
      type: RoomType.studio,
      rating: 4.6,
      reviewCount: 51,
      imageUrls: [
        'https://images.unsplash.com/photo-1536376072261-38c8d6a5a223?w=800',
      ],
      amenities: ['Wifi', 'Máy lạnh', 'Gần metro'],
      description: 'Studio nhỏ gọn, đi làm thuận tiện, có siêu thị bên dưới.',
      hostName: 'Chị Linh',
    ),
    Room(
      id: '6',
      title: 'Phòng 1PN nội thất sang trọng',
      location: 'Tây Hồ',
      city: 'Hà Nội',
      price: 7800000,
      area: 40,
      type: RoomType.oneBedroom,
      rating: 4.9,
      reviewCount: 73,
      imageUrls: [
        'https://images.unsplash.com/photo-1505693416388-ac5ce068fe85?w=800',
        'https://images.unsplash.com/photo-1560185127-6ed189bf02f4?w=800',
      ],
      amenities: ['View hồ', 'Bếp', 'Máy lạnh', 'Thang máy'],
      description: 'View Hồ Tây tuyệt đẹp, không gian sống cao cấp.',
      hostName: 'Anh Khánh',
    ),
    Room(
      id: '7',
      title: 'Phòng trọ giá tốt trung tâm',
      location: 'Hải Châu',
      city: 'Đà Nẵng',
      price: 2800000,
      area: 16,
      type: RoomType.shared,
      rating: 4.3,
      reviewCount: 19,
      imageUrls: [
        'https://images.unsplash.com/photo-1586023492125-27b2c045efd7?w=800',
      ],
      amenities: ['Wifi', 'Quạt', 'Chỗ để xe'],
      description: 'Phòng trọ giá rẻ, gần chợ và bến xe.',
      hostName: 'Chú Tám',
    ),
    Room(
      id: '8',
      title: 'Căn 2PN view biển Mỹ Khê',
      location: 'Sơn Trà',
      city: 'Đà Nẵng',
      price: 11000000,
      area: 72,
      type: RoomType.twoBedroom,
      rating: 5.0,
      reviewCount: 88,
      imageUrls: [
        'https://images.unsplash.com/photo-1613490493576-7fde63acd811?w=800',
        'https://images.unsplash.com/photo-1600596542815-ffad4c1539a9?w=800',
      ],
      amenities: ['View biển', 'Hồ bơi', 'Gym', 'Bãi xe'],
      description: 'Căn hộ cao cấp sát biển, tiện ích resort.',
      hostName: 'Chị Ngọc',
    ),
    Room(
      id: '9',
      title: 'Studio co-working friendly',
      location: 'Quận 1',
      city: 'TP.HCM',
      price: 6500000,
      area: 30,
      type: RoomType.studio,
      rating: 4.7,
      reviewCount: 44,
      imageUrls: [
        'https://images.unsplash.com/photo-1631049307264-da0ec9d70304?w=800',
      ],
      amenities: ['Wifi mạnh', 'Bàn làm việc', 'Máy lạnh'],
      description: 'Không gian làm việc tại nhà thoải mái, gần quán cà phê.',
      hostName: 'Anh Minh',
    ),
    Room(
      id: '10',
      title: 'Phòng 1PN gần công viên',
      location: 'Đống Đa',
      city: 'Hà Nội',
      price: 5900000,
      area: 35,
      type: RoomType.oneBedroom,
      rating: 4.6,
      reviewCount: 31,
      imageUrls: [
        'https://images.unsplash.com/photo-1560448075-bb485b067938?w=800',
      ],
      amenities: ['Wifi', 'Máy lạnh', 'Ban công nhỏ'],
      description: 'Phòng thoáng, gần công viên và siêu thị.',
      hostName: 'Chị Thảo',
    ),
  ];

  static final notifications = [
    NotificationItem(
      id: 'n1',
      title: 'Đặt phòng thành công',
      body: 'Bạn đã đặt Studio hiện đại gần công viên. Chủ nhà sẽ liên hệ sớm.',
      time: '5 phút trước',
      isRead: false,
      icon: Icons.check_circle_outline,
    ),
    NotificationItem(
      id: 'n2',
      title: 'Giảm giá cuối tuần',
      body: 'Giảm 10% cho 5 phòng tại TP.HCM trong tuần này.',
      time: '2 giờ trước',
      isRead: false,
      icon: Icons.local_offer_outlined,
    ),
    NotificationItem(
      id: 'n3',
      title: 'Tin nhắn mới',
      body: 'Chị Mai: "Bạn có thể xem phòng vào 14h chiều nay không?"',
      time: 'Hôm qua',
      isRead: true,
      icon: Icons.chat_bubble_outline,
    ),
    NotificationItem(
      id: 'n4',
      title: 'Nhắc lịch thanh toán',
      body: 'Hóa đơn tháng 6 sẽ đến hạn vào 15/06.',
      time: '2 ngày trước',
      isRead: true,
      icon: Icons.payment_outlined,
    ),
  ];

  static final chatThreads = [
    ChatThread(
      id: 'c1',
      name: 'Chị Mai',
      avatarUrl: 'https://i.pravatar.cc/150?u=host1',
      lastMessage: 'Bạn có thể xem phòng vào 14h chiều nay không?',
      time: '10:30',
      unreadCount: 2,
      messages: [
        ChatMessage(
          text: 'Chào bạn, phòng vẫn còn trống nhé.',
          isMe: false,
          time: '09:15',
        ),
        ChatMessage(
          text: 'Dạ em muốn đặt lịch xem phòng ạ.',
          isMe: true,
          time: '09:20',
        ),
        ChatMessage(
          text: 'Bạn có thể xem phòng vào 14h chiều nay không?',
          isMe: false,
          time: '10:30',
        ),
      ],
    ),
    ChatThread(
      id: 'c2',
      name: 'Anh Đức',
      avatarUrl: 'https://i.pravatar.cc/150?u=host2',
      lastMessage: 'Cảm ơn bạn, hẹn gặp lại!',
      time: 'Hôm qua',
      unreadCount: 0,
      messages: [
        ChatMessage(
          text: 'Phòng view rất đẹp, em cảm ơn anh.',
          isMe: true,
          time: '16:00',
        ),
        ChatMessage(
          text: 'Cảm ơn bạn, hẹn gặp lại!',
          isMe: false,
          time: '16:05',
        ),
      ],
    ),
    ChatThread(
      id: 'c3',
      name: 'Hỗ trợ Easy Room',
      avatarUrl: 'https://i.pravatar.cc/150?u=support',
      lastMessage: 'Chúng tôi luôn sẵn sàng hỗ trợ bạn 24/7.',
      time: '3 ngày trước',
      unreadCount: 0,
      messages: [
        ChatMessage(
          text: 'Xin chào! Bạn cần hỗ trợ gì không?',
          isMe: false,
          time: '08:00',
        ),
        ChatMessage(
          text: 'Chúng tôi luôn sẵn sàng hỗ trợ bạn 24/7.',
          isMe: false,
          time: '08:01',
        ),
      ],
    ),
  ];

  static Room? roomById(String id) {
    try {
      return rooms.firstWhere((room) => room.id == id);
    } catch (_) {
      return null;
    }
  }

  static ChatThread? chatById(String id) {
    try {
      return chatThreads.firstWhere((thread) => thread.id == id);
    } catch (_) {
      return null;
    }
  }
}
