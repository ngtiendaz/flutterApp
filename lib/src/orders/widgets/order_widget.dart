import 'package:fashion_app/common/utils/enums.dart';
import 'package:fashion_app/common/widgets/empty_screen_widget.dart';
import 'package:fashion_app/src/notification/views/notification_shimmer.dart';
import 'package:fashion_app/src/orders/hooks/fetch_orders.dart';
import 'package:fashion_app/src/orders/widgets/order_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderWidget extends HookWidget {
  const OrderWidget({
    super.key,
    required this.orderTypes,
  });

  final FetchOrdersTypes orderTypes;

  @override
  Widget build(BuildContext context) {
    final results = fetchOrders(orderTypes);
    final orders = results.orders;
    final isLoading = results.isLoading;

    if (isLoading) {
      return const NotificationShimmer();
    }

    return orders.isNotEmpty
        ? ListView(
          padding: EdgeInsets.symmetric(horizontal: 14.w),
            children: List.generate(orders.length, (i) {
              return OrderTile(order: orders[i],);
            }),
          )
        : const EmptyScreenWidget();
  }
}
