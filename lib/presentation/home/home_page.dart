import 'package:flutter/material.dart';

import 'package:ihun_food_app/core/app_asset.dart';
import 'package:ihun_food_app/presentation/home/widgets/grid_category_food.dart';

import 'widgets/app_title_row.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
            ),
          ),
          title: const Text(
            'Home',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications,
                color: Colors.black,
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Image.asset(AppAsset.foodBanner),
            ),
            const GridCategoryFood(),
            const AppTileRow(title: 'Featured Today'),
          ],
        ));
  }
}

// Widget _bodyFood() {
//   return BlocBuilder<ProductsBloc, ProductsState>(
//     builder: (context, state) {
//       if (state is ProductsLoading) {
//         return const Center(
//           child: CircularProgressIndicator.adaptive(),
//         );
//       } else if (state is ProductsLoaded) {
//         return ListView.builder(
//           itemCount: state.products.length,
//           itemBuilder: (context, index) {
//             final product = state.products[index];
//             return ListTile(
//               title: Text(product.name),
//               subtitle: Text(product.description),
//             );
//           },
//         );
//       } else if (state is ProductsError) {
//         return Center(
//           child: Text(state.message),
//         );
//       } else {
//         return const Center(
//           child: Text('Unknown state'),
//         );
//       }
//     },
//   );
// }
