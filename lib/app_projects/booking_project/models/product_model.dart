
import 'restaurant_model.dart';

class Product extends Restaurant {
  String nameProduct;
  String descriptionProduct;
  double price;
  String? imageProduct;
  Product({
    required this.nameProduct,
    required this.descriptionProduct,
    required this.price,
    this.imageProduct,
    super.address,
  });
}