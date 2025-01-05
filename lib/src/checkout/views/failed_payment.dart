import 'package:fashion_app/common/utils/kcolors.dart';
import 'package:fashion_app/common/widgets/app_style.dart';
import 'package:fashion_app/common/widgets/reusable_text.dart';
import 'package:fashion_app/const/constants.dart';
import 'package:fashion_app/const/resource.dart';
import 'package:fashion_app/src/cart/controllers/cart_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class FailedPayment extends StatelessWidget {
  const FailedPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: ReusableText(
            text: "Payment",
            style: appStyle(
                16, const Color.fromARGB(255, 91, 43, 43), FontWeight.w600)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              R.ASSETS_IMAGES_FAILED_PNG,
              width: 250.w,
              height: 250.h,
            ),
          ),
          Center(
              child: ReusableText(
            text: 'Payment Failed!',
            style: appStyle(
                20, const Color.fromARGB(255, 91, 43, 43), FontWeight.w600),
          )),
          SizedBox(
            height: 10.h,
          ),
          Center(
              child: ReusableText(
            text: 'Oops! Payment Failed! Please Try Again',
            style: appStyle(14, Kolors.kGray, FontWeight.normal),
          ))
        ],
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          context.read<CartNotifier>().setPaymentUrl('');
          // context
          //     .read<NotificationNotifier>()
          //     .setReloadCount(NotificationCount.update);
          context.go('/home');
        },
        child: Container(
          height: 80,
          width: ScreenUtil().screenWidth,
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 91, 43, 43),
              borderRadius: kRadiusTop),
          child: Center(
            child: ReusableText(
                text: "Continue to Home",
                style: appStyle(16, Kolors.kWhite, FontWeight.w600)),
          ),
        ),
      ),
    );
  }
}
