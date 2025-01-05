import 'package:cached_network_image/cached_network_image.dart';
import 'package:fashion_app/common/utils/kcolors.dart';
import 'package:fashion_app/common/widgets/app_style.dart';
import 'package:fashion_app/common/widgets/reusable_text.dart';
import 'package:fashion_app/const/constants.dart';
import 'package:fashion_app/src/cart/controllers/cart_notifier.dart';
import 'package:fashion_app/src/cart/models/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CheckoutTile extends StatelessWidget {
  const CheckoutTile({super.key, required this.cart});

  final CartModel cart;

  @override
  Widget build(BuildContext context) {
    return Consumer<CartNotifier>(
      builder: (context, cartNotifier, child) {
        return Padding(
          padding: EdgeInsets.only(bottom: 8.h),
          child: Container(
            width: ScreenUtil().screenWidth,
            height: 90.h,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 180, 67, 67).withOpacity(0.2),
                borderRadius: kRadiusAll),
            child: SizedBox(
              height: 85.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                            color: Kolors.kWhite,
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(12),
                              topRight: Radius.circular(12),
                            )),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: kRadiusAll,
                              child: SizedBox(
                                width: 76.w,
                                height: double.infinity,
                                child: CachedNetworkImage(
                                  imageUrl: cart.product.imageUrls[0],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: ScreenUtil().screenWidth * .4,
                            child: ReusableText(
                                text: cart.product.title,
                                style: appStyle(
                                    12, Kolors.kDark, FontWeight.normal)),
                          ),
                          // ReusableText(
                          //     text:
                          //         'Size: ${cart.size}   ||   Color: ${cart.color}'
                          //             .toUpperCase(),
                          //     style: appStyle(
                          //         12, Kolors.kGray, FontWeight.normal)),
                          SizedBox(
                            width: ScreenUtil().screenWidth * .5,
                            child: Text(cart.product.description,
                                maxLines: 2,
                                textAlign: TextAlign.justify,
                                style: appStyle(
                                    9, Kolors.kGray, FontWeight.normal)),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          cartNotifier.setSelectedCounter(
                              cart.id, cart.quantity);
                        },
                        onDoubleTap: () {},
                        child: Container(
                          width: 40.w,
                          height: 20.h,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color.fromARGB(255, 122, 59, 59),
                                width: 0.5,
                              ),
                              borderRadius: BorderRadius.circular(4.0)),
                          child: ReusableText(
                              text: "* ${cart.quantity}",
                              style: appStyle(
                                  12,
                                  const Color.fromARGB(255, 151, 63, 63),
                                  FontWeight.normal)),
                        ),
                      ),
                      SizedBox(
                        height: 6.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 6.w),
                        child: ReusableText(
                            text:
                                "\$ ${(cart.quantity * cart.product.price).toStringAsFixed(2)}",
                            style: appStyle(
                                12,
                                const Color.fromARGB(255, 91, 43, 43),
                                FontWeight.w600)),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
