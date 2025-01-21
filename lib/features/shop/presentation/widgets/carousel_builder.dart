import 'package:buniashop/features/shop/data/model/product_model.dart';
import 'package:buniashop/features/shop/presentation/logic/cubit/dot_indicator_cubit.dart';
import 'package:buniashop/features/shop/presentation/widgets/avertisement_card.dart';
import 'package:buniashop/utils/app_colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarouselBuilder extends StatelessWidget {
  final List<Product> products;
  const CarouselBuilder({super.key, required this.products});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DotIndicatorCubit, int>(
      builder: (context, currentIndex) {
        return Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 180.0,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 5),
                enlargeCenterPage: true,
                viewportFraction: 0.9,
                aspectRatio: 16 / 9,
                onPageChanged: (index, reason) {
                  context.read<DotIndicatorCubit>().updateIndex(index);
                },
              ),
              items: products.map((product) {
                return Builder(
                  builder: (BuildContext context) {
                    return AdvertisementCard(product: product);
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                products.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: currentIndex == index ? 20 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: currentIndex == index
                        ? productBottonColor
                        : Colors.grey,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
