import 'package:ecommerce/features/home/models/category_model.dart';
import 'package:ecommerce/features/home/models/product_model.dart';

final List<Map<String, dynamic>> categoriesJson = [
  {'name': 'Frutas', 'imageUrl': 'https://i.postimg.cc/SNX7hc6F/Image.png'},
  {'name': 'Verduras', 'imageUrl': 'https://i.postimg.cc/xTky2LvV/Image-1.png'},
  {'name': 'Padaria', 'imageUrl': 'https://i.postimg.cc/Yq4fHQ6w/Image-2.png'},
  {
    'name': 'Importados',
    'imageUrl': 'https://i.postimg.cc/8PFBSLh2/Image-(1).png',
  },
];

final List<Map<String, dynamic>> productsJson = [
  {
    'brand': 'Natural da terra',
    'name': 'Rabanete',
    'imageUrl': 'https://i.postimg.cc/8Pt82Qmf/Image-1.png',
    'price': 10.99,
  },
  {
    'brand': 'Akatsu',
    'name': 'Acerola',
    'imageUrl': 'https://i.postimg.cc/BQMWr9B8/Image.png',
    'price': 7.99,
  },
  {
    'brand': 'Natural da terra',
    'name': 'Cogumelo',
    'imageUrl': 'https://i.postimg.cc/RVP8P1vw/Image-2.png',
    'price': 12.19,
  },
  {
    'brand': 'Natural da terra',
    'name': 'Cogumelo',
    'imageUrl': 'https://i.postimg.cc/RVP8P1vw/Image-2.png',
    'price': 12.19,
  },
];

final List<Category> fakeLoadingCategories = [
  Category(name: 'Frutas', imageUrl: ''),
  Category(name: 'Verduras', imageUrl: ''),
  Category(name: 'Padaria', imageUrl: ''),
  Category(name: 'Importados', imageUrl: ''),
];

final List<Product> fakeLoadingProducts = [
  Product(
    brand: 'Natural da terra',
    name: 'Rabanete',
    imageUrl: '',
    price: 10.99,
  ),
  Product(brand: 'Akatsu', name: 'Acerola', imageUrl: '', price: 7.99),
  Product(
    brand: 'Natural da terra',
    name: 'Cogumelo',
    imageUrl: '',
    price: 12.19,
  ),
  Product(
    brand: 'Natural da terra',
    name: 'Cogumelo',
    imageUrl: '',
    price: 12.19,
  ),
];
