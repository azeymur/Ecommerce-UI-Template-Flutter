import 'package:ecommerce_template/localization/locals.dart';
import 'package:ecommerce_template/model/order_status.dart';
import 'package:flutter/material.dart';

extension OrderStatusExtension on OrderStatus {
  String friendlyName(BuildContext context) {
    final locals = Locals.of(context);

    switch (this) {
      case OrderStatus.delivered:
        return locals.delivered;
      case OrderStatus.processing:
        return locals.processing;
      case OrderStatus.shipped:
        return locals.shipped;
      default:
        return locals.cancelled;
    }
  }

  IconData get iconData {
    switch (this) {
      case OrderStatus.delivered:
        return Icons.check_circle;
      case OrderStatus.processing:
        return Icons.incomplete_circle;
      case OrderStatus.shipped:
        return Icons.local_shipping;
      default:
        return Icons.cancel;
    }
  }
}
