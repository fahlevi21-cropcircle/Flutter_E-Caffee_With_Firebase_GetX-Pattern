import 'package:flutter/foundation.dart';
import 'package:my_caffee/app/data/enums/photo_order.dart';

extension PhotoOrderExtension on PhotoOrder {
  String get name => describeEnum(this);

  String get description {
    switch (this) {
      case PhotoOrder.latest:
        return 'latest';
      case PhotoOrder.oldest:
        return 'oldest';
      default:
        return 'popular';
    }
  }
}
