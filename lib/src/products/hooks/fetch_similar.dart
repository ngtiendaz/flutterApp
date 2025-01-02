import 'package:fashion_app/common/utils/environment.dart';
import 'package:fashion_app/src/categories/hook/results/category_products_results.dart';
import 'package:fashion_app/src/products/models/products_model.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:http/http.dart' as http;

FetchProduct fetchSimilar(int categotyId) {
  final products = useState<List<Products>>([]);
  final isLoading = useState(false);
  final error = useState<String?>(null);

  Future<void> fetchData() async {
    isLoading.value = true;

    try {
      Uri url = Uri.parse(
          '${Environment.appBaseUrl}/api/product/recommendations/?category=$categotyId');

      final response = await http.get(url);

      if (response.statusCode == 200) {
        products.value = productsFromJson(response.body);
      }
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  useEffect(() {
    fetchData();
    return;
  }, const []);

  void refetch() {
    isLoading.value = true;
    fetchData();
  }

  return FetchProduct(
      products: products.value,
      isLoading: isLoading.value,
      error: error.value,
      refetch: refetch);
}
