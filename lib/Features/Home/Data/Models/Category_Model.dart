import 'package:solo/Core/Utils/Assets_Data.dart';

class CategoryModel {
  final String image;
  final String title;
  CategoryModel({required this.image, required this.title});
}

final List<CategoryModel> categoryList = [
  CategoryModel(image: AssetsData.Tshirt, title: 'T-shirt'),
  CategoryModel(image: AssetsData.pants, title: 'Pants'),
  CategoryModel(image: AssetsData.jacket, title: 'Jacket'),
  CategoryModel(image: AssetsData.shorts, title: 'Shorts'),
  CategoryModel(image: AssetsData.shoes, title: 'shoes'),
];
