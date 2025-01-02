import 'package:fashion_app/common/utils/kcolors.dart';
import 'package:fashion_app/common/widgets/app_style.dart';
import 'package:fashion_app/common/widgets/reusable_text.dart';
import 'package:fashion_app/src/addresses/hooks/fetch_default.dart';
import 'package:fashion_app/src/home/widgets/notification_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends HookWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final rzlt = fetchDefaultAddress();
    final address = rzlt.address;
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 3.0),
            child: ReusableText(
                text: "Location",
                style: appStyle(12, const Color.fromARGB(255, 247, 35, 35),
                    FontWeight.normal)),
          ),
          SizedBox(
            height: 5.h,
          ),
          Row(
            children: [
              const Icon(
                Ionicons.location,
                size: 16,
                color: Color.fromARGB(255, 103, 206, 62),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 6.0),
                child: SizedBox(
                  width: ScreenUtil().screenWidth * 0.7,
                  child: Text(
                    address == null
                        ? "Please select a location"
                        : address.address,
                    maxLines: 1,
                    style: appStyle(14, const Color.fromARGB(255, 0, 0, 0),
                        FontWeight.w500),
                  ),
                ),
              )
            ],
          )
        ],
      ),
      actions: const [NotificationWidget()],
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(55.h),
        child: GestureDetector(
          onTap: () {
            context.push('/search');
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 8.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 6.w),
                  child: Container(
                    height: 40.h,
                    width: ScreenUtil().screenWidth - 80,
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 0.5,
                          color: const Color.fromARGB(255, 255, 30, 30),
                        ),
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const Icon(
                            Ionicons.search,
                            size: 20,
                            color: Color.fromARGB(255, 235, 74, 74),
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          ReusableText(
                              text: "Search Products",
                              style: appStyle(
                                  14,
                                  const Color.fromARGB(255, 0, 0, 0),
                                  FontWeight.w400))
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 40.h,
                  width: 40.w,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 236, 60, 60),
                      borderRadius: BorderRadius.circular(9)),
                  child: const Icon(
                    FontAwesome.sliders,
                    color: Kolors.kWhite,
                    size: 20,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
