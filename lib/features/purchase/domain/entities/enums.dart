import 'package:json_annotation/json_annotation.dart';

/// وضعیت پرداخت فاکتور
enum PaymentStatus { unpaid, partial, paid }

@JsonEnum(valueField: 'code')
enum StatusCodeEnhanced {
  success(200),
  movedPermanently(301),
  found(302),
  internalServerError(500);

  const StatusCodeEnhanced(this.code);

  final int code;
}

/// وضعیت تحویل
enum DeliveryStatus { pending, shipped, delivered }

enum UserRank { accountant, support, analyst, developer, assistant, user }

class UserRankHelper {
  static const Map<UserRank, int> _codes = {
    UserRank.accountant: 1,
    UserRank.support: 2,
    UserRank.analyst: 3,
    UserRank.developer: 4,
    UserRank.assistant: 5,
    UserRank.user: 6,
  };

  static const Map<UserRank, String> _persianNames = {
    UserRank.accountant: 'حسابدار',
    UserRank.support: 'پشتیبان',
    UserRank.analyst: 'تحلیلگر',
    UserRank.developer: 'توسعه‌دهنده',
    UserRank.assistant: 'دستیار',
    UserRank.user: 'کاربر',
  };

  static int getCode(UserRank rank) => _codes[rank] ?? 0;

  static String getPersianName(UserRank rank) => _persianNames[rank] ?? '';

  static UserRank fromCode(int code) {
    return _codes.entries
        .firstWhere(
          (entry) => entry.value == code,
          orElse: () => MapEntry(UserRank.user, 6),
        )
        .key;
  }
}
