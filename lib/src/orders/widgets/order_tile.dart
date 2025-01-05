import 'package:fashion_app/common/utils/kcolors.dart';
import 'package:fashion_app/common/widgets/app_style.dart';
import 'package:fashion_app/common/widgets/reusable_text.dart';
import 'package:fashion_app/const/constants.dart';
import 'package:fashion_app/src/orders/models/orders_model.dart';
import 'package:fashion_app/src/reviews/controller/rating_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class OrderTile extends StatelessWidget {
  final OrdersModel order;

  const OrderTile({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(order.orderProducts.length, (i) {
        final product = order.orderProducts[i];
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: ClipRRect(
              borderRadius: kRadiusAll,
              child: Container(
                width: ScreenUtil().screenWidth,
                height: 90,
                color: Kolors.kWhite,
                child: SizedBox(
                  height: 85.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(12),
                                    topRight: Radius.circular(12))),
                            child: ClipRRect(
                              borderRadius: kRadiusAll,
                              child: SizedBox(
                                width: 76.w,
                                height: double.infinity,
                                child: Image.network(
                                  product.imageUrl,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 150.w,
                                child: Text(
                                  product.title,
                                  style: appStyle(
                                    12,
                                    Kolors.kDark,
                                    FontWeight.bold, // Đổi sang in đậm
                                  ),
                                  overflow: TextOverflow
                                      .ellipsis, // Hiển thị dấu "..." nếu quá dài
                                  maxLines: 1, // Giới hạn hiển thị 1 dòng
                                ),
                              ),
                              // ReusableText(
                              //     text:
                              //         "Size : ${product.size}     Color : ${product.color} "
                              //             .toUpperCase(),
                              //     style: appStyle(
                              //         12, Kolors.kGray, FontWeight.normal)),
                              GestureDetector(
                                onTap: () {
                                  if (!order.rated
                                      .contains(product.productId)) {
                                    context
                                        .read<RatingNotifier>()
                                        .setData(product);
                                    context
                                        .read<RatingNotifier>()
                                        .setId(order.id);
                                    context.push('/review');
                                  }
                                },
                                child: Container(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  decoration: BoxDecoration(
                                      color: order.rated
                                              .contains(product.productId)
                                          ? Kolors.kGray
                                          : const Color.fromARGB(
                                              255, 163, 87, 87),
                                      borderRadius: BorderRadius.circular(6)),
                                  child: ReusableText(
                                      text: order.rated
                                              .contains(product.productId)
                                          ? "Reviewed"
                                          : "Review",
                                      style: appStyle(12, Kolors.kWhite,
                                          FontWeight.normal)),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 6.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              onDoubleTap: () {},
                              child: Container(
                                width: 40.w,
                                height: 20.h,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color:
                                          const Color.fromARGB(255, 91, 43, 43),
                                      width: 0.5,
                                    ),
                                    borderRadius: BorderRadius.circular(4.0)),
                                child: ReusableText(
                                    text: "* ${product.quantity}",
                                    style: appStyle(
                                        12,
                                        const Color.fromARGB(255, 91, 43, 43),
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
                                      "\$ ${(product.quantity * product.price).toStringAsFixed(2)}",
                                  style: appStyle(
                                      12, Kolors.kPrimary, FontWeight.w600)),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )),
        );
      }),
    );
  }
}
