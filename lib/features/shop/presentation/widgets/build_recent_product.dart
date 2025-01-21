import 'package:buniashop/features/shop/data/model/product_model.dart';
import 'package:buniashop/utils/app_colors.dart';
import 'package:buniashop/utils/app_element_names.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildRecentProduct extends StatelessWidget {
  final List<Product> products;
  const BuildRecentProduct({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 15,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            mostRecentText,
            style: GoogleFonts.inter(
              color: productNameColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 170,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Container(
                  height: 200,
                  width: 110,
                  padding: EdgeInsets.all(1),
                  decoration: BoxDecoration(
                    color: textFieldFillColor,
                    border: Border.all(
                      color: bottonColor,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      child: Image.asset(
                        height: 110,
                        product.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 10,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(product.name),
                          Text(
                            "${product.price.toString()}\$",
                            style: GoogleFonts.inter(
                              color: productPriceColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    )
                  ]),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
