import 'package:ecommerce/features/home/models/category_model.dart';
import 'package:ecommerce/features/home/models/product_model.dart';

final List<Category> fakeLoadingCategories = [
  Category(id: 'loading-1', name: 'Categoria', imageUrl: ''),
  Category(id: 'loading-2', name: 'Categoria', imageUrl: ''),
  Category(id: 'loading-3', name: 'Categoria', imageUrl: ''),
  Category(id: 'loading-4', name: 'Categoria', imageUrl: ''),
];

final List<Product> fakeLoadingProducts = [
  Product(
    id: 'loading-1',
    name: 'Produto',
    imageUrl: '',
    brand: 'Marca',
    price: 0,
    category: 'Categoria',
    categoryId: 'loading-category',
    description: 'Descrição do produto',
  ),
  Product(
    id: 'loading-2',
    name: 'Produto',
    imageUrl: '',
    brand: 'Marca',
    price: 0,
    category: 'Categoria',
    categoryId: 'loading-category',
    description: 'Descrição do produto',
  ),
  Product(
    id: 'loading-3',
    name: 'Produto',
    imageUrl: '',
    brand: 'Marca',
    price: 0,
    category: 'Categoria',
    categoryId: 'loading-category',
    description: 'Descrição do produto',
  ),
];
