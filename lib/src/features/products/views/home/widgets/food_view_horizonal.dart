import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/styles/text_styles.dart';
import '../../../../../core/widgets/app_cached_image_widget.dart';

import '../../bloc/products_bloc.dart';
import '../../product_detail/product_detail.dart';

class FoodViewHorizonal extends StatefulWidget {
  const FoodViewHorizonal({super.key});

  @override
  State<FoodViewHorizonal> createState() => _FoodViewHorizonalState();
}

class _FoodViewHorizonalState extends State<FoodViewHorizonal> {
  late ProductsBloc _productsBloc;
  @override
  void initState() {
    super.initState();
    _productsBloc = context.read<ProductsBloc>()..add(const GetProducts());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsBloc, ProductsState>(
      builder: (context, state) {
        return switch (state) {
          ProductsLoading() => const Center(
              child: CircularProgressIndicator.adaptive(),
            ),
          ProductsLoaded() => SizedBox(
              height: 300.h,
              child: ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                scrollDirection: Axis.horizontal,
                itemCount: state.products.length,
                itemBuilder: (context, index) {
                  final product = state.products[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return ProductDetail(product: product);
                          },
                        ),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Food image with rating
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Stack(
                                children: [
                                  AppCachedNetworkImage(
                                    imageUrl: product.image[0],
                                    width: 280.w,
                                    height: 200.h,
                                    customErrorWidget: Container(
                                      width: 200.w,
                                      height: 200.h,
                                      color: Colors.grey[300],
                                      child: const Icon(Icons.error),
                                    ),
                                  ),
                                  Positioned(
                                    top: 10,
                                    left: 10,
                                    child: Container(
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                        ),

                        const SizedBox(height: 5),
                        // Food name
                        Text(product.name,
                            style: TextStyles.customStyle.bold.mediumText),
                        const SizedBox(height: 3),
                        Text(
                          '12 kilometers away - 15 minutes',
                          style: TextStyles.defaultStyle.smallText,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ProductsError() => Center(
              child: Text(state.message),
            ),
          ProductsLoadedEmtyList() => const Center(
              child: Text('Empty list'),
            ),
          _ => const Center(
              child: Text('Something went wrong, check your connection'),
            ),
        };
      },
    );
  }
}
