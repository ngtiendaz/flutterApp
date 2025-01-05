import 'package:fashion_app/common/utils/enums.dart';
import 'package:fashion_app/common/utils/kcolors.dart';
import 'package:fashion_app/common/utils/kstrings.dart';
import 'package:fashion_app/common/widgets/app_style.dart';
import 'package:fashion_app/common/widgets/back_button.dart';
import 'package:fashion_app/common/widgets/reusable_text.dart';
import 'package:fashion_app/src/orders/widgets/order_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class OrdersPage extends StatefulHookWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> with TickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 3, vsync: this);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: AppBackButton(
            onTap: () => context.go('/home'),
          ),
          title: ReusableText(
              text: AppText.kOrder,
              style: appStyle(
                  14, const Color.fromARGB(255, 91, 43, 43), FontWeight.w600)),
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(30.h),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                child: SizedBox(
                  height: 22.h,
                  child: TabBar(
                    controller: _tabController,
                    indicator: BoxDecoration(
                        color: const Color.fromARGB(255, 180, 67, 67),
                        borderRadius: BorderRadius.circular(12)),
                    labelPadding: EdgeInsets.zero,
                    labelColor: Kolors.kWhite,
                    dividerColor: Colors.transparent,
                    tabAlignment: TabAlignment.start,
                    isScrollable: true,
                    labelStyle: appStyle(11, Kolors.kPrimary, FontWeight.w600),
                    unselectedLabelStyle:
                        appStyle(11, Kolors.kGray, FontWeight.normal),
                    tabs: <Widget>[
                      Tab(
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          width: ScreenUtil().screenWidth / 3,
                          height: 25,
                          child: const Center(child: Text('Processing')),
                        ),
                      ),
                      Tab(
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          width: ScreenUtil().screenWidth / 3,
                          height: 25,
                          child: const Center(child: Text('Fulfilled')),
                        ),
                      ),
                      Tab(
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          width: ScreenUtil().screenWidth / 3,
                          height: 25,
                          child: const Center(child: Text('Cancelled')),
                        ),
                      )
                    ],
                  ),
                ),
              )),
        ),
        body: Container(
          color: Kolors.kOffWhite,
          height: ScreenUtil().screenHeight,
          child: TabBarView(controller: _tabController, children: const [
            OrderWidget(
              orderTypes: FetchOrdersTypes.pending,
            ),
            OrderWidget(
              orderTypes: FetchOrdersTypes.delivered,
            ),
            OrderWidget(
              orderTypes: FetchOrdersTypes.cancelled,
            ),
          ]),
        ),
      ),
    );
  }
}
