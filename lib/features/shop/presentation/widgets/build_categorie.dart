import 'package:buniashop/features/shop/data/model/categorie.dart';
import 'package:buniashop/utils/app_colors.dart';
import 'package:buniashop/utils/app_element_names.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildCategorie extends StatelessWidget {
  final List<Category> categorie;
  const BuildCategorie({
    super.key,
    required this.categorie,
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
            categoryText,
            style: GoogleFonts.inter(
              color: productNameColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 105,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categorie.length,
            itemBuilder: (context, index) {
              final category = categorie[index];
              return Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Column(
                  spacing: 10,
                  children: [
                    Container(
                      padding: EdgeInsets.all(1),
                      decoration: BoxDecoration(
                          color: colorWhite,
                          border: Border.all(
                            color: bottonColor,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(100)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          width: 70,
                          height: 70,
                          category.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Text(
                      category.name,
                      style: GoogleFonts.inter(
                        color: bottonColor,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
