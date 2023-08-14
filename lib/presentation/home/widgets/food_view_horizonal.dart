import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ihun_food_app/bloc/products/products_bloc.dart';
import 'package:ihun_food_app/config/styles/text_styles.dart';

class FoodViewHorizonal extends StatelessWidget {
  const FoodViewHorizonal({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsBloc, ProductsState>(
      builder: (context, state) {
        if (state is ProductsLoading) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        } else if (state is ProductsLoaded) {
          return SizedBox(
            height: 300,
            child: ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.all(15),
              scrollDirection: Axis.horizontal,
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                final product = state.products[index];
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Food image with rating
                    Container(
                        margin: const EdgeInsets.only(right: 20),
                        height: 200,
                        width: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: NetworkImage(product.image[0]),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              top: 15,
                              right: 15,
                              child: Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      product.rating.toString(),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow[600],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )),
                    const SizedBox(height: 5),
                    // Food name
                    Text(product.name,
                        style: TextStyles.customStyle.bold.largeText),
                    const SizedBox(height: 3),
                    Text(
                      '12 kilometers away - 15 minutes',
                      style: TextStyles.defaultStyle.smallText,
                    ),
                  ],
                );
              },
            ),
          );
        } else if (state is ProductsError) {
          return Center(
            child: Text(state.message),
          );
        } else {
          return const Center(
            child: Text('Unknown state'),
          );
        }
      },
    );
  }
}
