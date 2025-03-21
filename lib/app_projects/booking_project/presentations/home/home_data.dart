
import '../../models/product_model.dart';
import '../../models/restaurant_model.dart';

class HomePageData {
  static List<Product> products = [
    Product(
        nameProduct: "Beef Ribs",
        descriptionProduct: "Good Beef",
        price: 15.00,
        imageProduct: "assets/images/img_food.png",
        address: "An Duong Vuong, Q5"),
    Product(
        nameProduct: "Beef Bacon",
        descriptionProduct: "Excellent Dish",
        price: 15.00,
        imageProduct: "assets/images/img_food.png",
        address: "Xuan Dieu, Tan Binh"),
    Product(
        nameProduct: "Fried Chicken",
        descriptionProduct: "Chicken",
        price: 15.00,
        imageProduct: "assets/images/img_food.png",
        address: "An Duong Vuong, Q5"),
    Product(
        nameProduct: "Salad mix fruits",
        descriptionProduct: "Good Salad",
        price: 15.00,
        imageProduct: "assets/images/img_food.png",
        address: "An Duong Vuong, Q5"),
  ];

  static List<Restaurant> restaurant = [
    Restaurant(
      nameRestaurant: "AN BBQ DONG KHOI",
      address:
      "Vincom Center, No. 70 Le Thanh Ton, Ben Nghe Ward, District 1, HCMC",
      image: "restaurant.png",
    ),
    Restaurant(
        nameRestaurant: "AN BBQ SU VAN HANH",
        address: "No. 716 Su Van Hanh, Ward 12, District 10, HCMC",
        image: "restaurant.png"),
    Restaurant(
        nameRestaurant: "AN BBQ NGUYEN VAN CU",
        address:
        "No. 235 Nguyen Van Cu, Nguyen Cu Trinh Ward, District 10, HCMC",
        image: "restaurant.png"),
  ];
}