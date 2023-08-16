import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ihun_food_app/config/styles/text_styles.dart';
import 'package:ihun_food_app/core/widgets/app_icon_btn.dart';
import 'package:ihun_food_app/core/widgets/app_icontext_badge.dart';

import '../../repo/models/product_model.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key, required this.product});

  final ProductModel product;

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250.h,
            pinned: true,
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: AppIconButton(
                icon: Icons.close,
                onPressed: () => Navigator.pop(context),
                bgColor: Colors.white,
                iconColor: Colors.black,
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AppIconButton(
                  icon: Icons.favorite,
                  onPressed: () => Navigator.pop(context),
                  bgColor: Colors.white,
                  iconColor: Colors.red,
                ),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                widget.product.image[0],
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Text(widget.product.name,
                          style: TextStyles.defaultStyle.bold.largeText),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          AppTextBadge(
                            icon: Icons.star,
                            label: widget.product.rating.toString(),
                            color: Colors.yellow[600]!,
                          ),
                          AppTextBadge(
                            icon: Icons.favorite,
                            label: widget.product.loved.toString(),
                            color: Colors.red[600]!,
                          ),
                        ],
                      ),
                      Text(widget.product.description,
                          style: TextStyles.defaultStyle),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 80.h,
        child: Column(
          children: [
            const Divider(
              thickness: 1,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.product.price.toString(),
                    style: TextStyles.defaultStyle.bold.largeText,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    child: Text(
                      'Add to Cart',
                      style: TextStyles.defaultStyle.bold.largeText.whiteText,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
