import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../../core/app_asset.dart';

class FeatureFoodListPage extends StatelessWidget {
  const FeatureFoodListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feature Food List'),
      ),
      body: GridView.custom(
        shrinkWrap: true,
        padding: const EdgeInsets.all(8),
        // physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverWovenGridDelegate.count(
          crossAxisCount: 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 15,
          pattern: [
            const WovenGridTile(1),
            const WovenGridTile(
              5 / 7,
              crossAxisRatio: 1,
              alignment: AlignmentDirectional.centerEnd,
            ),
          ],
        ),
        childrenDelegate: SliverChildBuilderDelegate(
          childCount: 30,
          (context, index) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: const DecorationImage(
                image: AssetImage(AppAsset.foodBanner1),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
