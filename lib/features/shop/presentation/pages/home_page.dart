import 'package:buniashop/features/shop/data/model/lists/averissement_product.dart';
import 'package:buniashop/features/shop/data/model/lists/categorie_list.dart';
import 'package:buniashop/features/shop/data/model/lists/recent_product.dart';
import 'package:buniashop/features/shop/presentation/widgets/app_drower.dart';
import 'package:buniashop/features/shop/presentation/widgets/build_categorie.dart';
import 'package:buniashop/features/shop/presentation/widgets/build_recent_product.dart';
import 'package:buniashop/features/shop/presentation/widgets/carousel_builder.dart';
import 'package:buniashop/features/shop/presentation/widgets/searchbar.dart';
import 'package:buniashop/utils/app_colors.dart';
import 'package:buniashop/utils/app_element_names.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final TextEditingController _searchBarController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrower(),
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: productBottonColor),
        title: Text(
          appName,
          style: GoogleFonts.italianno(fontSize: 40),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: 25,
            ),
            child: Icon(
              Icons.local_grocery_store_outlined,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          spacing: 25,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: BuildSearchbar(
                controller: _searchBarController,
                keyboardType: TextInputType.text,
                suffix: Icon(Icons.filter_list),
                prefix: Icon(Icons.search),
                hintText: searchProductText,
              ),
            ),
            CarouselBuilder(
              products: advertisementProducts,
            ),
            BuildCategorie(categorie: categoryList),
            BuildRecentProduct(products: recentProductList),
          ],
        ),
      ),
    );
  }
}
