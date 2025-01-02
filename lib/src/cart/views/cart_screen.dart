import 'package:fashion_app/common/services/storage.dart';
import 'package:fashion_app/common/utils/kcolors.dart';
import 'package:fashion_app/common/utils/kstrings.dart';
import 'package:fashion_app/common/widgets/app_style.dart';
import 'package:fashion_app/common/widgets/reusable_text.dart';
import 'package:fashion_app/common/widgets/shimmers/list_shimmer.dart';
import 'package:fashion_app/const/constants.dart';
import 'package:fashion_app/src/auth/views/login_screen.dart';
import 'package:fashion_app/src/cart/controllers/cart_notifier.dart';
import 'package:fashion_app/src/cart/hooks/fetch_cart.dart';
import 'package:fashion_app/src/cart/widgets/cart_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CartPage extends HookWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    String? accessToken = Storage().getString('accessToken');

    final results = fetchCart();
    final carts = results.cart;
    final isLoading = results.isLoading;
    final refetch = results.refetch;
    final error = results.error;

    if (accessToken == null) {
      return const LoginPage();
    }

    if (isLoading) {
      return const Scaffold(body: ListShimmer());
    }

    return Scaffold(
      appBar: AppBar(
        title: ReusableText(
            text: AppText.kCart,
            style: appStyle(15, Kolors.kPrimary, FontWeight.bold)),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        children: List.generate(carts.length, (i) {
          final cart = carts[i];
          return CartTile(
            cart: cart,
            onDelete: () {
              context.read<CartNotifier>().deleteCart(cart.id, refetch);
            },
            onUpdate: () {
              context.read<CartNotifier>().updateCart(cart.id, refetch);
            },
          );
        }),
      ),
      bottomNavigationBar: Consumer<CartNotifier>(
        builder: (context, cartNotifier, child) {
          return GestureDetector(
              onTap: () {
                context.push('/checkout');
              },
              child: cartNotifier.selectedCartItems.isNotEmpty
                  ? Container(
                      padding: EdgeInsets.fromLTRB(8.w, 0, 8.w, 90.h),
                      height: 130,
                      decoration: BoxDecoration(
                          borderRadius: kRadiusTop,
                          color: Kolors.kPrimaryLight),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ReusableText(
                                text: "Click To Checkout",
                                style: appStyle(
                                    15, Kolors.kWhite, FontWeight.w600)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ReusableText(
                                text:
                                    "\$ ${cartNotifier.totalPrice.toStringAsFixed(2)}",
                                style: appStyle(
                                    15, Kolors.kWhite, FontWeight.w600)),
                          )
                        ],
                      ),
                    )
                  : const SizedBox.shrink());
        },
      ),
    );
  }
}
