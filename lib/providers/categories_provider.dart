import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/data/request_helper.dart';

final categoriesProvider = Provider((ProviderRef ref) {
  return RequestHelper().fetchCategories();
});
