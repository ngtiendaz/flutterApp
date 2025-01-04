import 'package:fashion_app/common/utils/enums.dart';
import 'package:flutter/material.dart';

class HomeTabNotifier with ChangeNotifier {
  QueryType queryType = QueryType.all;
  String _index = 'All';

  String get index => _index;

  void setIndex(String index) {
    _index = index;
    switch (index) {
      case 'All':
        setQueryType(QueryType.all);
        break;
      case 'Gaming':
        setQueryType(QueryType.gaming);
        break;
      case 'VanPhong':
        setQueryType(QueryType.vanphong);
        break;
      default:
        setQueryType(QueryType.all);
    }
    notifyListeners();
  }

  void setQueryType(QueryType q) {
    queryType = q;
    notifyListeners();
  }
}
