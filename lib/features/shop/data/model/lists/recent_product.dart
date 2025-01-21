import 'package:buniashop/features/shop/data/model/product_model.dart';
import 'package:buniashop/utils/images_url.dart';

final List<Product> recentProductList = [
  Product(
    id: '1',
    name: 'Laptop HP',
    description: 'Chaussures confortables pour le sport et les loisirs.',
    price: 500.0,
    imageUrl: laptop,
    categoryId: '1',
  ),
  Product(
    id: '2',
    name: 'Fleurs',
    description: 'Montre élégante pour toutes les occasions.',
    price: 120.0,
    imageUrl: decoration,
    categoryId: '2',
  ),
  Product(
    id: '3',
    name: 'Robe Femme',
    description: 'Sac spacieux pour le travail et les voyages.',
    price: 80.0,
    imageUrl: vetementsGroupImage,
    categoryId: '3',
  ),
  Product(
    id: '4',
    name: 'Chaussures',
    description: 'T-shirt doux et confortable en coton biologique.',
    price: 25.0,
    imageUrl: vedette,
    categoryId: '5',
  ),
  Product(
    id: '5',
    name: 'Accer',
    description: 'Veste élégante en cuir véritable.',
    price: 200.0,
    imageUrl: laptop,
    categoryId: '6',
  ),
  Product(
    id: '6',
    name: 'Robe',
    description: 'Lunettes élégantes avec protection UV.',
    price: 35.0,
    imageUrl: vetementsGroupImage,
    categoryId: '4',
  ),
];
