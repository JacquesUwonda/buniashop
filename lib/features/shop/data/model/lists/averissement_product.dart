import 'package:buniashop/features/shop/data/model/product_model.dart';
import 'package:buniashop/utils/images_url.dart';

final List<Product> advertisementProducts = [
  Product(
    id: '1',
    name: 'Chaussures de sport',
    description: 'Promotion spéciale sur les chaussures de sport !',
    price: 40.0,
    imageUrl: vedette,
    categoryId: '1',
  ),
  Product(
    id: '2',
    name: 'Montre en promotion',
    description: 'Montre classique à un prix réduit.',
    price: 100.0,
    imageUrl: decoration,
    categoryId: '2',
  ),
  Product(
    id: '3',
    name: 'Sac d’affaires',
    description: 'Sac idéal pour vos déplacements professionnels.',
    price: 70.0,
    imageUrl: blouse,
    categoryId: '3',
  ),
  Product(
    id: '4',
    name: 'Lunettes de soleil',
    description: 'Obtenez vos lunettes élégantes à petit prix.',
    price: 30.0,
    imageUrl: vedette,
    categoryId: '4',
  ),
  Product(
    id: '5',
    name: 'T-shirt en solde',
    description: 'T-shirt de qualité à un prix imbattable.',
    price: 20.0,
    imageUrl: decoration,
    categoryId: '5',
  ),
];
