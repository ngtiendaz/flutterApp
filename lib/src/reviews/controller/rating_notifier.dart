// ignore_for_file: use_build_context_synchronously

import 'package:fashion_app/common/services/storage.dart';
import 'package:fashion_app/common/utils/environment.dart';
import 'package:fashion_app/src/orders/models/orders_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

class RatingNotifier with ChangeNotifier {
  OrderProduct? order;

  void setData(OrderProduct o) {
    order = o;
    notifyListeners();
  }

  double _r = 0.0;

  double get rating => _r;

  void setRating(double r) {
    _r = r;
    notifyListeners();
  }

  int _orderId = 0;

  int get orderId => _orderId;

  void setId(int i) {
    _orderId = i;
    notifyListeners();
  }

  void addReview(String data, BuildContext context) async {
    String? accessToken = Storage().getString('accessToken');

    Uri url = Uri.parse('${Environment.appBaseUrl}/api/rating/review/');

    print(url);

    try {
      final response = await http.post(url,
          headers: {
            'Authorization': 'Token $accessToken',
            'Content-Type': 'application/json',
          },
          body: data);

      print(response.statusCode);
      if (response.statusCode == 201) {
        _r = 0.0;
        context.push('/orders');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
