import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ihun_food_app/src/core/widgets/app_appbar.dart';
import 'package:ihun_food_app/src/core/widgets/app_cached_image_widget.dart';

import 'package:ihun_food_app/src/features/products/domain/entities/product.dart';

import '../../../../config/styles/text_styles.dart';
import '../../../../core/widgets/app_icontext_badge.dart';
import '../bloc/products_bloc.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _controller = TextEditingController();
  late ProductsBloc _productsBloc;

  @override
  void initState() {
    super.initState();
    _productsBloc = context.read<ProductsBloc>();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildPreferredSizeWidget('Search'),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Center(
              child: TextField(
                cursorColor: Colors.black,
                controller: _controller,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  suffixIcon: _ClearButton(onPressed: () {
                    _controller.text = '';
                    _productsBloc.add(
                      const SearchingProduct(query: ''),
                    );
                  }),
                  labelText: 'Find your favorite food',
                  border: const OutlineInputBorder(),
                  focusColor: Colors.black,
                  labelStyle: TextStyles.defaultStyle,
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
                onChanged: (text) {
                  _productsBloc.add(
                    SearchingProduct(query: text),
                  );
                },
              ),
            ),
          ),
          Divider(
            color: Colors.black,
            endIndent: 20.w,
            indent: 20.w,
          ),
          BlocBuilder<ProductsBloc, ProductsState>(
            builder: (context, state) {
              return switch (state) {
                ProductsLoaded() =>
                  const Text('Please enter a term to begin search'),
                ProductsError() =>
                  const Text('Something went wrong, check your connection'),
                SearchProductLoading() =>
                  const CircularProgressIndicator.adaptive(),
                SearchProductSuccess() => state.products.isEmpty
                    ? const Text('No Results Found for your query')
                    : Expanded(child: _SearchResults(items: state.products)),
                SearchProductEmptyList() => const Text('No Results'),
                SearchProductError() => Text(state.message),
                _ => const Text(
                    'Something went wrong, check your connection',
                  ),
              };
            },
          )
        ],
      ),
    );
  }
}

class _ClearButton extends StatelessWidget {
  const _ClearButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) => IconButton(
        icon: const Icon(
          Icons.clear,
          color: Colors.black,
        ),
        onPressed: onPressed,
      );
}

class _SearchResults extends StatelessWidget {
  const _SearchResults({Key? key, required this.items}) : super(key: key);

  final List<ProductEntity> items;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return _SearchResultItem(item: items[index]);
      },
    );
  }
}

class _SearchResultItem extends StatelessWidget {
  const _SearchResultItem({Key? key, required this.item}) : super(key: key);

  final ProductEntity item;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        leading: AppCachedNetworkImage(
          imageUrl: item.image[0],
          width: 80.w,
          height: 80.h,
        ),
        title: Text(
          item.name,
          style: TextStyles.defaultStyle.bold.mediumText,
        ),
        subtitle: Row(
          children: [
            AppTextBadge(
              label: item.rating.toString(),
              icon: Icons.star,
              color: Colors.yellow,
            ),
            const SizedBox(width: 5),
            AppTextBadge(
              label: item.loved.toString(),
              icon: Icons.favorite,
              color: Colors.red,
            ),
          ],
        ),
        trailing: Text(
          item.price,
          style: TextStyles.defaultStyle.bold.mediumText,
        ));
  }
}
